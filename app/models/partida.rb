class Partida < ActiveRecord::Base
    attr_accessible tiempo_1
    belongs_to :competencia
end
