class CompetenciasController < ApplicationController
  def new
    @title = "Nueva competencia"
    @nadadores = Nadador.find(:all, :order => "apellido")
    @competencia = Competencia.new
    @partida = Partida.new
  end
end
