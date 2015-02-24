class AddIsDefaultToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :is_default_product, :boolean, :default => false        
  end

  def self.down
    remove_column :products, :is_default_product
  end
end
