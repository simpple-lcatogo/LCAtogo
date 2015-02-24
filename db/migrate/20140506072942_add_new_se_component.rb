class AddNewSeComponent < ActiveRecord::Migration
  def self.up
    #se_component_mems = SeComponent.create(:name => 'MEMs', :unit => 'units/sensor node')
    #indicator_1_se = Indicator.find_by_name_and_sector('Global warming potential (CO2 eq.)', 'sensors')
    #ExcelValue.create(:indicator_id => indicator_1_se.id, :phase => 'MANUFACTURING', :family => 'Sensor nodes', :name => 'MEMs',  :value => 0.149)
    #indicator_2_se = Indicator.find_by_name_and_sector('Electricity consumption (kWh)', 'sensors')
    #ExcelValue.create(:indicator_id => indicator_2_se.id, :phase => 'MANUFACTURING', :family => 'Sensor nodes', :name => 'MEMs',  :value => 0)


  end

  def self.down
  end
end
