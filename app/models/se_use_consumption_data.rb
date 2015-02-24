class SeUseConsumptionData < ActiveRecord::Base
  belongs_to :se_product
  belongs_to :se_energy_type
  belongs_to :se_energy_use

end
