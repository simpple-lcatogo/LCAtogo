class UpdateMtDatabase < ActiveRecord::Migration
  def self.up
#    indicator_mt = Indicator.find_by_sector("machine")
#    
#    mt_family_metals = MtFamily.find_by_name('Metals')
#    mt_family_other = MtFamily.find_by_name('Other')    
#    
#    mt_material = MtMaterial.find_by_name("PP")
#    if mt_material
#      mt_material.name = 'Polypropylene (PP)'
#      mt_material.save
#    end
#    mt_excel_value = ExcelValue.find_by_name_and_indicator_id("PP", indicator_mt.id)
#    if mt_excel_value
#      mt_excel_value.name = 'Polypropylene (PP)'
#      mt_excel_value.save
#    end
#    
#    
#    mt_material = MtMaterial.find_by_name("PVC")
#    if mt_material    
#      mt_material.name = 'Polyvinylchloride (PVC)'
#      mt_material.save
#    end  
#    mt_excel_value = ExcelValue.find_by_name_and_indicator_id("PVC", indicator_mt.id)    
#    if mt_excel_value
#      mt_excel_value.name = 'Polyvinylchloride (PVC)'
#      mt_excel_value.save
#    end
#    
#    
#    mt_material = MtMaterial.find_by_name("PE_foil")
#    if mt_material    
#      mt_material.name = 'Polyethylene_Pacakging film (PE foil)'
#      mt_material.save
#    end  
#    mt_excel_value = ExcelValue.find_by_name_and_indicator_id("PE_foil", indicator_mt.id)    
#    if mt_excel_value
#      mt_excel_value.name = 'Polyethylene_Pacakging film (PE foil)'
#      mt_excel_value.save
#    end
#    
#    mt_material = MtMaterial.find_by_name("Fibre Glass")
#    if mt_material    
#      mt_material.name = 'Fibre Glass_Unknown'
#      mt_material.save
#    end  
#    mt_excel_value = ExcelValue.find_by_name_and_indicator_id("Fibre Glass", indicator_mt.id)    
#    if mt_excel_value
#      mt_excel_value.name = 'Fibre Glass_Unknown'
#      mt_excel_value.save
#    end
#
#
#    mt_material = MtMaterial.find_by_name("Plastic")
#    if mt_material    
#      mt_material.name = 'Plastic_Unknown'
#      mt_material.save
#    end  
#    mt_excel_value = ExcelValue.find_by_name_and_indicator_id("Plastic", indicator_mt.id)    
#    if mt_excel_value
#      mt_excel_value.name = 'Plastic_Unknown'
#      mt_excel_value.save
#    end
#
#
#    mt_material = MtMaterial.find_by_name("Steel_primary_low alloyed")
#    if mt_material    
#      mt_material.name = 'Steel_Low alloyed'
#      mt_material.save
#    end  
#    mt_excel_value = ExcelValue.find_by_name_and_indicator_id("Steel_primary_low alloyed", indicator_mt.id)    
#    if mt_excel_value
#      mt_excel_value.name = 'Steel_Low alloyed'
#      mt_excel_value.save
#    end
#    
#    mt_material = MtMaterial.find_by_name("Steel_primary_chromium steel")
#    if mt_material    
#      mt_material.name = 'Steel_Chromium steel'
#      mt_material.save
#    end  
#    mt_excel_value = ExcelValue.find_by_name_and_indicator_id("Steel_primary_chromium steel", indicator_mt.id)    
#    if mt_excel_value
#      mt_excel_value.name = 'Steel_Chromium steel'
#      mt_excel_value.save
#    end
#
#
#    mt_material = MtMaterial.find_by_name("Steel_primary")
#    if mt_material    
#      mt_material.name = 'Steel_Unknown'
#      mt_material.save
#    end  
#    mt_excel_value = ExcelValue.find_by_name_and_indicator_id("Steel_primary", indicator_mt.id)    
#    if mt_excel_value
#      mt_excel_value.name = 'Steel_Unknown'
#      mt_excel_value.save
#    end
#
#    mt_material = MtMaterial.find_by_name("Aluminium_primary")
#    if mt_material    
#      mt_material.name = 'Aluminium'
#      mt_material.save
#    end  
#    mt_excel_value = ExcelValue.find_by_name_and_indicator_id("Aluminium_primary", indicator_mt.id)    
#    if mt_excel_value
#      mt_excel_value.name = 'Aluminium'
#      mt_excel_value.save
#    end
#    
#    mt_material = MtMaterial.find_by_name("Copper_primary")
#    if mt_material    
#      mt_material.name = 'Copper'
#      mt_material.save
#    end  
#    mt_excel_value = ExcelValue.find_by_name_and_indicator_id("Copper_primary", indicator_mt.id)    
#    if mt_excel_value
#      mt_excel_value.name = 'Copper'
#      mt_excel_value.save
#    end
#
#    MtMaterial.create(:mt_family_id => mt_family_metals.id, :name => 'Brass', :unit => 'kg', :general => false, :recycling => -6.4, :incineration => 0.602, :landfill => 0.198)
#    ExcelValue.create(:indicator_id => indicator_mt.id, :phase => 'MATERIALS, MANUFACTURING, END-OF-LIFE', :family => 'Metals', :name => 'Brass',  :value => 42.7)   
#    
#    mt_family_supplier_parts = MtFamily.create(:name => 'Supplier parts')
#    MtMaterial.create(:mt_family_id => mt_family_supplier_parts.id, :name => 'Cable', :unit => 'm', :general => false, :recycling => -1.771, :incineration => 0.41114, :landfill => 0.02364)
#    ExcelValue.create(:indicator_id => indicator_mt.id, :phase => 'MATERIALS', :family => 'Supplier parts', :name => 'Cable',  :value => 68.4)
#    MtMaterial.create(:mt_family_id => mt_family_supplier_parts.id, :name => 'Transformer', :unit => 'kg', :general => false, :recycling => -30.3, :incineration => 0.7, :landfill => 0.2)
#    ExcelValue.create(:indicator_id => indicator_mt.id, :phase => 'MATERIALS', :family => 'Supplier parts', :name => 'Transformer',  :value => 56.2)    
#    MtMaterial.create(:mt_family_id => mt_family_supplier_parts.id, :name => 'Power supply', :unit => 'p', :general => false, :recycling => -35.7459314775161, :incineration => 0.08169164882227, :landfill => 0.023340471092077)
#    ExcelValue.create(:indicator_id => indicator_mt.id, :phase => 'MATERIALS', :family => 'Supplier parts', :name => 'Power supply',  :value => 545)    
#    MtMaterial.create(:mt_family_id => mt_family_supplier_parts.id, :name => 'Cooling and Lubrication unit', :unit => 'kg', :general => false, :recycling => 0, :incineration => 0, :landfill => 0)
#    ExcelValue.create(:indicator_id => indicator_mt.id, :phase => 'MATERIALS', :family => 'Supplier parts', :name => 'Cooling and Lubrication unit',  :value => 0)    
#    MtMaterial.create(:mt_family_id => mt_family_supplier_parts.id, :name => 'Compressor', :unit => '', :general => false, :recycling => 0, :incineration => 0, :landfill => 0)
#    ExcelValue.create(:indicator_id => indicator_mt.id, :phase => 'MATERIALS', :family => 'Supplier parts', :name => 'Compressor',  :value => 0)    
#
#    MtMaterial.create(:mt_family_id => mt_family_other.id, :name => 'Tempered Glass', :unit => 'kg', :general => false, :recycling => -1.33, :incineration => 0.501, :landfill => 0.198)
#    ExcelValue.create(:indicator_id => indicator_mt.id, :phase => 'MATERIALS', :family => 'Other', :name => 'Tempered Glass',  :value => 18.4)   
#    
#    MtManufacturingProcess.create(:name => 'Drilling Brass', :unit => 'kg')
#    ExcelValue.create(:indicator_id => indicator_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Drilling Brass',  :value => 59.7)
#    MtManufacturingProcess.create(:name => 'Turning Brass', :unit => 'kg')    
#    ExcelValue.create(:indicator_id => indicator_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Turning Brass',  :value => 61.8)
#    MtManufacturingProcess.create(:name => 'Brass working', :unit => 'kg')    
#    ExcelValue.create(:indicator_id => indicator_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Brass working',  :value => 60.75)    
#    MtManufacturingProcess.create(:name => 'Injection Moulding', :unit => 'kg')    
#    ExcelValue.create(:indicator_id => indicator_mt.id, :phase => 'MANUFACTURING', :family => 'Metals', :name => 'Injection Moulding',  :value => 28.7)    
#    
#    family_other_energy = MtEnergyFamily.find_by_name('Other Energy')
#    MtEnergyProcess.create(:mt_energy_family_id => family_other_energy.id,:name => 'Heat_Light fuel oil', :unit => 'kg')
#    ExcelValue.create(:indicator_id => indicator_mt.id, :phase => 'MATERIALS, MANUFACTURE, USE', :family => 'Other Energy', :name => 'Heat_Light fuel oil',  :value => 21.5)    
#    
#    MtConsumable.create(:name => 'Lubricating oil')
#    ExcelValue.create(:indicator_id => indicator_mt.id, :phase => 'USE', :family => 'Consumables', :name => 'Lubricating oil',  :value => 79.8)    
  end

  def self.down
  end
end
