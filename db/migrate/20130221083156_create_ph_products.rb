class CreatePhProducts < ActiveRecord::Migration
  def self.up
    create_table :ph_products do |t|
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ph_products
  end
end
