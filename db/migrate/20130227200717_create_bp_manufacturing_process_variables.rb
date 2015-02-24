class CreateBpManufacturingProcessVariables < ActiveRecord::Migration
  def self.up
    create_table :bp_manufacturing_process_variables do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_manufacturing_process_variables
  end
end