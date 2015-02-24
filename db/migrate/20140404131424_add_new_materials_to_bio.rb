class AddNewMaterialsToBio < ActiveRecord::Migration
  def self.up
    bp_material_HDPE_recycled = BpMaterial.create(:name => 'HDPE recycled', :based_type => 'oil')
    BpMaterialTranslation.create(:bp_material_id => bp_material_HDPE_recycled.id, :name => 'HDPE recycled', :locale => 'en')

    bp_material_PET_recycled = BpMaterial.create(:name => 'PET recycled', :based_type => 'oil')
    BpMaterialTranslation.create(:bp_material_id => bp_material_PET_recycled.id, :name => 'PET recycled', :locale => 'en')

    bp_material_HIPS = BpMaterial.create(:name => 'HIPS', :based_type => 'oil')
    BpMaterialTranslation.create(:bp_material_id => bp_material_HIPS.id, :name => 'HIPS', :locale => 'en')

#    bp_material_HDPE_recycled = BpMaterial.find_by_name('HDPE recycled')
 #   bp_material_PET_recycled = BpMaterial.find_by_name('PET recycled')
  #  bp_material_HIPS = BpMaterial.find_by_name('HIPS')

    indicator_1 = Indicator.find_by_name_and_sector('Global Warming', 'bio-plastic')
    indicator_2 = Indicator.find_by_name_and_sector('Water Footprint', 'bio-plastic')
    indicator_3 = Indicator.find_by_name_and_sector('Land Use', 'bio-plastic')
    indicator_4 = Indicator.find_by_name_and_sector('Cumulative Energy Demand (CED) - non-renewable', 'bio-plastic')
    indicator_5 = Indicator.find_by_name_and_sector('Cumulative Energy Demand (CED) - renewable', 'bio-plastic')
    indicator_6 = Indicator.find_by_name_and_sector('Eutrophication', 'bio-plastic')
    indicator_7 = Indicator.find_by_name_and_sector('Acidification', 'bio-plastic')
    indicator_8 = Indicator.find_by_name_and_sector('Photochemical Ozone Creation Potential', 'bio-plastic')
    indicator_9 = Indicator.find_by_name_and_sector('Respiratory Inorganics', 'bio-plastic')


    BpExcelValue.create(:indicator_id => indicator_1.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 1.261617173091)
    BpExcelValue.create(:indicator_id => indicator_2.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0.44)
    BpExcelValue.create(:indicator_id => indicator_3.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_4.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 46.0827403633532)
    BpExcelValue.create(:indicator_id => indicator_5.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_6.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0.00033886941)
    BpExcelValue.create(:indicator_id => indicator_7.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0.02232070844)
    BpExcelValue.create(:indicator_id => indicator_8.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0.0000744729324318)
    BpExcelValue.create(:indicator_id => indicator_9.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0.00184404230042278)

    BpExcelValue.create(:indicator_id => indicator_1.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 1.988829171022)
    BpExcelValue.create(:indicator_id => indicator_2.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0.39)
    BpExcelValue.create(:indicator_id => indicator_3.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_4.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 45.849999250407)
    BpExcelValue.create(:indicator_id => indicator_5.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_6.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0.0009200709)
    BpExcelValue.create(:indicator_id => indicator_7.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0.019680320088)
    BpExcelValue.create(:indicator_id => indicator_8.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0.0000438573467)
    BpExcelValue.create(:indicator_id => indicator_9.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0.0019963437871032)

    BpExcelValue.create(:indicator_id => indicator_1.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 2.43)
    BpExcelValue.create(:indicator_id => indicator_2.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 34.7)
    BpExcelValue.create(:indicator_id => indicator_3.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_4.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 79.9)
    BpExcelValue.create(:indicator_id => indicator_5.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0.569)
    BpExcelValue.create(:indicator_id => indicator_6.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0.000474)
    BpExcelValue.create(:indicator_id => indicator_7.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0.00566)
    BpExcelValue.create(:indicator_id => indicator_8.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0.000369)
    BpExcelValue.create(:indicator_id => indicator_9.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'RAW MATERIALS', :category => "MATERIALS", :family => "Oil-based plastics", :value => 0.000743851852053731)

    ## Recycling
    BpExcelValue.create(:indicator_id => indicator_1.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0.163)
    BpExcelValue.create(:indicator_id => indicator_2.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_3.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_4.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_5.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_6.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_7.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_8.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_9.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)

    BpExcelValue.create(:indicator_id => indicator_1.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0.163)
    BpExcelValue.create(:indicator_id => indicator_2.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_3.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_4.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_5.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_6.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_7.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_8.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_9.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)

    BpExcelValue.create(:indicator_id => indicator_1.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0.163)
    BpExcelValue.create(:indicator_id => indicator_2.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_3.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_4.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_5.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_6.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_7.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_8.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_9.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Recycling", :value => 0)


    ## Incineration
    BpExcelValue.create(:indicator_id => indicator_1.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0.887)
    BpExcelValue.create(:indicator_id => indicator_2.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_3.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_4.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_5.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_6.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_7.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_8.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_9.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)


    BpExcelValue.create(:indicator_id => indicator_1.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 1.05)
    BpExcelValue.create(:indicator_id => indicator_2.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_3.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_4.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_5.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_6.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_7.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_8.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_9.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)

    BpExcelValue.create(:indicator_id => indicator_1.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0.887)
    BpExcelValue.create(:indicator_id => indicator_2.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_3.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_4.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_5.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_6.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_7.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_8.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_9.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Incineration", :value => 0)

    ## Landfill
    BpExcelValue.create(:indicator_id => indicator_1.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0.528)
    BpExcelValue.create(:indicator_id => indicator_2.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_3.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_4.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_5.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_6.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_7.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_8.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_9.id, :functional_unit => 'kg', :local_name => 'HDPE recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)


    BpExcelValue.create(:indicator_id => indicator_1.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0.528)
    BpExcelValue.create(:indicator_id => indicator_2.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_3.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_4.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_5.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_6.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_7.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_8.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_9.id, :functional_unit => 'kg', :local_name => 'PET recycled', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)

    BpExcelValue.create(:indicator_id => indicator_1.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0.528)
    BpExcelValue.create(:indicator_id => indicator_2.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_3.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_4.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_5.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_6.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_7.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_8.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)
    BpExcelValue.create(:indicator_id => indicator_9.id, :functional_unit => 'kg', :local_name => 'HIPS', :life_cycle_phase => 'END-OF-LIFE', :category => "WASTE TREATMENT", :family => "Landfill", :value => 0)

    bp_excel_values = BpExcelValue.find_all_by_local_name_and_family("Partially bio-based PBS", "Composting")
    bp_excel_values.each do |bp_excel_value|
        if bp_excel_value.indicator.id = indicator_1.id
          bp_excel_value.value = 1.53
        else
          bp_excel_value.value = 0
        end
        bp_excel_value.save
    end


    bp_manufacturing_process_cast_sheet_film_extrusion = BpManufacturingProcess.find_by_name_and_process_type('Cast sheet/film extrusion', 'processing')
    bp_manufacturing_process_thermoforming = BpManufacturingProcess.find_by_name_and_process_type('Thermoforming', 'processing')
    bp_manufacturing_process_drying_of_pellets = BpManufacturingProcess.find_by_name_and_process_type('Drying of pellets', 'processing')
    bp_manufacturing_process_pipe_profile_extrusion = BpManufacturingProcess.find_by_name_and_process_type('Pipe/profile extrusion', 'processing')
    bp_manufacturing_process_film_blowing = BpManufacturingProcess.find_by_name_and_process_type('Film blowing', 'processing')
    bp_manufacturing_process_injection_strecht_blow_moulding = BpManufacturingProcess.find_by_name_and_process_type('Injection stretch blow moulding', 'processing')
    bp_manufacturing_process_injection_moulding = BpManufacturingProcess.find_by_name_and_process_type('Injection moulding', 'processing')
    bp_manufacturing_process_extrusion_blow_moulding = BpManufacturingProcess.find_by_name_and_process_type('Extrusion blow moulding', 'processing')

    bp_manufacturing_process_laminating = BpManufacturingProcess.find_by_name_and_process_type('Laminating', 'finishing')
    bp_manufacturing_process_printing = BpManufacturingProcess.find_by_name_and_process_type('Printing', 'finishing')
    bp_manufacturing_process_forming = BpManufacturingProcess.find_by_name_and_process_type('Forming', 'finishing')



    bp_material_HIPS.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
    bp_material_HIPS.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
    bp_material_HIPS.bp_manufacturing_processes << bp_manufacturing_process_laminating
    bp_material_HIPS.bp_manufacturing_processes << bp_manufacturing_process_printing
    bp_material_HIPS.bp_manufacturing_processes << bp_manufacturing_process_forming
    bp_material_HIPS.save

    bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_drying_of_pellets
    bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
    bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_pipe_profile_extrusion
    bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
    bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_injection_strecht_blow_moulding
    bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
    bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
    bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_laminating
    bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_printing
    bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_forming
    bp_material_PET_recycled.save

    bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_cast_sheet_film_extrusion
    bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_pipe_profile_extrusion
    bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_film_blowing
    bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_extrusion_blow_moulding
    bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_thermoforming
    bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding
    bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_laminating
    bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_printing
    bp_material_HDPE_recycled.bp_manufacturing_processes << bp_manufacturing_process_forming
    bp_material_HDPE_recycled.save

    bp_manufacturing_process_variable_electricity_use = BpManufacturingProcessVariable.find_by_name('Electricity use')
    bp_manufacturing_process_variable_lubricating_oil = BpManufacturingProcessVariable.find_by_name('Lubricating oil')
    bp_manufacturing_process_variable_water_cooling = BpManufacturingProcessVariable.find_by_name('Water cooling')
    bp_manufacturing_process_variable_production_scrap = BpManufacturingProcessVariable.find_by_name('Production waste')
    bp_manufacturing_process_variable_glue = BpManufacturingProcessVariable.find_by_name('Amount of glue/binder/adhesive')
    bp_manufacturing_process_variable_ink = BpManufacturingProcessVariable.find_by_name('Amount of ink')
    bp_manufacturing_process_variable_drying_temp = BpManufacturingProcessVariable.find_by_name('Drying temp')
    bp_manufacturing_process_variable_drying_time = BpManufacturingProcessVariable.find_by_name('Drying time')
    bp_manufacturing_process_variable_not_default_data = BpManufacturingProcessVariable.find_by_name('Electricity consumption')
    ##

    #HIPS (Cast film/sheet extrusion)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.66)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000117)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
    #HIPS (Thermoforming)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.01)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000571)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.104)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
    #HIPS (Forming)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
    #HIPS (Laminating)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
    #HIPS (Printing)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HIPS.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)



    ###
    ##PET recycled (Drying of palets)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_temp.id, :value => 160)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_drying_time.id, :value => 4)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_drying_of_pellets.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_not_default_data.id, :value => 0.278)
    #PET recycled (Cast film/sheet extrusion)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.66)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000117)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
    #PET recycled (Extrusion pipe, profile)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00346)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
    #PET recycled (Film blowing)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
    #PET recycled (Injection blow moulding)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.5)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00222)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.11)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_strecht_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 100)
    #PET recycled (Thermoforming)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.01)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000571)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.104)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
    #PET recycled (Injection moulding)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.33)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0104)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0000919)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 98.8)
    #PET recycled (Forming)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
    #PET recycled (Laminating)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
    #PET recycled (Printing)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)


    ##
    #HDPE recycled (Cast film/sheet extrusion)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.66)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000178)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.0437 )
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_cast_sheet_film_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 97.6)
    #HDPE recycled(Extrusion pipe, profile)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.548)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.00346)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000689)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_pipe_profile_extrusion.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 100)
    #HDPE recycled(Film blowing)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.591)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000799)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_film_blowing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.8)
    #HDPE recycled(Extrusion blow moulding)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.70)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.00299)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_extrusion_blow_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
    #HDPE recycled(Thermoforming)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.01)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.000571)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.104)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_thermoforming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.7)
    #HDPE recycled(Injection moulding)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1.99)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0104)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.000000398)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 100 - 99.4)
    #HDPE recycled(Forming)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
    #HDPE recycled(Laminating)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.0183)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
    #HDPE recycled(Printing)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.05784)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)


    bp_manufacturing_process_injection_moulding_performs = BpManufacturingProcess.create(:name => 'Injection moulding of performs', :process_type => 'processing')
    BpManufacturingProcessTranslation.create(:bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :name => 'Injection moulding of performs', :locale => 'en')

    bp_manufacturing_process_strech_performs = BpManufacturingProcess.create(:name => 'Strech blown of performs', :process_type => 'processing')
    BpManufacturingProcessTranslation.create(:bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :name => 'Strech blown of performs', :locale => 'en')

    bp_manufacturing_process_variable_electricity_use =  BpManufacturingProcessVariable.find_by_name('Electricity use')
    bp_manufacturing_process_variable_lubricating_oil =  BpManufacturingProcessVariable.find_by_name('Lubricating oil')
    bp_manufacturing_process_variable_water_cooling =  BpManufacturingProcessVariable.find_by_name('Water cooling')
    bp_manufacturing_process_variable_production_scrap =  BpManufacturingProcessVariable.find_by_name('Production waste')

    bp_manufacturing_process_injection_moulding_performs.bp_manufacturing_process_variables << bp_manufacturing_process_variable_electricity_use
    bp_manufacturing_process_injection_moulding_performs.bp_manufacturing_process_variables << bp_manufacturing_process_variable_lubricating_oil
    bp_manufacturing_process_injection_moulding_performs.bp_manufacturing_process_variables << bp_manufacturing_process_variable_water_cooling
    bp_manufacturing_process_injection_moulding_performs.bp_manufacturing_process_variables << bp_manufacturing_process_variable_production_scrap

    bp_manufacturing_process_strech_performs.bp_manufacturing_process_variables << bp_manufacturing_process_variable_electricity_use
    bp_manufacturing_process_strech_performs.bp_manufacturing_process_variables << bp_manufacturing_process_variable_lubricating_oil
    bp_manufacturing_process_strech_performs.bp_manufacturing_process_variables << bp_manufacturing_process_variable_water_cooling
    bp_manufacturing_process_strech_performs.bp_manufacturing_process_variables << bp_manufacturing_process_variable_production_scrap

    bp_material_polylactic_acid_corn_based = BpMaterial.find_by_name('Polylactic acid, corn-based')
    bp_material_polylactic_acid_sugarcane_based = BpMaterial.find_by_name('Polylactic acid, sugarcane-based')
    bp_material_partially_sugarcane_based_PET = BpMaterial.find_by_name('Partially bio-based PET')
    bp_material_PP = BpMaterial.find_by_name('PP')
    bp_material_PET = BpMaterial.find_by_name('PET')

    bp_material_polylactic_acid_corn_based.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding_performs
    bp_material_polylactic_acid_corn_based.bp_manufacturing_processes << bp_manufacturing_process_strech_performs
    bp_material_polylactic_acid_sugarcane_based.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding_performs
    bp_material_polylactic_acid_sugarcane_based.bp_manufacturing_processes << bp_manufacturing_process_strech_performs
    bp_material_partially_sugarcane_based_PET.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding_performs
    bp_material_partially_sugarcane_based_PET.bp_manufacturing_processes << bp_manufacturing_process_strech_performs
    bp_material_PP.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding_performs
    bp_material_PP.bp_manufacturing_processes << bp_manufacturing_process_strech_performs
    bp_material_PET.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding_performs
    bp_material_PET.bp_manufacturing_processes << bp_manufacturing_process_strech_performs
    bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_injection_moulding_performs
    bp_material_PET_recycled.bp_manufacturing_processes << bp_manufacturing_process_strech_performs


    #bp_material_polylactic_acid_corn_based
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 1)
    #bp_material_polylactic_acid_corn_based
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 1)
    #bp_material_polylactic_acid_sugarcane_based
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 1)
    #bp_material_polylactic_acid_sugarcane_based
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 1)
    #bp_material_partially_sugarcane_based_PET
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 1)
    #bp_material_partially_sugarcane_based_PET
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 1)
    #bp_material_PP
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 1)
    #bp_material_PP
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 1)
    #bp_material_PET
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 1)
    #bp_material_PET
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 1)
    #bp_material_PET_recycled
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_injection_moulding_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 1)
    #bp_material_PET_recycled
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 1)
    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET_recycled.id, :bp_manufacturing_process_id => bp_manufacturing_process_strech_performs.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 1)




  end

  def self.down
  end
end
