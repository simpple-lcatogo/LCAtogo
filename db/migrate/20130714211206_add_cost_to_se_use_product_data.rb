class AddCostToSeUseProductData < ActiveRecord::Migration
  def self.up
    add_column :se_use_product_datas, :cost, :integer
  end

  def self.down
    remove_column :se_use_product_datas, :cost
  end  
end
