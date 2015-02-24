class SeConsumable < ActiveRecord::Base
	has_many :se_use_consumption_consumable_datas

	def name_en
    	SeConsumableTranslation.find(:all, :conditions => ["se_consumable_id = ? and locale='en'", id]).first.name
  	end
end
