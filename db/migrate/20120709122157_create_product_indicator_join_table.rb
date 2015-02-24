class CreateProductIndicatorJoinTable < ActiveRecord::Migration
  def self.up
    create_table :indicators_products, :id => false do |t|
      t.integer :product_id      
      t.integer :indicator_id
    end      
  end

  def self.down
    drop_table :indicators_products
  end
end
