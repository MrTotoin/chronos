class NadadorsController < ApplicationController
      def new
        @title = "Nuevo nadador"
        @nadador = Nadador.new #crea una variable de instancia para guardar los valores del formulario
      end

      def create
        @nadador = Nadador.new(params[:nadador]) #toma los valores que le pasa el formulario de new a travez de params[:nadador] y crea una nueva variable de instancia
        if @nadador.save  
          #flash[:success] = "Welcome to the Sample App!"
          @title = "Nadadores"
          redirect_to new_nadador_path    
         else
          @title = "FALLO AL GUARDAR"
          #
          #MIRAR listado 10.12 para mandar mensajes por flash
          #
          redirect_to new_nadador_path
         end
      end
      
      
      #
      #NO FUNCIONA....ver
      def destroy
          @nadador = Nadador.find(params[:id])
          @nadador.destroy
          redirect_to nadadors_path
          #respond_to do |format|
          #  format.html { redirect_to(nadadors_path) }
          #  format.xml  { head :ok }
          #end 
      end

      def show
        @nadador = Nadador.find(params[:id])
      end
      
      def edit
        @nadador = Nadador.find(params[:id])
        @title = "Editar nadador"
      end
      
      def update
          @nadador = Nadador.find(params[:id])
          if @nadador.update_attributes(params[:nadador])
            #flash[:success] = "Profile updated."
            redirect_to @nadador
          else
            @title = "Edit user"
            render 'edit'
          end
        end
            
      def index
        @nadadores = Nadador.find(:all)
      end

end
