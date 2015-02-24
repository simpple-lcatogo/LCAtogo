class AddMaterialTypeToManufacturingData < ActiveRecord::Migration
  def self.up
    add_column :manufacturing_datas, :material_user_type, :string
  end

  def self.down
    remove_column :manufacturing_datas, :material_user_type
  end
end
