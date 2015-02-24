class StFamily < ActiveRecord::Base
  has_many :st_materials

  def name_en
    StFamilyTranslation.find_by_st_family_id_and_locale(id,"en").name
  end

end
