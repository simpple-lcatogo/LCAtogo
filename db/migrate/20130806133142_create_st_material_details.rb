class CreateStMaterialDetails < ActiveRecord::Migration
  def self.up
    create_table :st_material_details do |t|
      t.references :st_product
      t.float :product_weight
      t.float :textile_weight
      t.float :electronic_weight

      t.timestamps
    end
  end

  def self.down
    drop_table :st_material_details
  end
end
