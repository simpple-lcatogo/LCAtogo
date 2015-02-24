class BpMaterialData < ActiveRecord::Base
	belongs_to :bp_product
	belongs_to :bp_unit
	belongs_to :bp_material

	validates :quantity, :numericality => true
end
