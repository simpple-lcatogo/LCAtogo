class AddModuleText < ActiveRecord::Migration
  def self.up
    add_column :material_datas, :module_text, :string    
    add_column :manufacturing_datas, :module_text, :string    
  end

  def self.down
    remove_column :material_datas, :module_text
    remove_column :manufacturing_datas, :module_text    
  end
end
