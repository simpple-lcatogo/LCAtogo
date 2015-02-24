class SeEnergyType < ActiveRecord::Base
	has_many :se_use_consumption_datas

	  def name_en
    	SeEnergyTypeTranslation.find(:all, :conditions => ["se_energy_type_id = ? and locale='en'", id]).first.name
  	end

  	def self.get_electricity_id	
  		SeEnergyTypeTranslation.find_by_name_and_locale("Electricity","en").se_energy_type_id
    end

end
