class StProduct < ActiveRecord::Base
  belongs_to :product

  has_one :st_material_detail
  has_one :st_use
  has_one :st_end_of_life  
  has_many :st_material_datas
  has_many :st_energy_datas
  has_many :st_process_datas
  has_many :st_packaging_datas
  has_many :st_transport_datas  
  has_many :st_consumption_datas  
  has_many :st_consumable_datas
  
  has_one :st_data_quality 
  
  def is_completed
    if st_material_datas.size +
       st_energy_datas.size + 
       st_process_datas.size + 
       st_transport_datas.size + 
       st_consumption_datas.size + 
       st_consumable_datas.size > 0
       return true
    end  
    return false
  end
end
