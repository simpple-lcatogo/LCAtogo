class BpProduct < ActiveRecord::Base
	belongs_to :product
	has_many :bp_material_datas , :dependent => :destroy
  has_many :bp_finishing_datas , :dependent => :destroy  
	has_many :bp_compound_material_datas, :dependent => :destroy
	has_many :bp_transport_to_converter_datas , :dependent => :destroy
	has_many :bp_transport_to_customer_datas , :dependent => :destroy
	has_many :bp_manufacturing_datas , :dependent => :destroy
	has_many :bp_manufacturing_transport_datas , :dependent => :destroy
  has_many :bp_packaging_datas , :dependent => :destroy
	has_one :bp_distribution_user_value, :dependent => :destroy
	has_one :bp_end_of_life_data, :dependent => :destroy
  
  has_one :bp_product_result  
  
  has_one :bp_economic
  has_one :bp_data_quality  
end
