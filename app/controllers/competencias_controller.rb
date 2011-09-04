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
      redirect_to '/competencias_home'    
     else
      @title = "FALLO AL GUARDAR"
      #
      #MIRAR listado 10.12 para mandar mensajes por flash
      #
      redirect_to root_path
     end
  end
  
end
