class ComponentData < ActiveRecord::Base
   belongs_to :data_module
   belongs_to :family
   belongs_to :material
   belongs_to :product
   
   def quantity_aspect
      value = aspect * ratio
      value = value / ((aspect ** 2) + (ratio ** 2))
      value = value * ((diagonal * 2.54) ** 2)
      value
   end
end