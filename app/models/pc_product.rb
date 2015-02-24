class PcProduct < ActiveRecord::Base
  belongs_to :product
  
  has_one :pc_basic 
  
  has_many :pc_transport_datas
  has_one :pc_data_quality  
  
  def is_completed
    if pc_basic
      return true
    end
    return false
  end
end
