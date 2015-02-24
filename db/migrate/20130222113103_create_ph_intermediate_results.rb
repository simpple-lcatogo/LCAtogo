class CreatePhIntermediateResults < ActiveRecord::Migration
  def self.up
    create_table :ph_intermediate_results do |t|
      t.integer :ph_product_id
      t.text :evaluation
      t.float :module_area
      t.integer :silicon_country_id
      t.float :silicon_co2, :default => 449.48
      t.integer :wafers_country_id
      t.float :wafers_co2, :default => 487.34
      t.integer :cells_country_id
      t.float :cells_co2, :default => 635.81
      t.integer :modules_country_id
      t.float :modules_co2, :default => 627.51
      t.integer :cadmium_country_id
      t.float :cadmium_co2, :default => 636.61
      t.integer :cis_country_id
      t.float :cis_co2, :default => 482.04
      t.integer :amorphous_country_id
      t.float :amorphous_co2, :default => 504

      t.timestamps
    end
  end

  def self.down
    drop_table :ph_intermediate_results
  end
end
