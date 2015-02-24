class RemoveValueFromBpManufacturingProcessVariableValues < ActiveRecord::Migration
  def self.up
    remove_column :bp_manufacturing_process_variable_values, :value
  end

  def self.down
    add_column :bp_manufacturing_process_variable_values, :value, :float
  end
end
