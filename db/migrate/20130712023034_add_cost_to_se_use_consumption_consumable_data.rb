class AddCostToSeUseConsumptionConsumableData < ActiveRecord::Migration
  def self.up
  	add_column :se_use_consumption_consumable_datas, :cost, :float
  end

  def self.down
  	remove_column :se_use_consumption_consumable_datas, :cost
  end
end
