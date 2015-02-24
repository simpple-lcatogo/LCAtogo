class CreateSeUseProducts < ActiveRecord::Migration
  def self.up
    create_table :se_use_products do |t|
      t.integer :se_product_id
      t.float :output_with
      t.float :output_without
      t.float :description_1
      t.float :quality_with_1
      t.float :quality_without_1
      t.float :description_2
      t.float :quality_with_2
      t.float :quality_without_2
      t.float :description_3
      t.float :quality_with_3
      t.float :quality_without_3

      t.timestamps
    end
  end

  def self.down
    drop_table :se_use_products
  end
end
