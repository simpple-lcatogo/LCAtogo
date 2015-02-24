class Family < ActiveRecord::Base
  belongs_to :data_module  
  has_many :materials
  has_many :energy_types
end
