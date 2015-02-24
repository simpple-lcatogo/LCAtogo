class ReuseData < ActiveRecord::Base
  belongs_to :material
  belongs_to :product  
end
