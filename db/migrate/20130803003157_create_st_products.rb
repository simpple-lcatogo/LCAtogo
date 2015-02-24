class CreateStProducts < ActiveRecord::Migration
  def self.up
    create_table :st_products do |t|
      t.references :product

      t.timestamps
    end
  end

  def self.down
    drop_table :st_products
  end
end
