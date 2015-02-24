class MtUseOperatingResourceData < ActiveRecord::Base
  belongs_to :mt_product
  belongs_to :mt_consumable  
  
  def processing    
    tmp = read_attribute(:processing)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end
  
  def ready    
    tmp = read_attribute(:ready)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end       

  def standby    
    tmp = read_attribute(:standby)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end         
end
