class TransportDistribution < ActiveRecord::Base
   belongs_to :data_mode
   belongs_to :vehicle  
   belongs_to :product   
end
