class AddLargoPiletaToPartidas < ActiveRecord::Migration
  def self.up
    add_column :partidas, :largo_pileta, :string
  end

  def self.down
    remove_column :partidas, :largo_pileta
  end
end
