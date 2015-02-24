class MoveFieldManufacturingData < ActiveRecord::Migration
  def self.up
    add_column :products, :overhead_miscellaneous, :float, :default => 10.0  
    remove_column :manufacturing_datas, :overhead_miscellaneous  
  end

  def self.down
    add_column :manufacturing_datas, :overhead_miscellaneous, :float, :default => 10.0  
    remove_column :products, :overhead_miscellaneous  
    
  end
end
