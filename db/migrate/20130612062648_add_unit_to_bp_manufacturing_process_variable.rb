class AddUnitToBpManufacturingProcessVariable < ActiveRecord::Migration
  def self.up
    add_column :bp_manufacturing_process_variables, :unit, :string      
  end

  def self.down
    remove_column :bp_manufacturing_process_variables, :unit
  end
end
