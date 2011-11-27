class AddObservacionesAPartidasEntrenamientosPartidas < ActiveRecord::Migration
  # => todavia no la uso porque es medio paja de implementar el tema de los comentarios
  # => una opcion seria hacer una tabla con observaciones y linkearla como los entrenamientos
  # => se linkean a los nadadores (o las partidas a las competencias)
  def self.up
    #add_column :partidas, :observaciones, :text
    #add_column :competencias, :observaciones, :text
    #add_column :entrenamientos, :observaciones, :text
  end

  def self.down
    #remove_column :partidas, :laps
    #remove_column :competencias, :laps
    #remove_column :entrenamientos, :laps
  end
end
