class FixMtUseAdditionalEnergyData < ActiveRecord::Migration
  def self.up
    add_column :mt_use_additional_energy_datas, :mt_energy_family_id, :integer
    add_column :mt_use_additional_energy_datas, :mt_energy_process_id, :integer  
    remove_column :mt_use_additional_energy_datas, :mt_family_id
    remove_column :mt_use_additional_energy_datas, :mt_material_id       
  end

  def self.down
    add_column :mt_use_additional_energy_datas, :mt_family_id, :integer
    add_column :mt_use_additional_energy_datas, :mt_material_id, :integer  
    remove_column :mt_use_additional_energy_datas, :mt_energy_family_id
    remove_column :mt_use_additional_energy_datas, :mt_energy_process_id        
  end
end
