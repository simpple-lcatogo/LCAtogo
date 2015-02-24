class CreateSeManufacturingDatas < ActiveRecord::Migration
  def self.up
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

  def self.down
    drop_table :se_manufacturing_datas
  end
end
