class AddAspectToMaterialData < ActiveRecord::Migration
  def self.up
    add_column :material_datas, :aspect, :float   
    add_column :material_datas, :diagonal, :float
  end

  def self.down
    remove_column :material_datas, :aspect
    remove_column :material_datas, :diagonal    
  end
end
