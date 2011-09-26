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
        if @entrenamiento.save
            # => no uso render @entrenamiento porque
            # => hay que llamar al metodo show
            redirect_to @entrenamiento
        else
            @title = "FALLO AL GUARDAR"
            redirect_to entrenamientos_home_path
        end
       
    end
    
    def show
        @entrenamiento = Entrenamiento.find(params[:id])
        @title = "Entrenamiento de "+Nadador.find(@entrenamiento.nadador_id).nombre+Nadador.find(@entrenamiento.nadador_id).apellido
    end
    
    
    def wait
        # => QUERY A LA BASE DE DATOS
        @entrenamiento = Entrenamiento.find(params[:entrenamiento_id])
        # :entrenamiento_id viene del script de la vista show.html.erb
        #  @comments = Comment.where("article_id = ? and created_at > ?", params[:article_id], Time.at(params[:after].to_i))  
        # => :article_id y :after vienen de => public/javascripts/aplication.js
        # aca puedo usar render porque ya tengo el dato de la base de datos y el metodo show ya fue llamado, entonces show.html.erb ya fue cargado.
        #render :partial => @entrenamiento      # => la vista /entrenamientos/_entrenamiento.html.erb
               
    end
    
    def seleccionar
        @entrenamiento = Entrenamiento.new #la necesita el form_for
        @nadadores = Nadador.find(:all, :order => "apellido")
        
    end
    
    def list
        # vengo de la vista select.html.erb
        @entrenamientos = Entrenamiento.find(:all, :conditions => ["nadador_id = ?", params[:entrenamiento][:nadador_id]])
        @nadador = Nadador.find(params[:entrenamiento][:nadador_id])
    end
    
    def destroy
        @entrenamiento = Entrenamiento.find(params[:id])
        @entrenamiento.destroy
        redirect_to list_path
    end
    
    #este metodo es llamado por el button_to de la vista show porque usa el metodo PUT
    def update
      @entrenmamiento = Entrenamiento.find(params[:id])
      @entrenamiento.show_or_wait=true
      @entrenamiento.save
      redirect_to entrenamientos_home
    end
    
end
