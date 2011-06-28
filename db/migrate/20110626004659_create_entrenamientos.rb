class CreateEntrenamientos < ActiveRecord::Migration
  def self.up
    create_table :entrenamientos do |t|
      t.integer :nadador_id
      t.string :tipo_prueba
      t.string :distancia
      t.decimal :tiempo

      t.timestamps
    end
  end

  def self.down
    drop_table :entrenamientos
  end
end
