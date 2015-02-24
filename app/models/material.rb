class Material < ActiveRecord::Base
   belongs_to :family
   has_many :material_translations
end
