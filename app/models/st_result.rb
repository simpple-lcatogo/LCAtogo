class StResult < ActiveRecord::Base
  acts_as_tree
  
  has_one :st_result_value    
end
