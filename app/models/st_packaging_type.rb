class StPackagingType < ActiveRecord::Base
  def name_en
    StPackagingTypeTranslation.find_by_st_packaging_type_id_and_locale(id,"en").name
  end
end
