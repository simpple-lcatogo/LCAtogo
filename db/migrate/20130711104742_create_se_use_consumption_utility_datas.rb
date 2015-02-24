class CreateSeUseConsumptionUtilityDatas < ActiveRecord::Migration
  def self.up
    create_table :se_use_consumption_utility_datas do |t|
      t.references :se_product
      t.references :se_utility
      t.float :with_sensor
      t.float :without_sensor
      t.float :electricity_consumption
      t.float :temperature_difference

      t.timestamps
    end
  end

  def self.down
    drop_table :se_use_consumption_utility_datas
  end
end
