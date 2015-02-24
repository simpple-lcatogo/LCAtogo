class ChangeCostTypeForSeUseProductData < ActiveRecord::Migration
  def self.up
    change_table :se_use_product_datas do |t|
      t.change :cost, :float
    end
  end

  def self.down
    change_table :se_use_product_datas do |t|
      t.change :cost, :string
    end
  end
end
