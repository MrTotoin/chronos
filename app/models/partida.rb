class Partida < ActiveRecord::Base
    attr_accessible :id, :partida_rapida, :tipo_prueba, :laps
    attr_accessible :nadador_id_1, :nadador_id_2, :nadador_id_3, :nadador_id_4, :nadador_id_5, :nadador_id_6, :nadador_id_7, :nadador_id_8
    belongs_to :competencia
end
