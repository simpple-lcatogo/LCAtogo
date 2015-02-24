class RefixBpDryingPellets < ActiveRecord::Migration
  def self.up
   bp_manufacturing_process_drying_of_pellets = BpManufacturingProcess.find_by_name('Drying of pellets')

   bp_material_polylactic_acid_corn_based = BpMaterial.find_by_name('Polylactic acid, corn-based')
   bp_material_polylactic_acid_sugarcane_based = BpMaterial.find_by_name('Polylactic acid, sugarcane-based')
   bp_material_starch_blend_type_1 = BpMaterial.find_by_name('TPS blend type I (for film applications)')
   bp_material_starch_blend_type_2 = BpMaterial.find_by_name('TPS blend type II (for film applications)')
   bp_material_potato_based_fermented_starch_plastic = BpMaterial.find_by_name('Potato starch-based plastic')  
   bp_material_PHB = BpMaterial.find_by_name('PHB')
   bp_material_partially_sugarcane_based_PET = BpMaterial.find_by_name('Partially bio-based PET')
   bp_material_PBS = BpMaterial.find_by_name('Partially bio-based PBS')
   bp_material_PET = BpMaterial.find_by_name('PET') 
   
   bp_manufacturing_process_variable_drying_temp = BpManufacturingProcessVariable.find_by_name('Drying temp')
   bp_manufacturing_process_variable_drying_time = BpManufacturingProcessVariable.find_by_name('Drying time')
   
   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_polylactic_acid_corn_based.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_temp.id])
   bp_manufacturing_process_variable_value.value = 60
   bp_manufacturing_process_variable_value.save
   
   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_polylactic_acid_corn_based.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_time.id])
   bp_manufacturing_process_variable_value.value = 3
   bp_manufacturing_process_variable_value.save

   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_polylactic_acid_sugarcane_based.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_temp.id])
   bp_manufacturing_process_variable_value.value = 60
   bp_manufacturing_process_variable_value.save
   
   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_polylactic_acid_sugarcane_based.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_time.id])
   bp_manufacturing_process_variable_value.value = 3
   bp_manufacturing_process_variable_value.save




   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_starch_blend_type_1.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_temp.id])
   bp_manufacturing_process_variable_value.value = 70
   bp_manufacturing_process_variable_value.save

   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_starch_blend_type_1.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_time.id])
   bp_manufacturing_process_variable_value.value = 3
   bp_manufacturing_process_variable_value.save


   ##Ara es TPS blend Type II
   #Starch blend type II (Drying of palets)
   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_starch_blend_type_2.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_temp.id])
   bp_manufacturing_process_variable_value.value = 70
   bp_manufacturing_process_variable_value.save

   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_starch_blend_type_2.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_time.id])
   bp_manufacturing_process_variable_value.value = 3
   bp_manufacturing_process_variable_value.save



   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_potato_based_fermented_starch_plastic.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_temp.id])
   bp_manufacturing_process_variable_value.value = 70
   bp_manufacturing_process_variable_value.save


   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_potato_based_fermented_starch_plastic.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_time.id])
   bp_manufacturing_process_variable_value.value = 3
   bp_manufacturing_process_variable_value.save



   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_PHB.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_temp.id])
   bp_manufacturing_process_variable_value.value = 80
   bp_manufacturing_process_variable_value.save

   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_PHB.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_time.id])
   bp_manufacturing_process_variable_value.value = 3
   bp_manufacturing_process_variable_value.save



   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_partially_sugarcane_based_PET.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_temp.id])
   bp_manufacturing_process_variable_value.value = 160
   bp_manufacturing_process_variable_value.save

   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_partially_sugarcane_based_PET.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_time.id])
   bp_manufacturing_process_variable_value.value = 4
   bp_manufacturing_process_variable_value.save



   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_PBS.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_temp.id])
   bp_manufacturing_process_variable_value.value = 75
   bp_manufacturing_process_variable_value.save

   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_PBS.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_time.id])
   bp_manufacturing_process_variable_value.value = 5
   bp_manufacturing_process_variable_value.save



   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_PET.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_temp.id])
   bp_manufacturing_process_variable_value.value = 160
   bp_manufacturing_process_variable_value.save

   bp_manufacturing_process_variable_value = BpManufacturingProcessVariableValue.find(:first, :conditions => ["bp_material_id = ? and bp_manufacturing_process_id = ? and bp_manufacturing_process_variable_id = ?", bp_material_PET.id, bp_manufacturing_process_drying_of_pellets.id, bp_manufacturing_process_variable_drying_time.id])
   bp_manufacturing_process_variable_value.value = 4
   bp_manufacturing_process_variable_value.save
    
  end

  def self.down
  end

end
