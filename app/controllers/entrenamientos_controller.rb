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
        
        #modificar este metodo para tomar el valor correspondiente de la tabla borrador y guardarlo en la tabla entrenamiento
       
    end
    
end
