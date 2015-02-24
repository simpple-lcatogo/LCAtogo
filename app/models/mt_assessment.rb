class MtAssessment < ActiveRecord::Base
  belongs_to :mt_product
  belongs_to :mt_product_type  
end
