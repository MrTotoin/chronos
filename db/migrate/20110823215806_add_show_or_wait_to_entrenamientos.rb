class AddShowOrWaitToEntrenamientos < ActiveRecord::Migration
  def self.up
    add_column :entrenamientos, :show_or_wait, :boolean
  end

  def self.down
    remove_column :entrenamientos, :show_or_wait
  end
end
