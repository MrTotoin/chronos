class AddLargoPiletaToCompetencia < ActiveRecord::Migration
  def self.up
    add_column :competencia, :largo_pileta, :integer
  end

  def self.down
    remove_column :competencia, :largo_pileta
  end
end
