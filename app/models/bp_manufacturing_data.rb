class BpManufacturingData < ActiveRecord::Base
  belongs_to :bp_product
  belongs_to :bp_manufacturing_process
  belongs_to :bp_unit
  belongs_to :bp_material
  belongs_to :bp_country_info  
  has_many :bp_manufacturing_process_variable_values
  has_many :bp_manufacturing_process_user_variables, :dependent => :destroy

  validates :quantity, :numericality => true
end
