class StConsumptionData < ActiveRecord::Base
  belongs_to :st_product
  belongs_to :st_energy_type
  belongs_to :st_energy_source 
end
