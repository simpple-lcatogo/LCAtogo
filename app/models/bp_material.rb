class BpMaterial < ActiveRecord::Base
	has_and_belongs_to_many :bp_manufacturing_processes
	
  has_many :bp_material_translations
end
