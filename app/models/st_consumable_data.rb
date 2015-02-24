class StConsumableData < ActiveRecord::Base
  belongs_to :st_product
  belongs_to :st_family
  belongs_to :st_material  
end
