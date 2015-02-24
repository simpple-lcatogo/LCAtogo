class CreateBpManufacturingProcessVariablesBpManufacturingProcesses < ActiveRecord::Migration
  def self.up
  	create_table :bp_manufacturing_process_variables_bp_manufacturing_processes, :id => false do |t|
  	  t.references :bp_manufacturing_process_variable
  	  t.references :bp_manufacturing_process
  	end	
  end

  def self.down
  	drop_table :bp_manufacturing_process_variables_bp_manufacturing_processes
  end
end
