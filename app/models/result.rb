class Result < ActiveRecord::Base
  acts_as_tree
  
  has_one :result_value
  belongs_to :family
end
