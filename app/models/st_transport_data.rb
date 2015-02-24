class StTransportData < ActiveRecord::Base
  belongs_to :st_family_transport
  belongs_to :st_transport
  belongs_to :st_product
end
