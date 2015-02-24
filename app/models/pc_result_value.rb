class PcResultValue < ActiveRecord::Base
   belongs_to :pc_product
   belongs_to :indicator
end
