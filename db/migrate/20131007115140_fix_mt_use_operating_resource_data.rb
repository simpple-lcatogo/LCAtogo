class FixMtUseOperatingResourceData < ActiveRecord::Migration
  def self.up
    add_column :mt_use_operating_resource_datas, :mt_consumable_id, :integer 
    remove_column :mt_use_operating_resource_datas, :mt_family_id
    remove_column :mt_use_operating_resource_datas, :mt_material_id           
  end

  def self.down
    remove_column :mt_use_operating_resource_datas, :mt_consumable_id    
    add_column :mt_use_operating_resource_datas, :mt_family_id, :integer
    add_column :mt_use_operating_resource_datas, :mt_material_id, :integer
  end
end
