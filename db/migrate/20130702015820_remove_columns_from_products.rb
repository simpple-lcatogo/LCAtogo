class RemoveColumnsFromProducts < ActiveRecord::Migration
  def self.up
  	remove_column :se_use_products, :description_1, :description_2, :description_3
  	remove_column :se_use_products, :quality_with_1, :quality_with_2, :quality_with_3
  	remove_column :se_use_products, :quality_without_1, :quality_without_2, :quality_without_3
  end

  def self.down
  	add_column :se_use_products, :description_1, :string
  	add_column :se_use_products, :description_2, :string
  	add_column :se_use_products, :description_3, :string

  	add_column :se_use_products, :quality_with_1, :float
  	add_column :se_use_products, :quality_with_2, :float
  	add_column :se_use_products, :quality_with_3, :float

  	add_column :se_use_products, :quality_without_1, :float
  	add_column :se_use_products, :quality_without_2, :float
  	add_column :se_use_products, :quality_without_3, :float
  end
end
