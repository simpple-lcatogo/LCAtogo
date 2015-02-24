class AddFieldToManufacturingData < ActiveRecord::Migration
  def self.up
 #   add_column :manufacturing_datas, :overhead_miscellaneous, :float, :default => 10 
  end

  def self.down
  #  remove_column :manufacturing_datas, :overhead_miscellaneous
  end
end
