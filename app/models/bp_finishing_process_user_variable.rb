class BpFinishingProcessUserVariable < ActiveRecord::Base
  belongs_to :bp_manufacturing_proces_variable
  belongs_to :bp_finishing_data

  validates :value, :numericality => true
end