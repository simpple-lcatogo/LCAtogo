class CreateMtManufacturingResourceDatas < ActiveRecord::Migration
  def self.up
    create_table :mt_manufacturing_resource_datas do |t|
      t.integer :mt_product_id
      t.integer :mt_consumable_id
      t.float :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_manufacturing_resource_datas
  end
end
