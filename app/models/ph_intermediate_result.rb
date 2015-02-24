class PhIntermediateResult < ActiveRecord::Base
   belongs_to :silicon_country, :class_name => 'PhCountryInfo', :foreign_key => 'silicon_country_id'  
   belongs_to :wafers_country, :class_name => 'PhCountryInfo', :foreign_key => 'wafers_country_id'
   belongs_to :cells_country, :class_name => 'PhCountryInfo', :foreign_key => 'cells_country_id'
   belongs_to :modules_country, :class_name => 'PhCountryInfo', :foreign_key => 'modules_country_id'
   belongs_to :cadmium_country, :class_name => 'PhCountryInfo', :foreign_key => 'cadmium_country_id'
   belongs_to :cis_country, :class_name => 'PhCountryInfo', :foreign_key => 'cis_country_id'
   belongs_to :amorphous_country, :class_name => 'PhCountryInfo', :foreign_key => 'amorphous_country_id' 
   
   belongs_to :ph_product   
end
