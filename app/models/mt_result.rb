class MtResult < ActiveRecord::Base
  acts_as_tree
  
  has_one :mt_result_value   
end
