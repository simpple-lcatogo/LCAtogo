class CreatePhDatabaseMaterialValues < ActiveRecord::Migration
  def self.up
    create_table :ph_database_material_values do |t|
      t.integer :ph_product_id
      t.integer :ph_database_material_id
      t.float :co2_value
      t.float :pe_value

      t.timestamps
    end
  end

  def self.down
    drop_table :ph_database_material_values
  end
end
