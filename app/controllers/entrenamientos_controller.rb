class EntrenamientosController < ApplicationController

    def new
       @title = "Nuevo entrenamiento"
       @nadadores = Nadador.find(:all, :order => "apellido")
       @entrenamiento = Entrenamiento.new 
    end
    
    def create
        @entrenamiento = Entrenamiento.new(params[:entrenamiento])
        @entrenamiento.show_or_wait = false
        # true = espero (la unidad central esta trabajando)
        # false = muestro un entrenamiento de la base de datos
        @entrenamiento.largo_pileta = params[:entrenamiento][:largo_pileta]    
        @entrenamiento.laps = params[:entrenamiento][:laps]    
        if @entrenamiento.save
            redirect_to @entrenamiento
        else
            @title = "FALLO AL GUARDAR"
            flash[:error] = "El entrenamiento no se ha podido crear. Por favor, intentelo nuevamente."
            redirect_to entrenamientos_home_path
        end
    end
    
    def show
        @entrenamiento = Entrenamiento.find(params[:id])
        @title = "Entrenamiento de "+Nadador.find(@entrenamiento.nadador_id).nombre+Nadador.find(@entrenamiento.nadador_id).apellido
        if @entrenamiento.show_or_wait==false
          #debo enviar el numero de laps a la unidad central para que pueda arrancar a contar tiempo
          mi_archivo = 'buffer_Tx.txt'
          fh = File.open( mi_archivo , 'w' )
          fh.puts("#{@entrenamiento.laps}")
          #llamo a programa intercambio para mandar el numero de laps a la unidad central
         # system("./intercambio")
          fh.rewind
          fh.close
          #flash[:error] = "Atencion: no abandone esta pagina antes de que la partida se muestre como: <Partida ejecutada>. La adquisicion de datos puede verse comprometida."
        end
    end
    
    
    def wait
        # => QUERY A LA BASE DE DATOS
        @entrenamiento = Entrenamiento.find(params[:entrenamiento_id])
        # :entrenamiento_id viene del script de la vista show.html.erb
        #  @comments = Comment.where("article_id = ? and created_at > ?", params[:article_id], Time.at(params[:after].to_i))  
        # => :article_id y :after vienen de => public/javascripts/aplication.js
        # aca puedo usar render porque ya tengo el dato de la base de datos y el metodo show ya fue llamado, entonces show.html.erb ya fue cargado.
        # render :partial => @entrenamiento
        # => la vista /entrenamientos/_entrenamiento.html.erb
        if @entrenamiento.show_or_wait==true
            return nil
        end   

        # llamo al programa ./intercambio que es el que le pregunta a la UC
        # y escribe en el archivo buffer_Rx.txt lo que la UC le respondio.
        #system("./intercambio")
        mi_archivo = 'buffer_Rx.txt'
        fh = File.open( mi_archivo , 'r' )
        #leo linea 1 (STATUS)
        @status=fh.readline
        
        #la unidad central esta adquiriendo datos (los cronometros estan corriendo)
        if @status =~ /ADQ/ then 
          #escribo variable @estado para mostrar en la vista show de partidas;
          @estado = "Adquiriendo tiempos..."
          flash[:notice]="Adquiriendo tiempos..."
          #leo tiempos y puestos de buffer_Rx. Luego guardo en la base de datos
          read_tiempos(fh)
          @entrenamiento.save
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
          @entrenamiento.show_or_wait=true
          @entrenamiento.save
          flash[:notice]="Entrenamiento ejecutado."
          puts "--FINALIZADO--"
        end
        
        fh.rewind
        fh.close
    end
    
    
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
      @entrenamiento.tiempo = @tiempo1
    end
    
    
    def seleccionar
        @entrenamiento = Entrenamiento.new #la necesita el form_for
        @nadadores = Nadador.find(:all, :order => "apellido")
    end
    
    def list
        # vengo de la vista seleccionar.html.erb
        @entrenamientos = Entrenamiento.find(:all, :conditions => ["nadador_id = ?", params[:entrenamiento][:nadador_id]])
        @nadador = Nadador.find(params[:entrenamiento][:nadador_id])
    end
    
    def destroy
        @entrenamiento = Entrenamiento.find(params[:id])
        @entrenamiento.destroy
        flash[:error] = "Entrenamiento borrado!"
        redirect_to entrenamientos_home_path
    end
    
    #este metodo es llamado por el button_to de la vista show porque usa el metodo PUT
    def update
      @entrenamiento = Entrenamiento.find(params[:id])
      @entrenamiento.show_or_wait=true
      @entrenamiento.save
      flash[:success] = "Entrenamiento guardado!"
      redirect_to entrenamientos_home_path
    end
    
end
