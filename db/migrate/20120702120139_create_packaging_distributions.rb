class CreatePackagingDistributions < ActiveRecord::Migration
  def self.up
    create_table :packaging_distributions do |t|
      t.integer :material_id
      t.float :quantity
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :packaging_distributions
  end
end
