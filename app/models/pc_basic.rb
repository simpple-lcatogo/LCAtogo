class PcBasic < ActiveRecord::Base
   belongs_to :pc_product
   belongs_to :pc_country_info
   belongs_to :pc_coating_type
end
