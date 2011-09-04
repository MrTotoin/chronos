class Partida < ActiveRecord::Base
  attr_accessible :competencia_id, :partida_id, :nadador_id, :tipo_prueba, :distancia, :show_or_wait, :andarivel, :puesto, :tiempo, :comentarios
end
