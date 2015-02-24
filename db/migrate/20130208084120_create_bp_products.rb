class CreateBpProducts < ActiveRecord::Migration
  def self.up
    create_table :bp_products do |t|
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_products
  end
end
