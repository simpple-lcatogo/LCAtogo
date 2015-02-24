class ExcelValueUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :excel_value  
end
