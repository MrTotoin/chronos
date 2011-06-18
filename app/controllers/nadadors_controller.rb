class NadadorsController < ApplicationController
      def new
        @title = "Nuevo nadador"
        @nadador = Nadador.new #crea una variable de instancia para guardar los valores del formulario
      end

      def create
        @nadador = Nadador.new(params[:nadador]) #toma los valores que le pasa el formulario de new a travez de params[:nadador] y crea una nueva variable de instancia
        if @nadador.save  
          #flash[:success] = "Welcome to the Sample App!"
         # redirect_to @nadador
          @title = "Nadadores"
          render 'index'    #redirecciono al home de Nadadores    
        else
          @title = "Nadadores"
          render 'index'
        end
      end

      def index
        @title = "Nadadores"
      end

  end
