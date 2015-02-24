class SeProductionYieldLossMaterial < ActiveRecord::Base
  def name_en
    SeProductionYieldLossMaterialTranslation.find_by_se_production_yield_loss_material_id_and_locale(id,"en").name
  end
end
