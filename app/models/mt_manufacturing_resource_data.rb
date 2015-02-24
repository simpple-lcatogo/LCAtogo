class MtManufacturingResourceData < ActiveRecord::Base
  belongs_to :mt_product
  belongs_to :mt_consumable  
  
  def quantity    
    tmp = read_attribute(:quantity)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end        
end
