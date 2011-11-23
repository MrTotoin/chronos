class AddPuestosToPartidas < ActiveRecord::Migration
  def self.up
    add_column :partidas, :puesto_nadador_1, :integer
    add_column :partidas, :puesto_nadador_2, :integer
    add_column :partidas, :puesto_nadador_3, :integer
    add_column :partidas, :puesto_nadador_4, :integer
    add_column :partidas, :puesto_nadador_5, :integer
    add_column :partidas, :puesto_nadador_6, :integer
    add_column :partidas, :puesto_nadador_7, :integer
    add_column :partidas, :puesto_nadador_8, :integer
  end

  def self.down
    remove_column :partidas, :puesto_nadador_8
    remove_column :partidas, :puesto_nadador_7
    remove_column :partidas, :puesto_nadador_6
    remove_column :partidas, :puesto_nadador_5
    remove_column :partidas, :puesto_nadador_4
    remove_column :partidas, :puesto_nadador_3
    remove_column :partidas, :puesto_nadador_2
    remove_column :partidas, :puesto_nadador_1
  end
end
