class StFamilyProcess < ActiveRecord::Base
  has_many :st_processes

  def name_en
    StFamilyProcessTranslation.find_by_st_family_process_id_and_locale(id,"en").name
  end
end
