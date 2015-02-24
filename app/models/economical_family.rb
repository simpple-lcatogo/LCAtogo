class EconomicalFamily < ActiveRecord::Base
  belongs_to :economical_phase
  
  has_many :economical_flows
end
