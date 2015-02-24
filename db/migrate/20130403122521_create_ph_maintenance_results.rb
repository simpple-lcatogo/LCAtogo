class CreatePhMaintenanceResults < ActiveRecord::Migration
  def self.up
    create_table :ph_maintenance_results do |t|
      t.integer :ph_product_id
      t.float :years_included
      t.float :inverter_replacement
      t.float :batteries_replacement
      t.float :tap_water_l
      t.float :tap_water_co2
      t.float :tap_water_pe
      t.float :needed_cycles_1
      t.float :needed_replacements_1
      t.float :embodied_co2_1
      t.float :embodied_pe_1
      t.float :needed_cycles_2
      t.float :needed_replacements_2 
      t.float :embodied_co2_2
      t.float :embodied_pe_2
      t.float :driven_maintenance
      t.float :driven_year
      t.float :driven_contract
      t.float :embodied_co2_transport 
      t.float :embodied_pe_transport 
      t.float :embodied_co2_cleaning 
      t.float :embodied_pe_cleaning
      t.float :total_embodied_co2_cleaning 
      t.float :total_embodied_pe_cleaning 
      t.float :needed_cycles_batteries
      t.float :needed_replacements_batteries 
      t.float :embodied_co2_batteries 
      t.float :embodied_pe_batteries 
      t.float :embodied_carbon_dioxide 
      t.float :embodied_primary_energy
      t.timestamps
    end
  end

  def self.down
    drop_table :ph_maintenance_results
  end
end
