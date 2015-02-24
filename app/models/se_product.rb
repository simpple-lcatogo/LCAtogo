class SeProduct < ActiveRecord::Base
  belongs_to :product
  
  has_one :se_manufacturing
  has_one :se_use_production
  has_one :se_use_product
  has_one :se_use_consumption 
  has_one :se_use_cost  
  has_many :se_manufacturing_datas
  has_one :se_result   
  has_many :se_recycling_datas
  has_many :se_use_production_datas
  has_many :se_use_product_datas
  has_many :se_use_consumption_datas
  has_many :se_use_consumption_consumable_datas
  has_many :se_use_consumption_utility_datas
  
  has_one :se_data_quality  
end
