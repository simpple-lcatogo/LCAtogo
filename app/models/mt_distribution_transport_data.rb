class MtDistributionTransportData < ActiveRecord::Base
  belongs_to :mt_product
  belongs_to :mt_transport_type 
  
  def distance    
    tmp = read_attribute(:distance)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end      
end
