class CreateSeUseConsumptionDatas < ActiveRecord::Migration
  def self.up
    create_table :se_use_consumption_datas do |t|
      t.references :se_product
      t.references :se_energy_type
      t.references :se_energy_use
      t.float :with_sensor
      t.float :without_sensor

      t.timestamps
    end
  end

  def self.down
    drop_table :se_use_consumption_datas
  end
end
