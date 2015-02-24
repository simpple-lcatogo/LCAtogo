class SeEnergyUse < ActiveRecord::Base
	has_many :se_use_consumption_datas
	
	def name_en
   	SeEnergyUseTranslation.find(:all, :conditions => ["se_energy_use_id = ? and locale='en'", id]).first.name
  end

end
