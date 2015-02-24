class PhElectricComponent < ActiveRecord::Base
  belongs_to :ph_battery_type
  
  belongs_to :ph_product   
end
