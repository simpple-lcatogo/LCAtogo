class BpManufacturingProcess < ActiveRecord::Base
	has_and_belongs_to_many :bp_materials
	has_and_belongs_to_many :bp_manufacturing_process_variables  

  def name_en
    BpManufacturingProcessTranslation.find(:all, :conditions => ["bp_manufacturing_process_id = ? and locale='en'", id]).first.name
  end
end
