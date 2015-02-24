class CreateSeProducts < ActiveRecord::Migration
  def self.up
    create_table :se_products do |t|
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :se_products
  end
end
