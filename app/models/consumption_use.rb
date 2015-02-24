class ConsumptionUse < ActiveRecord::Base
  belongs_to :energy_mode
  belongs_to :family 
  belongs_to :energy_type
  belongs_to :product
end
