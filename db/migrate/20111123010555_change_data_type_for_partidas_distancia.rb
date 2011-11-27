class ChangeDataTypeForPartidasDistancia < ActiveRecord::Migration
  def self.up
    change_table :partidas do |t|
          t.change :distancia, :integer
    end
  end

  def self.down
    change_table :partidas do |t|
          t.change :distancia, :string
    end
  end
end
