class CreateBpManufacturingProcessVariableValues < ActiveRecord::Migration
  def self.up
    create_table :bp_manufacturing_process_variable_values do |t|
      t.references :bp_material
      t.references :bp_manufacturing_process_variable
      t.references :bp_manufacturing_process
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_manufacturing_process_variable_values
  end
end
