class AddValueToBpManufacturingProcessVariableValues < ActiveRecord::Migration
  def self.up
    add_column :bp_manufacturing_process_variable_values, :value, :decimal, :precision => 30, :scale => 20
  end

  def self.down
    remove_column :bp_manufacturing_process_variable_values, :value
  end
end
