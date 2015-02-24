class AddConsumptionToEnergyType < ActiveRecord::Migration
  def self.up
    add_column :energy_types, :consumption, :float      
  end

  def self.down
    remove_column :energy_types, :consumption   
  end
end
