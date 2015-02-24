class StProcess < ActiveRecord::Base
  belongs_to :st_family_process
  
  def name_en
    StProcessTranslation.find_by_st_process_id_and_locale(id,"en").name
  end

end
