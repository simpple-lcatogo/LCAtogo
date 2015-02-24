class CreateProductResults < ActiveRecord::Migration
  def self.up
    create_table :product_results do |t|
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :product_results
  end
end
