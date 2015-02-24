class BpFinishingProcessVariableValue < ActiveRecord::Base
  belongs_to :bp_material
  belongs_to :bp_finishing_process_variable
  belongs_to :bp_manufacturing_process
end
