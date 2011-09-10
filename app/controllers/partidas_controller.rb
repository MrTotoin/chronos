class PartidasController < ApplicationController
  def new
    @competencia = Competencia.find(params[:competencia_id])
    @partida = @competencia.partidas.build
    @nadadores = Nadador.find(:all, :order => "apellido")
  end
  
  def create
    @competencia = Competencia.find(params[:competencia_id])
    @partida = @competencia.partidas.build(params[:partida])
    if @partida.save
      redirect_to @competencia, :url => {:controller => :show, :action => :show}
    else
      redirect_to root_path
    end
  end
end
   