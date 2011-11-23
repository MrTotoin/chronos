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
      flash[:success] = "La partida se ha creado correctamente."
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
    flash[:error] = "Partida borrada"
    redirect_to competencia_path(@competencia)
  end
  
  def show
    @partida = Partida.find(params[:id])
    @competencia = @partida.competencia
    if @partida.show_or_wait==false
      #debo enviar el numero de laps a la unidad central para que pueda arrancar a contar tiempo
      
    end
  end
  
  def wait
      @partida = Partida.find(params[:partida_id])
      @competencia = @partida.competencia
      if @partida.show_or_wait==true
          return nil
      end      
      # llamo al programa ./intercambio que es el que le pregunta a la UC
      # y escribe en el archivo buffer_Rx.txt lo que la UC le respondio.
      system("./intercambio")
      mi_archivo = 'buffer_Rx'
      fh = File.open( mi_archivo , 'r' )
      #leo linea 1 (STATUS)
      @status=fh.readline
      if @status =~ /ADQ/ then 
        #refresco DB (tiempos)
        #LEO tiempos de archivo
        @estado="ADQUIRIENDO..."
        read_tiempos(fh)
        #GUARDO en base de datos usando la variable de registro
        @partida.save
        puts "--ADQUIRIENDO--" 
        
      elsif @status =~ /PF/ then 
        #refresco DB (el reseteo de tiempos lo hace la UC, yo solo reflejo lo que pasa)
        #LEO tiempos de archivo
        @estado="PARTIDA EN FALSO"
        read_tiempos(fh)
        #GUARDO en base de datos usando la variable de registro
        @partida.save
        puts "--PARTIDA FALSA--"
      
      elsif @status =~ /FIN/ then 
        #refresco DB (tiempos y show_or_wait)
        #LEO tiempos de archivo
        @estado="FINALIZADO"
        read_tiempos(fh)
        #GUARDO en base de datos usando la variable de registro
        @partida.show_or_wait=true
        @partida.save
        #render competencia_path(@competencia)
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
    
  end
  
  
  #este metodo es llamado por el button_to de la vista show porque usa el metodo PUT
  def update
    @partida = Partida.find(params[:id])
    @partida.show_or_wait=true
    @partida.save
    @competencia = @partida.competencia
    flash[:success] = "Partida guardada"
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
   