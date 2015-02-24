class MtPredefinedSupplierData < ActiveRecord::Base
  belongs_to :mt_product
  belongs_to :mt_family
  belongs_to :mt_material   
  belongs_to :mt_transport_type
  
  def quantity    
    tmp = read_attribute(:quantity)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end  
  
  def distance    
    tmp = read_attribute(:distance)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end    
end
