class AddRatioToMaterialData < ActiveRecord::Migration
  def self.up
    add_column :material_datas, :ratio, :float    
  end

  def self.down
    remove_column :material_datas, :ratio
  end
end
