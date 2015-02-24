class StMaterial < ActiveRecord::Base
  belongs_to :st_family

  def name_en
    StMaterialTranslation.find_by_st_material_id_and_locale(id,"en").name
  end
end
