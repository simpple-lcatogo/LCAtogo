class CreateSeUseProductDatas < ActiveRecord::Migration
  def self.up
    create_table :se_use_product_datas do |t|
      t.references :se_product
      t.string :output_description
      t.float :share_with_sensor
      t.float :share_without_sensor

      t.timestamps
    end
  end

  def self.down
    drop_table :se_use_product_datas
  end
end
