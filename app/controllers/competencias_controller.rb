class CompetenciasController < ApplicationController
  def new
    @title = "Nueva competencia"
    @competencia = Competencia.new
  end
  
  def create
    @competencia = Competencia.new(params[:competencia])
    if @competencia.save  
      #flash[:success] = "Welcome to the Sample App!"
      @title = "Nadadores"
      redirect_to competencia_path(@competencia)   
     else
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
      if @competencia.update_attributes(params[:competencia])
        redirect_to competencia_path(@competencia)
      else
        @title = "Edit user"
        render 'edit'
      end
  end
  
  def destroy
    @competencia = Competencia.find(params[:id])
    @competencia.destroy
    redirect_to competencias_path
  end
  
end
