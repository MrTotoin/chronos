class EntrenamientosController < ApplicationController

    def new
       @title = "Nuevo entrenamiento"
       @nadadores = Nadador.find(:all, :order => "apellido")
       @entrenamiento = Entrenamiento.new 
    end
    
    
    def esperando_datos
        @entrenamiento = Entrenamiento.new(params[:entrenamiento])
        @borrador = Borrador.new
        @borrador.nadador_id = @entrenamiento.nadador_id
        @borrador.tipo_prueba = @entrenamiento.tipo_prueba
        @borrador.distancia = @entrenamiento.distancia
        @borrador.competencia = false
        @borrador.borrar = false        
        if @borrador.save  
            @title = "Esperando datos"
        else
            @title = "FALLO AL GUARDAR"
            redirect_to entrenamientos_home_path
        end
    end
    
    
    
    def create
        @entrenamiento = Entrenamiento.new(params[:entrenamiento])
        
        # true = espero (la unidad central esta trabajando)
        # false = muestro un entrenamiento de la base de datos
        @entrenamiento.show_or_wait = false
        if @entrenamiento.save
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
        #aca deberia ir algo asi como lo de abajo (creo)
        #render :partial => 'entrenamientos/tiempo'
        #render :partial => 'entrenamientos/wait', :locals => { :variable_1 => @entrenamiento.tiempo.to_s, :variable_2 => @entrenamiento.tiempo.to_s}
        render :update do |page|
            page.replace_html :test_id, :text => @entrenamiento.tiempo.to_s
        end
        
    end
    
end
