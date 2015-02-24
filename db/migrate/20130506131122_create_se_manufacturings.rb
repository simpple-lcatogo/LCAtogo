class CreateSeManufacturings < ActiveRecord::Migration
  def self.up
    create_table :se_manufacturings do |t|
      t.integer :se_product_id
      t.float :cables
      t.float :sensor_lifetime
      t.float :battery_lifetime
      t.float :cable_lifetime
      t.float :purchase
      t.float :installation
      t.float :maintenance

      t.timestamps
    end
  end

  def self.down
    drop_table :se_manufacturings
  end
end
