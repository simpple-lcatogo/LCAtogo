class CreateBpManufacturingProcessUserVariables < ActiveRecord::Migration
  def self.up
    create_table :bp_manufacturing_process_user_variables do |t|
      t.references :bp_manufacturing_process_variable
      t.references :bp_product
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_manufacturing_process_user_variables
  end
end
