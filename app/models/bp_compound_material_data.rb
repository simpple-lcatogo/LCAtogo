class BpCompoundMaterialData < ActiveRecord::Base
  belongs_to :bp_product
  belongs_to :bp_compound_material
  belongs_to :bp_compound_family
  belongs_to :bp_unit
end
