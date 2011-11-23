class CambioDeNombreDeColumnaDistanciaEnPartidas < ActiveRecord::Migration
  def self.up
    rename_column :partidas, :distancia, :laps
  end

  def self.down
    rename_column :partidas, :laps, :distancia
  end
end
