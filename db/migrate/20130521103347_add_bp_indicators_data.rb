class AddBpIndicatorsData < ActiveRecord::Migration
  def self.up
  	if !Indicator.find_by_name_and_unit_and_sector("Global Warming","kg CO2 eq","bio-plastic")
  		Indicator.create(:name => 'Global Warming', :unit => 'kg CO<sub>2</sub> eq', :sector => 'bio-plastic')
  	end

	  if !Indicator.find_by_name_and_unit_and_sector("Water Footprint","m<sub>3</sub>","bio-plastic")
  		Indicator.create(:name => 'Water Footprint', :unit => 'm<sub>3</sub>', :sector => 'bio-plastic')
  	end  	

  	if !Indicator.find_by_name_and_unit_and_sector("Land Use","m<sub>2</sub>*year","bio-plastic")
  		Indicator.create(:name => 'Land Use', :unit => 'm<sub>2</sub>*year', :sector => 'bio-plastic')
  	end

  	if !Indicator.find_by_name_and_unit_and_sector("Cumulative Energy Demand (CED) - non-renewable","MJ","bio-plastic")
  		Indicator.create(:name => 'Cumulative Energy Demand (CED) - non-renewable', :unit => 'MJ', :sector => 'bio-plastic')
  	end

	  if !Indicator.find_by_name_and_unit_and_sector("Cumulative Energy Demand (CED) - renewable","MJ","bio-plastic")
  		Indicator.create(:name => 'Cumulative Energy Demand (CED) - renewable', :unit => 'MJ', :sector => 'bio-plastic')
  	end

	  if !Indicator.find_by_name_and_unit_and_sector("Eutrophication","kg PO<sub>4</sub> eq","bio-plastic")
		  Indicator.create(:name => 'Eutrophication', :unit => 'kg PO<sub>4</sub> eq', :sector => 'bio-plastic')
	  end

	  if !Indicator.find_by_name_and_unit_and_sector("Acidification","kg SO<sub>2</sub> eq","bio-plastic")
		  Indicator.create(:name => 'Acidification', :unit => 'kg SO<sub>2</sub> eq', :sector => 'bio-plastic')
	  end

	  if !Indicator.find_by_name_and_unit_and_sector("Photochemical Ozone Creation Potential","kg C<sub>2</sub>H<sub>4</sub> eq","bio-plastic")
		  Indicator.create(:name => 'Photochemical Ozone Creation Potential', :unit => 'kg C<sub>2</sub>H<sub>4</sub> eq', :sector => 'bio-plastic')
	  end

	  if !Indicator.find_by_name_and_unit_and_sector("Respiratory Inorganics","PM 2.5 eq","bio-plastic")
		  Indicator.create(:name => 'Respiratory Inorganics', :unit => 'PM 2.5 eq', :sector => 'bio-plastic')
	  end
  end

  def self.down
  	global_warming = Indicator.find_by_name_and_unit_and_sector("Global Warming","kg CO<sub>2</sub> eq","bio-plastic")
  	global_warming.destroy if global_warming

  	water_footprint = Indicator.find_by_name_and_unit_and_sector("Water Footprint","m<sub>3</sub>","bio-plastic")
  	water_footprint.destroy if water_footprint

  	land_use = Indicator.find_by_name_and_unit_and_sector("Land Use","m<sub>2</sub>*year","bio-plastic")
  	land_use.destroy if land_use

  	ced_non_renewable = Indicator.find_by_name_and_unit_and_sector("Cumulative Energy Demand (CED) - non-renewable","MJ","bio-plastic")
  	ced_non_renewable.destroy if ced_non_renewable
  	
  	ced_renewable = Indicator.find_by_name_and_unit_and_sector("Cumulative Energy Demand (CED) - renewable","MJ","bio-plastic")
  	ced_renewable.destroy if ced_renewable

  	eutrophication = Indicator.find_by_name_and_unit_and_sector("Eutrophication","kg PO<sub>4</sub> eq","bio-plastic")
  	eutrophication.destroy if eutrophication

  	acidification = Indicator.find_by_name_and_unit_and_sector("Acidification ","kg SO<sub>2</sub> eq","bio-plastic")
  	acidification.destroy if acidification

  	photochemical_ozone = Indicator.find_by_name_and_unit_and_sector("Photochemical Ozone Creation Potential","kg C<sub>2</sub>H<sub>4</sub> eq","bio-plastic")
  	photochemical_ozone.destroy if photochemical_ozone

  	respiratory_inorganics = Indicator.find_by_name_and_unit_and_sector("Respiratory Inorganics","PM 2.5 eq","bio-plastic")
  	respiratory_inorganics.destroy if respiratory_inorganics

  end
end
