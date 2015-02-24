class BpEndOfLifeData < ActiveRecord::Base
  belongs_to :bp_product
  belongs_to :bp_end_of_life_default_scenario
end
 
 
