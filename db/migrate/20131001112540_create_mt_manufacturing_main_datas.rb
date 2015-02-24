class CreateMtManufacturingMainDatas < ActiveRecord::Migration
  def self.up
    create_table :mt_manufacturing_main_datas do |t|
      t.integer :mt_product_id
      t.integer :mt_manufacturing_process_id
      t.float :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_manufacturing_main_datas
  end
end
