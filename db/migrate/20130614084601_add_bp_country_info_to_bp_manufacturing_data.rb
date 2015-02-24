class AddBpCountryInfoToBpManufacturingData < ActiveRecord::Migration
  def self.up
    add_column :bp_manufacturing_datas, :bp_country_info_id, :integer          
  end

  def self.down
    remove_column :bp_manufacturing_datas, :bp_country_info_id    
  end
end
