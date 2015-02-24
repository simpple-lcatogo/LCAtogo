class PhChangeConversionFactor < ActiveRecord::Migration
  def self.up
    ph_unit = PhUnit.find(:first, :conditions => ["name = 'Average Power Output [kW]'"])
    if ph_unit
       ph_unit.conversion_factor = 8760
       ph_unit.save
    end    
  end

  def self.down
  end
end
