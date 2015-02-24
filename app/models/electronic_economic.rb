class ElectronicEconomic < ActiveRecord::Base
  belongs_to :economic
  
  belongs_to :economical_phase
  belongs_to :economical_family
  belongs_to :economical_flow
  belongs_to :material
  belongs_to :energy_type 
end
