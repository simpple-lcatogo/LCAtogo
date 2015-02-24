class SetAbbrToIndicators < ActiveRecord::Migration
  def self.up
    indicator = Indicator.find_by_name_and_sector("Global Warming","bio-plastic")
    if indicator
      indicator.abbr = "GW"
      indicator.save
    end
    
    indicator = Indicator.find_by_name_and_sector("Water Footprint","bio-plastic")
    if indicator
      indicator.abbr = "WF"
      indicator.save
    end    
    
    indicator = Indicator.find_by_name_and_sector("Land Use","bio-plastic")
    if indicator
      indicator.abbr = "LU"
      indicator.save
    end
    
    indicator = Indicator.find_by_name_and_sector("Cumulative Energy Demand (CED) - non-renewable","bio-plastic")
    if indicator
      indicator.abbr = "CED- nr"
      indicator.save
    end    

    indicator = Indicator.find_by_name_and_sector("Cumulative Energy Demand (CED) - renewable","bio-plastic")
    if indicator
      indicator.abbr = "CED- r"
      indicator.save
    end
    
    indicator = Indicator.find_by_name_and_sector("Eutrophication","bio-plastic")
    if indicator
      indicator.abbr = "Eu"
      indicator.save
    end    

    indicator = Indicator.find_by_name_and_sector("Acidification","bio-plastic")
    if indicator
      indicator.abbr = "Ac"
      indicator.save
    end
    
    indicator = Indicator.find_by_name_and_sector("Photochemical Ozone Creation Potential","bio-plastic")
    if indicator
      indicator.abbr = "POCP"
      indicator.save
    end    
    
    indicator = Indicator.find_by_name_and_sector("Respiratory Inorganics","bio-plastic")
    if indicator
      indicator.abbr = "RI"
      indicator.save
    end    
    
  end

  def self.down
  end
end
