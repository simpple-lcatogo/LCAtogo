class RecreatePhDataQualities < ActiveRecord::Migration
  def self.up
     drop_table :ph_data_qualities
     create_table :ph_data_qualities do |t|
       t.integer :ph_product_id
       t.string :country_use
       t.string :module_temperature
       t.string :performance_ratio
       t.string :module_specifications
       t.string :production_countries
       t.string :inverter
       t.string :batteries
       t.string :maintenance

       t.timestamps
    end     
  end

  def self.down
  end
end
