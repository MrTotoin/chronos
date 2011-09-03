class CreatePartidas < ActiveRecord::Migration
  def self.up
    create_table :partidas do |t|
      t.integer :competencia_id
      t.integer :partida_id
      t.integer :nadador_id
      t.string :tipo_prueba
      t.string :distancia
      t.boolean :show_or_wait
      t.integer :andarivel
      t.integer :puesto
      t.decimal :tiempo
      t.string  :comentarios

      t.timestamps
    end
  end

  def self.down
    drop_table :partidas
  end
end
