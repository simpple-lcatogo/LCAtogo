class PackagingDistribution < ActiveRecord::Base
   belongs_to :packaging
   belongs_to :product
end
