class CreateBorradors < ActiveRecord::Migration
  def self.up
    create_table :borradors do |t|
      t.integer :nadador_id
      t.string :tipo_prueba
      t.decimal :tiempo
      t.integer :distancia
      t.boolean :competencia
      t.boolean :borrar

      t.timestamps
    end
  end

  def self.down
    drop_table :borradors
  end
end
