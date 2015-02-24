class AddScenarioToMtMaterials < ActiveRecord::Migration
  def self.up
    add_column :mt_material_datas, :scenario, :string    
    add_column :mt_predefined_supplier_datas, :scenario, :string
    add_column :mt_user_supplier_datas, :scenario, :string    
  end

  def self.down
    remove_column :mt_material_datas, :scenario    
    remove_column :mt_predefined_supplier_datas, :scenario    
    remove_column :mt_user_supplier_datas, :scenario    
  end
end
