class CreatePcProducts < ActiveRecord::Migration
  def self.up
    create_table :pc_products do |t|
      t.references :product

      t.timestamps
    end
  end

  def self.down
    drop_table :pc_products
  end
end
