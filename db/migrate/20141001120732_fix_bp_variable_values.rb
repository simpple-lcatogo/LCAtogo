class FixBpVariableValues < ActiveRecord::Migration
  def self.up
    bp_manufacturing_process_variable_electricity_use =  BpManufacturingProcessVariable.find_by_name('Electricity use')
    bp_manufacturing_process_variable_lubricating_oil =  BpManufacturingProcessVariable.find_by_name('Lubricating oil')
    bp_manufacturing_process_variable_water_cooling =  BpManufacturingProcessVariable.find_by_name('Water cooling')
    bp_manufacturing_process_variable_production_scrap =  BpManufacturingProcessVariable.find_by_name('Production waste')

    bp_manufacturing_process_injection_moulding_performs = BpManufacturingProcess.find_by_name('Injection moulding of preforms')
    bp_manufacturing_process_strech_performs = BpManufacturingProcess.find_by_name('Strech blown of preforms')
    bp_manufacturing_process_injection_stretch = BpManufacturingProcess.find_by_name('Injection stretch blow moulding')


    bp_variables = BpManufacturingProcessVariableValue.find_all_by_bp_manufacturing_process_id_and_bp_manufacturing_process_variable_id(bp_manufacturing_process_injection_moulding_performs.id, bp_manufacturing_process_variable_electricity_use.id)
    bp_variables.each do |bp_variable|
      bp_variable.value = 0.525
      bp_variable.save
    end

    bp_variables = BpManufacturingProcessVariableValue.find_all_by_bp_manufacturing_process_id_and_bp_manufacturing_process_variable_id(bp_manufacturing_process_injection_moulding_performs.id, bp_manufacturing_process_variable_water_cooling.id)
    bp_variables.each do |bp_variable|
      bp_variable.value = 0.00002163
      bp_variable.save
    end

    bp_variables = BpManufacturingProcessVariableValue.find_all_by_bp_manufacturing_process_id_and_bp_manufacturing_process_variable_id(bp_manufacturing_process_injection_moulding_performs.id, bp_manufacturing_process_variable_lubricating_oil.id)
    bp_variables.each do |bp_variable|
      bp_variable.value = 0.000777
      bp_variable.save
    end

    bp_variables = BpManufacturingProcessVariableValue.find_all_by_bp_manufacturing_process_id_and_bp_manufacturing_process_variable_id(bp_manufacturing_process_injection_moulding_performs.id, bp_manufacturing_process_variable_production_scrap.id)
    bp_variables.each do |bp_variable|
      bp_variable.value = 0.77
      bp_variable.save
    end




    bp_variables = BpManufacturingProcessVariableValue.find_all_by_bp_manufacturing_process_id_and_bp_manufacturing_process_variable_id(bp_manufacturing_process_strech_performs.id, bp_manufacturing_process_variable_electricity_use.id)
    bp_variables.each do |bp_variable|
      bp_variable.value = 0.975
      bp_variable.save
    end

    bp_variables = BpManufacturingProcessVariableValue.find_all_by_bp_manufacturing_process_id_and_bp_manufacturing_process_variable_id(bp_manufacturing_process_strech_performs.id, bp_manufacturing_process_variable_water_cooling.id)
    bp_variables.each do |bp_variable|
      bp_variable.value = 0.0000402
      bp_variable.save
    end

    bp_variables = BpManufacturingProcessVariableValue.find_all_by_bp_manufacturing_process_id_and_bp_manufacturing_process_variable_id(bp_manufacturing_process_strech_performs.id, bp_manufacturing_process_variable_lubricating_oil.id)
    bp_variables.each do |bp_variable|
      bp_variable.value = 0.00144
      bp_variable.save
    end

    bp_variables = BpManufacturingProcessVariableValue.find_all_by_bp_manufacturing_process_id_and_bp_manufacturing_process_variable_id(bp_manufacturing_process_strech_performs.id, bp_manufacturing_process_variable_production_scrap.id)
    bp_variables.each do |bp_variable|
      bp_variable.value = 1.43
      bp_variable.save
    end



    bp_variables = BpManufacturingProcessVariableValue.find_all_by_bp_manufacturing_process_id_and_bp_manufacturing_process_variable_id(bp_manufacturing_process_injection_stretch.id, bp_manufacturing_process_variable_water_cooling.id)
    bp_variables.each do |bp_variable|
      bp_variable.value = 0.0000618
      bp_variable.save
    end
    bp_variables = BpManufacturingProcessVariableValue.find_all_by_bp_manufacturing_process_id_and_bp_manufacturing_process_variable_id(bp_manufacturing_process_injection_stretch.id, bp_manufacturing_process_variable_production_scrap.id)
    bp_variables.each do |bp_variable|
      bp_variable.value = 2.2
      bp_variable.save
    end




  end

  def self.down
  end
end
