class StProcessData < ActiveRecord::Base
   belongs_to :st_family_process
   belongs_to :st_process   
   belongs_to :st_product
end
