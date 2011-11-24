class CompetenciasController < ApplicationController
  def new
    @title = "Nueva competencia"
    @competencia = Competencia.new
  end
  
  def create
    @competencia = Competencia.new(params[:competencia])
    @competencia.largo_pileta = params[:competencia][:largo_pileta]
    if @competencia.save  
      flash[:success] = "Se ha creado con exito la competencia #{@competencia.nombre}."
      @title = "Nadadores"
      #redirect_to competencia_path(@competencia)   
      redirect_to competencias_path
     else
      flash[:error] = "Ha ocurrido un error y la nueva competencia no pudo ser creada. Por favor intentelo de nuevo."
      @title = "FALLO AL GUARDAR"
      #
      #MIRAR listado 10.12 para mandar mensajes por flash
      #
      redirect_to root_path
     end
  end
  
  def show
      @competencia = Competencia.find(params[:id])
      @partidas = @competencia.partidas
      @partida = Partida.new
  end
  
  def index
    @competencias = Competencia.find(:all)
  end
  
   
  def edit
    @competencia = Competencia.find(params[:id])
    @title = "Editar competencia"
  end
  
  def update
      @competencia = Competencia.find(params[:id])
      @competencia.update_attributes(params[:competencia])
      @competencia.largo_pileta = params[:competencia][:largo_pileta]
      if @competencia.save
        flash[:success] = "Se han actualizado correctamente los datos de la competencia #{@competencia.nombre}."
        redirect_to competencia_path(@competencia)
      else
        @title = "Edit user"
        render 'edit'
      end
  end
  
  def destroy
    @competencia = Competencia.find(params[:id])
    @competencia.destroy
    flash[:error] = "La competencia #{@competencia.nombre} ha sido destruida junto con todas sus partidas."
    redirect_to competencias_path
  end
  
end
