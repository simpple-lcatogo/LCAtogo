class BpElectronicEconomic < ActiveRecord::Base
  belongs_to :bp_economic
  
  belongs_to :bp_economical_phase
  belongs_to :bp_economical_family
  belongs_to :bp_economical_flow
  belongs_to :bp_material
  belongs_to :bp_compound_material
  belongs_to :bp_vehicle
  belongs_to :bp_manufacturing_process
  belongs_to :bp_distribution_default_value 
end
