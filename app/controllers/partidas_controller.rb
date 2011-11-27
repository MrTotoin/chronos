class PartidasController < ApplicationController
  def new
    @competencia = Competencia.find(params[:competencia_id])
    @partida = @competencia.partidas.build
    @nadadores = Nadador.find(:all, :order => "apellido")
  end
  
  def create
    @competencia = Competencia.find(params[:competencia_id])
    @partida = @competencia.partidas.build(params[:partida])
    @partida.laps = params[:partida][:laps]    
    @partida.show_or_wait=false
   # tiempo_a_0
    if @partida.save
      flash[:success] = "La partida #{@partida.id} se ha creado correctamente."
      redirect_to competencia_path(@competencia)
    else
      flash[:error] = "La partida no se ha podido crear. Por favor, intentelo nuevamente."
      redirect_to root_path
    end
  end
  
  def index
    @competencia = Competencia.find(params[:competencia_id])
    @partidas = @competencia.partidas
  end
  
  def destroy
   # @competencia = Competencia.find(params[:competencia_id])
    @partida = Partida.find(params[:id])
    @competencia = @partida.competencia
    @partida.destroy
    flash[:error] = "La partida #{@partida.id} ha sido borrada"
    redirect_to competencia_path(@competencia)
  end
  
  def show
    @partida = Partida.find(params[:id])
    @competencia = @partida.competencia
    if @partida.show_or_wait==false
      #debo enviar el numero de laps a la unidad central para que pueda arrancar a contar tiempo
      mi_archivo = 'buffer_Tx.txt'
      fh = File.open( mi_archivo , 'w' )
      fh.puts("#{@partida.laps}")
      #llamo a programa intercambio para mandar el numero de laps a la unidad central
      system("./intercambio")
      fh.rewind
      fh.close
      #flash[:error] = "Atencion: no abandone esta pagina antes de que la partida se muestre como: <Partida ejecutada>. La adquisicion de datos puede verse comprometida."
    end
  end
  
  def wait
      @partida = Partida.find(params[:partida_id])
      @competencia = @partida.competencia
      if @partida.show_or_wait==true
        flash[:notice]="Partida ejecutada."
        return nil
      end   
         
      # llamo al programa ./intercambio que es el que le pregunta a la UC
      # y escribe en el archivo buffer_Rx.txt lo que la UC le respondio.
      system("./intercambio")
      mi_archivo = 'buffer_Rx.txt'
      fh = File.open( mi_archivo , 'r' )
      #leo linea 1 (STATUS)
      @status=fh.readline
      
      #la unidad central esta adquiriendo datos (los cronometros estan corriendo)
      if @status =~ /ADQ/ then 
        #escribo variable @estado para mostrar en la vista show de partidas;
        #@estado = "Adquiriendo tiempos..."
        flash[:notice]="Adquiriendo tiempos..."
        #leo tiempos y puestos de buffer_Rx. Luego guardo en la base de datos
        read_tiempos(fh)
        @partida.save
        puts "--ADQUIRIENDO--" 
      
      #la unidad central ya recibio el numero de laps que la mande al cargar la vista show de partidas
      #espero hasta que se presione el boton central de la unidad central (entonces paso a estado SET)  
      elsif @status =~ /PCOK/ then 
        #escribo variable @estado para mostrar en la vista show de partidas;
        #@estado="Esperando que se presione el boton COMIENZO de la Unidad Central"
        flash[:notice]="Presionar el boton COMIENZO de la Unidad Central"
        puts "--PCOK--"
        
      #la unidad central espera la senal de largada que de el juez de competencia;
      #cuando esto suceda paso a estado ADQ
      elsif @status =~ /SET/ then
        #escribo variable @estado para mostrar en la vista show de partidas 
        #@estado="Esperando orden de largada del juez de competencia"
        flash[:notice]="Esperando orden de largada del juez de competencia"
        puts "--SET--"
      
      #todos los nadadores terminaron de nadar y leo por ultima vez los tiempos y los 
      #puestos que estan en el archivo buffer_Rx
      elsif @status =~ /FIN/ then 
        #no escribo variable @estado, ya que cuando show_or_wait=true, entonces muestro
        #la leyenda "Partida ejecutada" en la vista show de partidas 
        #leo los tiempos y puestos por ultima vez, luego los guardo
        read_tiempos(fh)
        #modifico show_or_wait para que no se ejecute mas esta parte del codigo
        @partida.show_or_wait=true
        @partida.save
        flash[:notice]="Partida ejecutada."
        puts "--FINALIZADO--"
      end 
     
      
      fh.rewind
      fh.close
  end
  
  #este metodo es llamado desde el metodo WAIT para leer desde archivo
  #buffer_Rx (se le pasa el handler del archivo), y devuelve los valores
  #en la variable de instancia @partida
  def read_tiempos (fh)
    @tiempo1 = fh.readline.to_f
    @tiempo2 = fh.readline.to_f
    @tiempo3 = fh.readline.to_f
    @tiempo4 = fh.readline.to_f
    @tiempo5 = fh.readline.to_f
    @tiempo6 = fh.readline.to_f
    @tiempo7 = fh.readline.to_f
    @tiempo8 = fh.readline.to_f
    #ESCRIBO variable del registro
    @partida.tiempo_1 = @tiempo1
    @partida.tiempo_2 = @tiempo2
    @partida.tiempo_3 = @tiempo3
    @partida.tiempo_4 = @tiempo4
    @partida.tiempo_5 = @tiempo5
    @partida.tiempo_6 = @tiempo6
    @partida.tiempo_7 = @tiempo7
    @partida.tiempo_8 = @tiempo8
    #LEO Y ESCRIBO PUESTOS
    @partida.puesto_nadador_1 = fh.readline.to_i 
    @partida.puesto_nadador_2 = fh.readline.to_i 
    @partida.puesto_nadador_3 = fh.readline.to_i 
    @partida.puesto_nadador_4 = fh.readline.to_i 
    @partida.puesto_nadador_5 = fh.readline.to_i 
    @partida.puesto_nadador_6 = fh.readline.to_i 
    @partida.puesto_nadador_7 = fh.readline.to_i 
    @partida.puesto_nadador_8 = fh.readline.to_i 
    
  end
  
  
  #este metodo es llamado por el button_to de la vista show porque usa el metodo PUT
  #actualmente no se usa porque se guarda automaticamente cuando llega la palabra FIN 
  #en la linea de estado del archivo buffer.Rx.txt
  def update
    @partida = Partida.find(params[:id])
    @partida.show_or_wait=true
    @partida.save
    @competencia = @partida.competencia
    flash[:success] = "La partida #{@partida.id} ha sido guardada"
    redirect_to competencia_path(@competencia)
  end

/  def tiempo_a_0
    @partida.tiempo_1=0
    @partida.tiempo_2=0
    @partida.tiempo_3=0
    @partida.tiempo_4=0
    @partida.tiempo_5=0
    @partida.tiempo_6=0
    @partida.tiempo_7=0
    @partida.tiempo_8=0
  end/
end
   