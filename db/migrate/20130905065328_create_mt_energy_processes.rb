class CreateMtEnergyProcesses < ActiveRecord::Migration
  def self.up
    create_table :mt_energy_processes do |t|
      t.string :name
      t.integer :mt_energy_family_id
      t.string :unit
      
      t.timestamps
    end
  end

  def self.down
    drop_table :mt_energy_processes
  end
end
