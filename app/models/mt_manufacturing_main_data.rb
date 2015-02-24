class MtManufacturingMainData < ActiveRecord::Base
  belongs_to :mt_product
  belongs_to :mt_manufacturing_process  
  
  def quantity    
    tmp = read_attribute(:quantity)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end    
end
