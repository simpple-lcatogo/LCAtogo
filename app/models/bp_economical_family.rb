class BpEconomicalFamily < ActiveRecord::Base
  belongs_to :bp_economical_phase  
  
  has_many :bp_economical_flows  
end
