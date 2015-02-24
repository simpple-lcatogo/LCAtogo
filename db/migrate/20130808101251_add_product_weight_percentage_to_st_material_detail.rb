class AddProductWeightPercentageToStMaterialDetail < ActiveRecord::Migration
  def self.up
    add_column :st_material_details, :product_weight_percentage, :float
  end

  def self.down
    remove_column :st_material_details, :product_weight_percentage
  end
end
