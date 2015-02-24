class SeUseConsumptionConsumableData < ActiveRecord::Base
  belongs_to :se_product
  belongs_to :se_consumable
end
