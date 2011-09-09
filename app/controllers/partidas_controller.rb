class PartidasController < ApplicationController
  def new
    @partida=Partida.new
    @nadadores = Nadador.find(:all, :order => "apellido")
  end
end
