class MtProduct < ActiveRecord::Base
  belongs_to :product
  has_many :mt_material_datas, :dependent => :destroy
  has_many :mt_supplier_datas, :dependent => :destroy  
  has_many :mt_predefined_supplier_datas, :dependent => :destroy  
  has_many :mt_user_supplier_datas, :dependent => :destroy
  has_many :mt_supplier_part_datas, :dependent => :destroy  
  has_many :mt_energy_datas, :dependent => :destroy 
  has_many :mt_overhead_energy_datas, :dependent => :destroy  
  has_many :mt_waste_energy_datas, :dependent => :destroy  
  has_many :mt_manufacturing_resource_datas, :dependent => :destroy
  has_many :mt_manufacturing_main_datas, :dependent => :destroy
  has_many :mt_distribution_transport_datas, :dependent => :destroy
  has_many :mt_distribution_packaging_datas, :dependent => :destroy  
  has_many :mt_use_additional_energy_datas, :dependent => :destroy
  has_many :mt_use_operating_resource_datas, :dependent => :destroy
  has_many :mt_use_machine_subsystem_datas, :dependent => :destroy
  has_many :mt_end_of_life_datas, :dependent => :destroy
    
  has_one :mt_assessment
  has_one :mt_manufacturing
  has_one :mt_distribution
  has_one :mt_use  
  has_one :mt_end_of_life 
  has_one :mt_data_quality  
  
  
  
  def is_completed
    mt_results = MtResult.find_all_by_mt_product_id(id)
    if mt_results.size > 0
      return true
    end
    return false
  end
  
  def is_completed_old
    if mt_material_datas.size +
       mt_supplier_datas.size + 
       mt_predefined_supplier_datas.size + 
       mt_user_supplier_datas.size + 
       mt_supplier_part_datas.size +
       mt_supplier_datas.size + 
       mt_energy_datas.size + 
       mt_overhead_energy_datas.size + 
       mt_waste_energy_datas.size + 
       mt_manufacturing_resource_datas.size + 
       mt_manufacturing_main_datas.size + 
       mt_distribution_transport_datas.size + 
       mt_distribution_packaging_datas.size + 
       mt_use_additional_energy_datas.size +
       mt_use_operating_resource_datas.size +
       mt_use_machine_subsystem_datas.size +              
       mt_end_of_life_datas.size > 0
       return true
    end  
    return false
  end
end
