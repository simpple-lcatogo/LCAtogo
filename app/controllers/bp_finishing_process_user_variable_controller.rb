class BpFinishingProcessUserVariableController < ApplicationController
  def update_values
    @bp_manufacturing_process_variable = BpManufacturingProcessVariable.find(params[:bp_manufacturing_process_variable_id])
    @bp_finishing_data = BpFinishingData.find(params[:bp_finishing_data_id])
    @bp_manufacturing_process_variable_drying = BpManufacturingProcessVariable.find_by_name("Electricity consumption")
  	user_var = BpFinishingProcessUserVariable.find_or_initialize_by_bp_finishing_data_id_and_bp_manufacturing_process_variable_id(params[:bp_finishing_data_id],params[:bp_manufacturing_process_variable_id])

	  user_var.value = params[:update_value]

  	if user_var.save
      @update_value = params[:update_value]
      
  		respond_to do |format|
	   	  format.html {render :inline => params[:update_value] }
  		end
	else
		respond_to do |format|
		  format.html {render :inline => params[:original_value]}
		  format.xml  { head :ok }
		end  
	end 
  end

  def calculate_pellets (bp_manufacturing_data)
     var_a = bp_manufacturing_data.quantity
     var_b = 0
     var_c = 0
     var_value = 0

     bp_manufacturing_process_variable_values = BpManufacturingProcessVariableValue.all
     bp_manufacturing_process_user_variables = BpManufacturingProcessUserVariable.all
     bp_manufacturing_data.bp_manufacturing_process.bp_manufacturing_process_variables.each do |var|
        bp_manufacturing_process_variable_values.each do |var_val|
           if var_val.bp_material_id == bp_manufacturing_data.bp_material_id && var_val.bp_manufacturing_process_id == bp_manufacturing_data.bp_manufacturing_process_id && var_val.bp_manufacturing_process_variable_id == var.id
              var_value = var_val.value
           end
        end
        bp_manufacturing_process_user_variables.each do |user_var|
           if user_var.bp_manufacturing_data && user_var.bp_manufacturing_data.bp_material_id == bp_manufacturing_data.bp_material_id && user_var.bp_manufacturing_data.bp_manufacturing_process_id == bp_manufacturing_data.bp_manufacturing_process_id && user_var.bp_manufacturing_process_variable_id == var.id
                var_value =  user_var.value
           end
        end
                     
                     
                     
        variable_name = var.name
        logger.info 'variable_name --> ' + variable_name
        if variable_name.match(/^Drying temp/)
           var_b = var_value
        end
        if variable_name.match(/^Drying time/)
           var_c = var_value
        end
      end
      logger.info "var_b --> " + var_b.to_s
      logger.info "var_c --> " + var_c.to_s

      cp_material = 0
      cp_material_23 = 0
      if var_b != 0 and var_c != 0
         logger.info "Bp material --> " + bp_manufacturing_data.bp_material.name
         if bp_manufacturing_data.bp_material.name.include?('Polylactic')
             cp_material = 0.000537449 + (0.000358399 - 0.000537449) / (1 + Math.exp((var_b - 55.28684) / 3.72066))
             cp_material_23 = 0.000537449 + (0.000358399 - 0.000537449) / (1 + Math.exp((23 - 55.28684) / 3.72066))
         end
         if bp_manufacturing_data.bp_material.name == 'PET'
             cp_material = (1 / 3600) * (var_b + 237.15)
             cp_material_23 = (1 / 3600) * (23 + 237.15)
         end
         if bp_manufacturing_data.bp_material.name == 'PHB'
             cp_material = (1.5 / 3600) * (var_b + 237.15)
             cp_material_23 = (1.5 / 3600) * (23 + 237.15)
         end
         country_selected = "Europe"
         if bp_manufacturing_data.bp_country_info
            country_selected = bp_manufacturing_data.bp_country_info.name
         end
     end
     return (1.2 + ((((cp_material - cp_material_23)) * (var_a / var_c)) / (var_a / var_c)))
  end
  
end
