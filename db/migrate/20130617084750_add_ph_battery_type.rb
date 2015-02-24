class AddPhBatteryType < ActiveRecord::Migration
  def self.up
    ph_battery_dummy = PhBatteryType.find_by_name("DUMMY")
    if ph_battery_dummy
      ph_battery_dummy.delete
    end
    PhBatteryType.create(:name => 'Lithium Ion')
  end

  def self.down
    ph_battery_dummy = PhBatteryType.find_by_name("Lithium Ion")
    if ph_battery_dummy
      ph_battery_dummy.delete
    end
    PhBatteryType.create(:name => 'DUMMY')
    
  end
end
