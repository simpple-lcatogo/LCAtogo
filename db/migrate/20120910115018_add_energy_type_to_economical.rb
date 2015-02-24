class AddEnergyTypeToEconomical < ActiveRecord::Migration
  def self.up
    add_column :electronic_economics, :energy_type_id, :integer    
  end

  def self.down
    remove_column :electronic_economics, :energy_type_id
  end
end
