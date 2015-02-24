class MtManufacturing < ActiveRecord::Base
  belongs_to :mt_product
  
  def waste    
    tmp = read_attribute(:waste)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end  
end
