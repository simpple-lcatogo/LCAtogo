class CreateSeUseConsumptions < ActiveRecord::Migration
  def self.up
    create_table :se_use_consumptions do |t|
      t.integer :se_product_id
      t.float :electricity_operational_with
      t.float :electricity_downtimes_with
      t.float :electricity_overhead_with
      t.float :electricity_operational_without
      t.float :electricity_downtimes_without
      t.float :electricity_overhead_without
      t.float :heat_operational_with
      t.float :heat_downtimes_with
      t.float :heat_overhead_with
      t.float :heat_operational_without
      t.float :heat_downtimes_without
      t.float :heat_overhead_without
      t.float :gas_operational_with
      t.float :gas_downtimes_with
      t.float :gas_overhead_with
      t.float :gas_operational_without
      t.float :gas_downtimes_without
      t.float :gas_overhead_without
      t.float :other_operational_with
      t.float :other_downtimes_with
      t.float :other_overhead_with
      t.float :other_operational_without
      t.float :other_downtimes_without
      t.float :other_overhead_without
      t.float :sensor_consumption      

      t.float :grease_consumable_with   
      t.float :grease_consumable_without      
      t.float :oil_consumable_with   
      t.float :oil_consumable_without      
      t.float :organic_consumable_with   
      t.float :organic_consumable_without      
      t.float :exhaust_utility_with
      t.float :exhaust_utility_without      
      t.float :vacuum_utility_with
      t.float :vacuum_utility_without      
      t.float :dry_air_utility_with
      t.float :dry_air_utility_without      
      t.float :high_dry_air_utility_with
      t.float :high_dry_air_utility_without      
      t.float :compressed_air_utility_with
      t.float :compressed_air_utility_without      
      t.float :water_cooled_utility_with
      t.float :water_cooled_utility_without    
      t.float :ultrapure_water_utility_with
      t.float :ultrapure_water_utility_without    
      t.float :hot_ultrapure_water_utility_with
      t.float :hot_ultrapure_water_utility_without    
      t.float :nitrogen_utility_with
      t.float :nitrogen_utility_without   
      t.timestamps
    end
  end

  def self.down
    drop_table :se_use_consumptions
  end
end
