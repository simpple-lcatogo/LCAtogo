class CreateMtManufacturings < ActiveRecord::Migration
  def self.up
    create_table :mt_manufacturings do |t|
      t.integer :mt_product_id
      t.float :waste

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_manufacturings
  end
end
