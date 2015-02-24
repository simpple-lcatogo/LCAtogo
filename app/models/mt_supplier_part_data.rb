class MtSupplierPartData < ActiveRecord::Base
  belongs_to :mt_product
  belongs_to :mt_transport_type  
end
