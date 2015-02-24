class CreateSeResults < ActiveRecord::Migration
  def self.up
    create_table :se_results do |t|
      t.integer :se_product_id
      t.float :sensor_kg_year_with
      t.float :energy_kg_year_with
      t.float :consumables_kg_year_with
      t.float :utilities_kg_year_with
      t.float :yield_kg_year_with
      t.float :sensor_kg_product_with
      t.float :energy_kg_product_with
      t.float :consumables_kg_product_with
      t.float :utilities_kg_product_with
      t.float :yield_kg_product_with
      t.float :sensor_kg_year_without
      t.float :energy_kg_year_without
      t.float :consumables_kg_year_without
      t.float :utilities_kg_year_without
      t.float :yield_kg_year_without
      t.float :sensor_kg_product_without
      t.float :energy_kg_product_without
      t.float :consumables_kg_product_without
      t.float :utilities_kg_product_without
      t.float :yield_kg_product_without

      t.float :sensor_euro_year_with
      t.float :production_euro_year_with      
      t.float :value_euro_year_with      
      t.float :yield_euro_year_with
      
      t.float :sensor_euro_product_with
      t.float :production_euro_product_with
      t.float :value_euro_product_with      
      t.float :yield_euro_product_with
      
      t.float :sensor_euro_year_without
      t.float :production_euro_year_without
      t.float :value_euro_year_without      
      t.float :yield_euro_year_without
            
      t.float :sensor_euro_product_without
      t.float :production_euro_product_without
      t.float :value_euro_product_without      
      t.float :yield_euro_product_without


      t.timestamps
    end
  end

  def self.down
    drop_table :se_results
  end
end
