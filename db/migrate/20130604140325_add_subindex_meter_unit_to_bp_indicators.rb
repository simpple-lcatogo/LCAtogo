class AddSubindexMeterUnitToBpIndicators < ActiveRecord::Migration
  def self.up
	#Indicator.update_all "unit = 'm<sup>3</sup>'","unit = 'm<sub>3</sub>' and sector = 'bio-plastic'"
	#Indicator.update_all "unit = 'm<sup>2</sup>*year'","unit = 'm<sub>2</sub>*year' and sector = 'bio-plastic'"
	m3 = Indicator.find_by_name_and_sector("Water Footprint","bio-plastic")
	
	if m3	
		m3.unit = "m<sup>3</sup>"
		m3.save
	end	

	m2 = Indicator.find_by_name_and_sector("Land Use","bio-plastic")
	
	if m2
		m2.unit = "m<sup>2</sup>*year"
		m2.save
	end

  end

  def self.down
  	#Indicator.update_all "unit = 'm<sub>3</sub>'","unit = 'm<sup>3</sup>' and sector = 'bio-plastic'"
  	#Indicator.update_all "unit = 'm<sub>2</sub>*year'","unit = 'm<sup>2</sup>*year' and sector = 'bio-plastic'"
  end
end
