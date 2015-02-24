class SeRecyclingData < ActiveRecord::Base
	belongs_to :se_product
	belongs_to :se_production_yield_loss_material
end
