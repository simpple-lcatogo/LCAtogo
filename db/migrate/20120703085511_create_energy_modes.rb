class CreateEnergyModes < ActiveRecord::Migration
  def self.up
    create_table :energy_modes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :energy_modes
  end
end
