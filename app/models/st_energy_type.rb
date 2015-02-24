class StEnergyType < ActiveRecord::Base
  has_many :st_energy_sources

  def name_en
    StEnergyTypeTranslation.find_by_st_energy_type_id_and_locale(id,"en").name
  end
end
