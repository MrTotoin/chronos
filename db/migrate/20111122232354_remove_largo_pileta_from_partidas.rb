class RemoveLargoPiletaFromPartidas < ActiveRecord::Migration
  def self.up
    remove_column :partidas, :largo_pileta
  end

  def self.down
    add_column :partidas, :largo_pileta, :string
  end
end
