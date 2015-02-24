class BpResult < ActiveRecord::Base
  acts_as_tree
  
  has_one :result_value  
end
