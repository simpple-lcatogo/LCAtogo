class SeComponent < ActiveRecord::Base
	has_many :se_manufacturing_datas

  def name_en
    name
  end
end
