class AddNewBpProcess < ActiveRecord::Migration
  def self.up
   #bp_manufacturing_process_compounding = BpManufacturingProcess.create(:name => 'Compounding')
   #BpManufacturingProcessTranslation.create(:bp_manufacturing_process_id => bp_manufacturing_process_compounding.id, :name => 'Compounding', :locale => 'en')
   #
   #bp_material_rigid_PVC = BpMaterial.find(:first, :conditions => ["name = 'Rigid PVC compound'"])
   #bp_material_flexible_PVC = BpMaterial.find(:first, :conditions => ["name = 'Flexible PVC compound'"])
   #
   #if bp_material_rigid_PVC && bp_material_flexible_PVC
   #    bp_material_rigid_PVC.bp_manufacturing_processes << bp_manufacturing_process_compounding
   #    bp_material_flexible_PVC.bp_manufacturing_processes << bp_manufacturing_process_compounding
   #
   #
   #    bp_manufacturing_process_variable_electricity_use = BpManufacturingProcessVariable.find(:first, :conditions => ["name = 'Electricity use'"])
   #    bp_manufacturing_process_variable_lubricating_oil = BpManufacturingProcessVariable.find(:first, :conditions => ["name = 'Lubricating oil'"])
   #    bp_manufacturing_process_variable_water_cooling = BpManufacturingProcessVariable.find(:first, :conditions => ["name = 'Water cooling'"])
   #    bp_manufacturing_process_variable_production_scrap = BpManufacturingProcessVariable.find(:first, :conditions => ["name = 'Production waste'"])
   #
   #
   #    bp_manufacturing_process_compounding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_electricity_use
   #    bp_manufacturing_process_compounding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_lubricating_oil
   #    bp_manufacturing_process_compounding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_water_cooling
   #    bp_manufacturing_process_compounding.bp_manufacturing_process_variables << bp_manufacturing_process_variable_production_scrap
   #
   #    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_compounding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.526)
   #    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_compounding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0379)
   #    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_compounding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.00081)
   #    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_rigid_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_compounding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 0)
   #
   #    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_compounding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_electricity_use.id, :value => 0.526)
   #    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_compounding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_lubricating_oil.id, :value => 0.0379)
   #    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_compounding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_water_cooling.id, :value => 0.00081)
   #    BpManufacturingProcessVariableValue.create(:bp_material_id => bp_material_flexible_PVC.id, :bp_manufacturing_process_id => bp_manufacturing_process_compounding.id, :bp_manufacturing_process_variable_id => bp_manufacturing_process_variable_production_scrap.id, :value => 0)
   #
   #end
    
    
  end

  def self.down
     #bp_manufacturing_process = BpManufacturingProcess.find_by_name('Compounding')
     #if bp_manufacturing_process
     #   bp_manufacturing_process.delete
     #end
    
  end
end
