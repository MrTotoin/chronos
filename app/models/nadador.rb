class Nadador < ActiveRecord::Base
  attr_accessible :nombre, :apellido,:fecha_nacimiento, :club, :sexo

#Agregar manejo de errores para la validacion en el metodo create del nadadors_controller 
#  validates :nombre,  :presence => true
#  validates :apellido, :presence => true
  
end
