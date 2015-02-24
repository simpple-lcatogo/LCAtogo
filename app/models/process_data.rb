class ProcessData < ActiveRecord::Base
   belongs_to :data_module
   belongs_to :family
   belongs_to :data_process
   belongs_to :product  
end
