class BpManufacturingProcessVariable < ActiveRecord::Base
  has_and_belongs_to_many :bp_manufacturing_processes
  has_many :bp_manufacturing_process_variable_values

  def name_en
    BpManufacturingProcessVariableTranslation.find(:all, :conditions => ["bp_manufacturing_process_variable_id = ? and locale='en'", id]).first.name
  end

end
