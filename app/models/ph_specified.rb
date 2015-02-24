class PhSpecified < ActiveRecord::Base
  belongs_to :area_unit, :class_name => 'PhUnit', :foreign_key => 'area_unit_id'
  belongs_to :power_unit, :class_name => 'PhUnit', :foreign_key => 'power_unit_id'  
  
  belongs_to :ph_module_type
  belongs_to :ph_product
end
