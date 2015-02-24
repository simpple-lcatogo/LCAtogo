class AddFieldsToStMaterialData < ActiveRecord::Migration
  def self.up
    add_column :st_material_datas, :user_material_name, :string    
    add_column :st_material_datas, :user_eco_costs, :float    
    add_column :st_material_datas, :user_unit, :string    
  end

  def self.down
    remove_column :st_material_datas, :user_material_name    
    remove_column :st_material_datas, :user_eco_costs    
    remove_column :st_material_datas, :user_unit    
  end
end
