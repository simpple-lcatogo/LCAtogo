class RemoveColumnsFromSeUseConsumption < ActiveRecord::Migration
  def self.up
  	drop_table :se_use_consumptions
  	create_table :se_use_consumptions do |t|
  		t.integer :se_product_id
  		t.float :sensor_system_with
  		t.float :sensor_system_without

  		t.timestamps
  	end

  end

  def self.down
  	drop_table :se_use_consumptions
    
    create_table :se_use_consumptions do |t|
      t.integer :se_product_id
      t.float :electricity_operational_with, :default => 0.0
      t.float :electricity_downtimes_with, :default => 0.0
      t.float :electricity_overhead_with, :default => 0.0
      t.float :electricity_operational_without, :default => 0.0
      t.float :electricity_downtimes_without, :default => 0.0
      t.float :electricity_overhead_without, :default => 0.0
      t.float :heat_operational_with, :default => 0.0
      t.float :heat_downtimes_with, :default => 0.0
      t.float :heat_overhead_with, :default => 0.0
      t.float :heat_operational_without, :default => 0.0
      t.float :heat_downtimes_without, :default => 0.0
      t.float :heat_overhead_without, :default => 0.0
      t.float :gas_operational_with, :default => 0.0
      t.float :gas_downtimes_with, :default => 0.0
      t.float :gas_overhead_with, :default => 0.0
      t.float :gas_operational_without, :default => 0.0
      t.float :gas_downtimes_without, :default => 0.0
      t.float :gas_overhead_without, :default => 0.0
      t.float :other_operational_with, :default => 0.0
      t.float :other_downtimes_with, :default => 0.0
      t.float :other_overhead_with, :default => 0.0
      t.float :other_operational_without, :default => 0.0
      t.float :other_downtimes_without, :default => 0.0
      t.float :other_overhead_without, :default => 0.0
      t.float :sensor_consumption, :default => 0.0

      t.float :grease_consumable_with, :default => 0.0
      t.float :grease_consumable_without, :default => 0.0      
      t.float :oil_consumable_with, :default => 0.0   
      t.float :oil_consumable_without, :default => 0.0      
      t.float :organic_consumable_with, :default => 0.0   
      t.float :organic_consumable_without, :default => 0.0      
      t.float :exhaust_utility_with, :default => 0.0
      t.float :exhaust_utility_without, :default => 0.0      
      t.float :vacuum_utility_with, :default => 0.0
      t.float :vacuum_utility_without, :default => 0.0      
      t.float :dry_air_utility_with, :default => 0.0
      t.float :dry_air_utility_without, :default => 0.0      
      t.float :high_dry_air_utility_with, :default => 0.0
      t.float :high_dry_air_utility_without, :default => 0.0
      t.float :compressed_air_utility_with, :default => 0.0
      t.float :compressed_air_utility_without, :default => 0.0      
      t.float :water_cooled_utility_with, :default => 0.0
      t.float :water_cooled_utility_without, :default => 0.0    
      t.float :ultrapure_water_utility_with, :default => 0.0
      t.float :ultrapure_water_utility_without, :default => 0.0
      t.float :hot_ultrapure_water_utility_with, :default => 0.0
      t.float :hot_ultrapure_water_utility_without, :default => 0.0    
      t.float :nitrogen_utility_with, :default => 0.0
      t.float :nitrogen_utility_without, :default => 0.0   
      t.timestamps
    end    
  end
end
