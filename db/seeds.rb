# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Nadador.create(:nombre => 'Carlos', :apellido => 'Reyes', :fecha_nacimiento => '1983/12/30', :club => 'Boca',:sexo => 'M')
Nadador.create(:nombre => 'Juliana', :apellido => 'Treyes', :fecha_nacimiento => '1970/03/12', :club => 'Riber',:sexo => 'F')
Nadador.create(:nombre => 'Jacinto', :apellido => 'Pereyra', :fecha_nacimiento => '1978/12/30', :club => 'Deportivo San Fernando',:sexo => 'M')
Nadador.create(:nombre => 'Carolina', :apellido => 'Risso', :fecha_nacimiento => '1986/12/30', :club => 'Centro Gallego',:sexo => 'F')

