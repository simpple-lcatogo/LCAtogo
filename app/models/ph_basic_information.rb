class PhBasicInformation < ActiveRecord::Base
  belongs_to :ph_product
  belongs_to :ph_country_info
  belongs_to :ph_mounting_type
end
