class SeManufacturingData < ActiveRecord::Base
  belongs_to :se_product
  belongs_to :se_component
end
