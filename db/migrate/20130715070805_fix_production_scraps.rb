class FixProductionScraps < ActiveRecord::Migration
  def self.up
     #bp_manufacturing_process_variable_production_scrap = BpManufacturingProcessVariable.find(:first, :conditions => ["name = 'Production waste'"])
     #if bp_manufacturing_process_variable_production_scrap
     #   bp_manufacturing_process_variable_production_scrap.bp_manufacturing_process_variable_values.each do |variable_value|
     #     variable_value.value = 100 -  variable_value.value
     #     variable_value.save
     #   end
     #   bp_manufacturing_process_variable_production_scrap.name = 'Production waste'
     #   bp_manufacturing_process_variable_production_scrap.save
     #end
  end

  def self.down
  end
end
