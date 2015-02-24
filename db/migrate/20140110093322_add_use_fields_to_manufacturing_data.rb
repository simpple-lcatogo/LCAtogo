class AddUseFieldsToManufacturingData < ActiveRecord::Migration
  def self.up
    add_column :manufacturing_datas, :contained_data, :float 
    add_column :manufacturing_datas, :repair_contained_data, :float
    add_column :manufacturing_datas, :anticipated_data, :float
    add_column :manufacturing_datas, :repair_anticipated_data, :float    
  end

  def self.down
    remove_column :manufacturing_datas, :contained_data        
    remove_column :manufacturing_datas, :repair_contained_data
    remove_column :manufacturing_datas, :anticipated_data
    remove_column :manufacturing_datas, :repair_anticipated_data    
  end
end
