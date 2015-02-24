class AddMaterialExcelValue < ActiveRecord::Migration
  def self.up
    add_column :excel_values, :material_id, :integer
  end

  def self.down
    remove_column :excel_values, :material_id
  end
end
