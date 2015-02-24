class BioPlasticChangeProcessUnitUppercase < ActiveRecord::Migration
  def self.up

  	not_default_data = BpManufacturingProcessVariable.find_by_name("Electricity consumption")

  		if not_default_data
  			if not_default_data.unit == "kwh/kg"
  				not_default_data.unit = "kWh/kg"
  				not_default_data.save
  			end	
  		end	

  end

  def self.down
  end
end
