class AddDistanciaToEntrenamientos < ActiveRecord::Migration
  def self.up
    add_column :entrenamientos, :distancia, :integer
  end

  def self.down
    remove_column :entrenamientos, :distancia
  end
end
