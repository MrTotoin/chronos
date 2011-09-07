class Competencia < ActiveRecord::Base
  attr_accessible :nombre, :fecha
  has_many :partidas
end
