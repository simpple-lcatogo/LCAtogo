class Economic < ActiveRecord::Base
  belongs_to :product
  
  has_many :electronic_economics
end
