class AddModuleToMtMaterialData < ActiveRecord::Migration
  def self.up
     add_column :mt_material_datas, :module, :string     
  end

  def self.down
     remove_column :mt_material_datas, :module  
  end
end
