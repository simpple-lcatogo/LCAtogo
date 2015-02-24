class BpPackagingData < ActiveRecord::Base
  belongs_to :bp_product
  belongs_to :bp_distribution_default_value
end
