class NewSeRecyclingDatas < ActiveRecord::Migration
  def self.up
  	drop_table :se_recycling_datas

  	create_table :se_recycling_datas do |t|
      t.references :se_product
      t.references :se_production_yield_loss_material
      t.float :with_sensor
      t.float :without_sensor
      t.float :recycling_revenue
	  t.text :description
	  t.float :global_warming_potential

      t.timestamps
    end
  end

  def self.down
  	drop_table :se_recycling_datas

  	create_table :se_recycling_datas do |t|
      t.float :with_sensors
      t.float :without_sensors
      t.string :custom_name
      t.float :co2
      t.float :revenue
      t.integer :se_product_id

      t.timestamps
    end
  end
end
