class MtDistribution < ActiveRecord::Base
  belongs_to :mt_product
  
  def packaging    
    tmp = read_attribute(:packaging)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end    
end
