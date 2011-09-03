class CreateCompetencia < ActiveRecord::Migration
  def self.up
    create_table :competencia do |t|
      t.string :nombre
      t.date :fecha

      t.timestamps
    end
  end

  def self.down
    drop_table :competencia
  end
end
