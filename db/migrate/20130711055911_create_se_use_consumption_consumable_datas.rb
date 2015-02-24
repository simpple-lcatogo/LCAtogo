class CreateSeUseConsumptionConsumableDatas < ActiveRecord::Migration
  def self.up
    create_table :se_use_consumption_consumable_datas do |t|
      t.references :se_product
      t.references :se_consumable
      t.float :with_sensor
      t.float :without_sensor
      t.text :description
      t.float :global_warming_potential

      t.timestamps
    end
  end

  def self.down
    drop_table :se_use_consumption_consumable_datas
  end
end
