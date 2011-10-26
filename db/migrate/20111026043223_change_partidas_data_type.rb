class ChangePartidasDataType < ActiveRecord::Migration
  def self.up
    change_column :partidas, :tiempo_1, :string
    change_column :partidas, :tiempo_2, :string
    change_column :partidas, :tiempo_3, :string
    change_column :partidas, :tiempo_4, :string
    change_column :partidas, :tiempo_5, :string
    change_column :partidas, :tiempo_6, :string
    change_column :partidas, :tiempo_7, :string
    change_column :partidas, :tiempo_8, :string
  end

  def self.down
    change_column :partidas, :tiempo_1, :decimal
    change_column :partidas, :tiempo_2, :decimal
    change_column :partidas, :tiempo_3, :decimal
    change_column :partidas, :tiempo_4, :decimal
    change_column :partidas, :tiempo_5, :decimal
    change_column :partidas, :tiempo_6, :decimal
    change_column :partidas, :tiempo_7, :decimal
    change_column :partidas, :tiempo_8, :decimal
  end
end
