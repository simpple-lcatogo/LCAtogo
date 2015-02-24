class BpCompoundMaterial < ActiveRecord::Base
  belongs_to :bp_compound_family
  
  has_many :bp_compound_material_translations
end
