class EntrenamientosController < ApplicationController

    def agregar_entrenamiento
       @title = "Nuevo entrenamiento"
       @nadadores = Nadador.find(:all, :order => "apellido")
       @entrenamiento = Entrenamiento.new 
      
    end
    
    #aca me redirecciona 
        #el formulario de agregar_entrenamiento 
        #el boton guardar de la pagina new
    def create
        @entrenamiento = Entrenamiento.new(params[:entrenamiento])
        if @entrenamiento.save  
          @title = "Nadadores"
          redirect_to new_entrenamiento_path    
         else
          @title = "FALLO AL GUARDAR"
          redirect_to entrenamientos_home_path
         end
    end
    
    def new
      
    end   
        
    
end
