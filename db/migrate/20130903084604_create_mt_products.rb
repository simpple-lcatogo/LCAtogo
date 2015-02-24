class CreateMtProducts < ActiveRecord::Migration
  def self.up
    create_table :mt_products do |t|
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_products
  end
end
