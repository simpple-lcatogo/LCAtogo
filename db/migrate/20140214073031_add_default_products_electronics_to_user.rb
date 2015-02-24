class AddDefaultProductsElectronicsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :default_products_electronics, :boolean, :default => false    
  end

  def self.down
    remove_column :users, :default_products_electronics
  end
end
