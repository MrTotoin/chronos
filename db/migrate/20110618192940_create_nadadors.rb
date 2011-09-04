class CreateNadadors < ActiveRecord::Migration
  def self.up
    create_table :nadadors do |t|
      t.string :nombre
      t.string :apellido
      t.date :fecha_nacimiento
      t.string :club
      t.string :sexo

      t.timestamps
    end
  end

  def self.down
    drop_table :nadadors
  end
end
