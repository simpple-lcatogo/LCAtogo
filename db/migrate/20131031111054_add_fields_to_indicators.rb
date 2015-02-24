class AddFieldsToIndicators < ActiveRecord::Migration
  def self.up
    add_column :indicators, :category, :string
    add_column :indicators, :subcategory, :string    
  end

  def self.down
    remove_column :indicators, :category
    remove_column :indicators, :subcategory    
  end
end
