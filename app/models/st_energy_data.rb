class StEnergyData < ActiveRecord::Base
  belongs_to :st_energy_type
  belongs_to :st_energy_source
  belongs_to :st_product
end
