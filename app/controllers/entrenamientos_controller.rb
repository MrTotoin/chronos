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
        #@entrenamiento = Entrenamiento.new(params[:entrenamiento])
        redirect_to entrenamientos_home_path
    end
    
   
   
        
    
end
