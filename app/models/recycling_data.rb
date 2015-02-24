class RecyclingData < ActiveRecord::Base
  belongs_to :material
  belongs_to :family
  belongs_to :manufacturing_data 
  belongs_to :product  
end
