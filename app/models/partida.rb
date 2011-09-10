class Partida < ActiveRecord::Base
    attr_accessible :id, :tiempo_1, :tipo_prueba, :nadador_id_1
    belongs_to :competencia
end
