class StEndOfLifeData < ActiveRecord::Base
  belongs_to :st_material_data  
  belongs_to :st_packaging_data
  belongs_to :st_consumable_data  
end
