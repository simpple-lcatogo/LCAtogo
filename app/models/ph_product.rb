class PhProduct < ActiveRecord::Base
   belongs_to :product
   has_one :ph_basic_information
   has_one :ph_specified
   has_one :ph_intermediate_result
   has_one :ph_electric_component
   has_one :ph_maintenance
   has_one :ph_result   
   has_one :ph_maintenance_result  
   has_one :ph_embedded_result  
   has_one :ph_data_quality   
end
