class CreateStPackagingDatas < ActiveRecord::Migration
  def self.up
    create_table :st_packaging_datas do |t|
      t.integer :st_product_id
      t.integer :st_packaging_type_id
      t.float :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :st_packaging_datas
  end
end
