class CreatePartidas < ActiveRecord::Migration
  def self.up
    create_table :partidas do |t|
      t.integer :competencia_id
      t.boolean :show_or_wait
      t.boolean :partida_rapida
      t.string :tipo_prueba
      t.string :distancia
      t.integer :nadador_id_1
      t.decimal :tiempo_1
      t.integer :nadador_id_2
      t.decimal :tiempo_2
      t.integer :nadador_id_3
      t.decimal :tiempo_3
      t.integer :nadador_id_4
      t.decimal :tiempo_4
      t.integer :nadador_id_5
      t.decimal :tiempo_5
      t.integer :nadador_id_6
      t.decimal :tiempo_6
      t.integer :nadador_id_7
      t.decimal :tiempo_7
      t.integer :nadador_id_8
      t.decimal :tiempo_8

      t.timestamps
    end
  end

  def self.down
    drop_table :partidas
  end
end
