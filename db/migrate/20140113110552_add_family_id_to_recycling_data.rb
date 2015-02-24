class AddFamilyIdToRecyclingData < ActiveRecord::Migration
  def self.up
    add_column :recycling_datas, :family_id, :integer       
    add_column :recycling_datas, :manufacturing_data_id, :integer    
  end

  def self.down
    remove_column :recycling_datas, :family_id    
    remove_column :recycling_datas, :manufacturing_data_id    
  end
end
