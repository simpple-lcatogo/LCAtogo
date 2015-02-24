class CreateSeManufacturingDatasV2 < ActiveRecord::Migration
  def self.up
  	drop_table :se_manufacturing_datas

  	create_table :se_manufacturing_datas do |t|
      t.references :se_product
      t.string :sensor_node_description
      t.integer :number
      t.references :se_component
      t.float :quantity

      t.timestamps
    end

  end

  def self.down
  	drop_table :se_manufacturing_datas

  	create_table :se_manufacturing_datas do |t|
      t.string :sensor_type
      t.float :sensor_nodes
      t.float :ics
      t.float :memory
      t.float :pcb
      t.float :battery
      t.float :steel
      t.integer :se_product_id

      t.timestamps
    end
  end
end
