class Nadador < ActiveRecord::Base
  attr_accessible :nombre, :apellido,:fecha_nacimiento, :club, :sexo
  has_many :entrenamientos
  
#Agregar manejo de errores para la validacion en el metodo create del nadadors_controller 
#  validates :nombre,  :presence => true
#  validates :apellido, :presence => true
  def nombre_completo
    "#{apellido}, #{nombre}"  
  end
end
