class AddBpFinishingProcessVariableValues < ActiveRecord::Migration
  def self.up
    
    
   bp_manufacturing_process_variable_electricity_use = BpManufacturingProcessVariable.find(:first, :conditions => ["name = 'Electricity use'"])
   bp_manufacturing_process_variable_ink = BpManufacturingProcessVariable.find(:first, :conditions => ["name = 'Amount of ink'"])
   bp_manufacturing_process_variable_glue = BpManufacturingProcessVariable.find(:first, :conditions => ["name = 'Amount of glue/binder/adhesive'"])   
    
   bp_material_polylactic_acid_corn_based = BpMaterial.find_by_name('Polylactic acid, corn-based')    
   bp_material_polylactic_acid_sugarcane_based = BpMaterial.find_by_name('Polylactic acid, sugarcane-based')   
   bp_material_starch_blend_type_1 = BpMaterial.find_by_name('TPS blend type I (for film applications)')
   bp_material_starch_blend_type_2 = BpMaterial.find_by_name('TPS blend type II (for film applications)')
   bp_material_potato_based_fermented_starch_plastic =  BpMaterial.find_by_name('Potato starch-based plastic')
   bp_material_sugarcane_based_HDPE = BpMaterial.find_by_name('Sugarcane-based HDPE')    
   bp_material_sugarcane_based_LDPE = BpMaterial.find_by_name('Sugarcane-based LDPE')
   bp_material_PHB = BpMaterial.find_by_name('PHB')   
   bp_material_partially_sugarcane_based_PET = BpMaterial.find_by_name('Partially bio-based PET')
   bp_material_PBS = BpMaterial.find_by_name('Partially bio-based PBS')   
   bp_material_PP = BpMaterial.find_by_name('PP')   
   bp_material_LDPE = BpMaterial.find_by_name('LDPE')   
   bp_material_HDPE = BpMaterial.find_by_name('HDPE')   
   bp_material_LLDPE = BpMaterial.find_by_name('LLDPE')
   bp_material_rigid_PVC = BpMaterial.find_by_name('Rigid PVC')
   bp_material_flexible_PVC = BpMaterial.find_by_name('Flexible PVC')
   bp_material_PET = BpMaterial.find_by_name('PET')   
        
   bp_manufacturing_process_laminating = BpManufacturingProcess.find_by_name('Laminating')
   bp_manufacturing_process_printing = BpManufacturingProcess.find_by_name('Printing')
   bp_manufacturing_process_forming = BpManufacturingProcess.find_by_name('Forming')    
                 
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_corn_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    

    
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_polylactic_acid_sugarcane_based.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_1.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_starch_blend_type_2.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_potato_based_fermented_starch_plastic.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_sugarcane_based_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PHB.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_partially_sugarcane_based_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    


   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PBS.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PP.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_HDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    
    
    
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_LLDPE.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

    
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

    
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_laminating.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_printing.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)

   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_ink.id, :value => 0)
   BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_PET.id, :bp_manufacturing_process_id => bp_manufacturing_process_forming.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_glue.id, :value => 0)
    
    
  end

  def self.down
  end
end
