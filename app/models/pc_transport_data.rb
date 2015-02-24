class PcTransportData < ActiveRecord::Base
  belongs_to :pc_product
  belongs_to :pc_transport_type  
end
