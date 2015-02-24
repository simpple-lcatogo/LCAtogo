class ExcelValue < ActiveRecord::Base
  belongs_to :material
  
  has_many :excel_value_users
end
