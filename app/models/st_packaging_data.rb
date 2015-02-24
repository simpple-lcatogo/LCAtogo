class StPackagingData < ActiveRecord::Base
  belongs_to :st_packaging_type
  belongs_to :st_product
end
