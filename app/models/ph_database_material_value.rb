class PhDatabaseMaterialValue < ActiveRecord::Base
  belongs_to :ph_product  
  belongs_to :ph_database_material
end
