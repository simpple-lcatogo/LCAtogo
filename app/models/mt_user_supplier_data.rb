class MtUserSupplierData < ActiveRecord::Base
  belongs_to :mt_product
  belongs_to :mt_supplier_part_data 
  belongs_to :mt_family
  belongs_to :mt_material   
  belongs_to :mt_manufacturing_process  
  
  def value    
    tmp = read_attribute(:value)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end
  
  def quantity    
    tmp = read_attribute(:quantity)
    if tmp && !tmp.blank?
       return tmp
    end
    return 0
  end
  
end
