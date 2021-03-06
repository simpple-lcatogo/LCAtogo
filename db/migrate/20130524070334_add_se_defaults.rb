class AddSeDefaults < ActiveRecord::Migration
  def self.up
#     change_column_default(:se_use_productions, :incidents_with_1, 0.0)
#     change_column_default(:se_use_productions, :incidents_with_2, 0.0)
#     change_column_default(:se_use_productions, :incidents_with_3, 0.0)
#     change_column_default(:se_use_productions, :incidents_with_4, 0.0)
#     change_column_default(:se_use_productions, :duration_with_1, 0.0)
#     change_column_default(:se_use_productions, :duration_with_2, 0.0)
#     change_column_default(:se_use_productions, :duration_with_3, 0.0)
#     change_column_default(:se_use_productions, :duration_with_4, 0.0)
#     change_column_default(:se_use_productions, :downtime_with_1, 0.0)
#     change_column_default(:se_use_productions, :downtime_with_2, 0.0)
#     change_column_default(:se_use_productions, :downtime_with_3, 0.0)
#     change_column_default(:se_use_productions, :downtime_with_4, 0.0)
#     change_column_default(:se_use_productions, :incidents_without_1, 0.0)
#     change_column_default(:se_use_productions, :incidents_without_2, 0.0)
#     change_column_default(:se_use_productions, :incidents_without_3, 0.0)
#     change_column_default(:se_use_productions, :incidents_without_4, 0.0)
#     change_column_default(:se_use_productions, :duration_without_1, 0.0)
#     change_column_default(:se_use_productions, :duration_without_2, 0.0)
#     change_column_default(:se_use_productions, :duration_without_3, 0.0)
#     change_column_default(:se_use_productions, :duration_without_4, 0.0)
#     change_column_default(:se_use_productions, :downtime_without_1, 0.0)
#     change_column_default(:se_use_productions, :downtime_without_2, 0.0)
#     change_column_default(:se_use_productions, :downtime_without_3, 0.0)
#     change_column_default(:se_use_productions, :downtime_without_4, 0.0)     
#     change_column_default(:se_use_consumptions, :electricity_operational_with, 0.0)
#     change_column_default(:se_use_consumptions, :electricity_downtimes_with, 0.0)     
#     change_column_default(:se_use_consumptions, :electricity_overhead_with, 0.0)
#     change_column_default(:se_use_consumptions, :electricity_operational_without, 0.0)     
#     change_column_default(:se_use_consumptions, :electricity_downtimes_without, 0.0)
#     change_column_default(:se_use_consumptions, :electricity_overhead_without, 0.0)     
#     change_column_default(:se_use_consumptions, :heat_operational_with, 0.0)
#     change_column_default(:se_use_consumptions, :heat_downtimes_with, 0.0)     
#     change_column_default(:se_use_consumptions, :heat_overhead_with, 0.0)
#     change_column_default(:se_use_consumptions, :heat_operational_without, 0.0)     
#     change_column_default(:se_use_consumptions, :heat_downtimes_without, 0.0)
#     change_column_default(:se_use_consumptions, :heat_overhead_without, 0.0)     
#     change_column_default(:se_use_consumptions, :gas_operational_with, 0.0)     
#     change_column_default(:se_use_consumptions, :gas_downtimes_with, 0.0)     
#     change_column_default(:se_use_consumptions, :gas_overhead_with, 0.0)     
#     change_column_default(:se_use_consumptions, :gas_operational_without, 0.0)     
#     change_column_default(:se_use_consumptions, :gas_downtimes_without, 0.0)     
#     change_column_default(:se_use_consumptions, :gas_overhead_without, 0.0)     
#     change_column_default(:se_use_consumptions, :other_operational_with, 0.0)     
#     change_column_default(:se_use_consumptions, :other_downtimes_with, 0.0)     
#     change_column_default(:se_use_consumptions, :other_overhead_with, 0.0)     
#     change_column_default(:se_use_consumptions, :other_operational_without, 0.0)
#     change_column_default(:se_use_consumptions, :other_downtimes_without, 0.0)
#     change_column_default(:se_use_consumptions, :other_overhead_without, 0.0)
#     #change_column_default(:se_use_consumptions, :sensor_consumption, 0.0)
#     change_column_default(:se_use_consumptions, :grease_consumable_with, 0.0)
#     change_column_default(:se_use_consumptions, :grease_consumable_without, 0.0)
#     change_column_default(:se_use_consumptions, :oil_consumable_with, 0.0)          
#     change_column_default(:se_use_consumptions, :oil_consumable_without, 0.0)
#     change_column_default(:se_use_consumptions, :organic_consumable_with, 0.0)     
#     change_column_default(:se_use_consumptions, :organic_consumable_without, 0.0)
#     change_column_default(:se_use_consumptions, :exhaust_utility_with, 0.0)     
#     change_column_default(:se_use_consumptions, :exhaust_utility_without, 0.0)
#     change_column_default(:se_use_consumptions, :vacuum_utility_with, 0.0)     
#     change_column_default(:se_use_consumptions, :vacuum_utility_without, 0.0)
#     change_column_default(:se_use_consumptions, :dry_air_utility_with, 0.0)     
#     change_column_default(:se_use_consumptions, :dry_air_utility_without, 0.0)
#     change_column_default(:se_use_consumptions, :high_dry_air_utility_with, 0.0)     
#     change_column_default(:se_use_consumptions, :high_dry_air_utility_without, 0.0)
#     change_column_default(:se_use_consumptions, :compressed_air_utility_with, 0.0)
#     change_column_default(:se_use_consumptions, :compressed_air_utility_without, 0.0)
#     change_column_default(:se_use_consumptions, :water_cooled_utility_with, 0.0)     
#     change_column_default(:se_use_consumptions, :water_cooled_utility_without, 0.0)
#     change_column_default(:se_use_consumptions, :ultrapure_water_utility_with, 0.0)
#     change_column_default(:se_use_consumptions, :ultrapure_water_utility_without, 0.0)
#     change_column_default(:se_use_consumptions, :hot_ultrapure_water_utility_with, 0.0)     
#     change_column_default(:se_use_consumptions, :hot_ultrapure_water_utility_without, 0.0)
#     change_column_default(:se_use_consumptions, :nitrogen_utility_with, 0.0)
#     change_column_default(:se_use_consumptions, :high_dry_air_utility_with, 0.0)
#     change_column_default(:se_use_consumptions, :nitrogen_utility_without, 0.0)        
  end

  def self.down
  end
end
