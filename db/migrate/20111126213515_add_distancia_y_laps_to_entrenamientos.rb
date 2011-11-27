class AddDistanciaYLapsToEntrenamientos < ActiveRecord::Migration
  def self.up
    add_column :entrenamientos, :laps, :integer
    change_table :entrenamientos do |t|
          t.change :distancia, :integer
    end
    rename_column :entrenamientos, :distancia, :largo_pileta
  end

  def self.down
    remove_column :entrenamientos, :laps
    change_table :entrenamientos do |t|
          t.change :distancia, :string
    end
    rename_column :entrenamientos, :largo_pileta, :distancia
  end
end
