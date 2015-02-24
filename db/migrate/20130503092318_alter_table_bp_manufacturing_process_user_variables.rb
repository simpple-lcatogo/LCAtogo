class AlterTableBpManufacturingProcessUserVariables < ActiveRecord::Migration
  def self.up
  	remove_column :bp_manufacturing_process_user_variables, :bp_product_id
  	add_column :bp_manufacturing_process_user_variables, :bp_manufacturing_data_id, :integer
  end

  def self.down
  	add_column :bp_manufacturing_process_user_variables, :bp_product_id, :integer
  	remove_column :bp_manufacturing_process_user_variables, :bp_manufacturing_data_id
  end
end
