class SeUtility < ActiveRecord::Base
  def name_en
    SeUtilityTranslation.find_by_se_utility_id_and_locale(id,"en").name
  end
end

