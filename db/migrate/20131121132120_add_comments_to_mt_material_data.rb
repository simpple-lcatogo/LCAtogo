class AddCommentsToMtMaterialData < ActiveRecord::Migration
  def self.up
     add_column :mt_material_datas, :comments, :text       
  end

  def self.down
     remove_column :mt_material_datas, :comments    
  end
end
