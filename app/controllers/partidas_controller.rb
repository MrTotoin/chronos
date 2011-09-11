class PartidasController < ApplicationController
  def new
    @competencia = Competencia.find(params[:competencia_id])
    @partida = @competencia.partidas.build
    @nadadores = Nadador.find(:all, :order => "apellido")
  end
  
  def create
    @competencia = Competencia.find(params[:competencia_id])
    @partida = @competencia.partidas.build(params[:partida])
    @partida.show_or_wait=false
   # tiempo_a_0
    if @partida.save
      redirect_to competencia_path(@competencia)
    else
      redirect_to root_path
    end
  end
  
  def index
    @competencia = Competencia.find(params[:competencia_id])
    @partidas = @competencia.partidas
  end
  
  def destroy
   # @competencia = Competencia.find(params[:competencia_id])
    @partida = Partida.find(params[:id])
    @competencia = @partida.competencia
    @partida.destroy
    redirect_to competencia_path(@competencia)
  end
  
  def show
    @partida = Partida.find(params[:id])
    
  end
  
  def wait
    @partida = Partida.find(params[:partida_id])
    @competencia = @partida.competencia
  end

/  def tiempo_a_0
    @partida.tiempo_1=0
    @partida.tiempo_2=0
    @partida.tiempo_3=0
    @partida.tiempo_4=0
    @partida.tiempo_5=0
    @partida.tiempo_6=0
    @partida.tiempo_7=0
    @partida.tiempo_8=0
  end/
end
   