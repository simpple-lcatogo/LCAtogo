class BpEconomic < ActiveRecord::Base
  belongs_to :bp_product
  
  has_many :bp_electronic_economics  
end
