class ReuseEndOfLife < ActiveRecord::Base
  belongs_to :material 
  belongs_to :family
  
  belongs_to :product
end
