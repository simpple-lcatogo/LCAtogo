class BpManufacturingProcessUserVariableController < ApplicationController
  include ApplicationHelper  
  def update_values
    @bp_manufacturing_process_variable = BpManufacturingProcessVariable.find(params[:bp_manufacturing_process_variable_id])
    @bp_manufacturing_data = BpManufacturingData.find(params[:bp_manufacturing_data_id])
    @bp_manufacturing_process_variable_drying = BpManufacturingProcessVariable.find_by_name("Electricity consumption")

  	user_var = BpManufacturingProcessUserVariable.find_or_initialize_by_bp_manufacturing_data_id_and_bp_manufacturing_process_variable_id(params[:bp_manufacturing_data_id],params[:bp_manufacturing_process_variable_id])

	  user_var.value = params[:update_value].gsub(",", ".")

  	if user_var.save
      @update_value = params[:update_value].gsub(",", ".")
      if @bp_manufacturing_process_variable.name == 'Drying temp' ||
         @bp_manufacturing_process_variable.name == 'Drying time'
         @pellets_value = calculate_default_pellets @bp_manufacturing_data
      end
      
  		respond_to do |format|
        if @pellets_value.blank?
           format.html {render :inline => params[:update_value].gsub(",", ".") }
        else
           format.js  { render :action => "update_drying" }
        end
		  end
	  else
      respond_to do |format|
        format.html {render :inline => params[:original_value]}
        format.xml  { head :ok }
      end
	  end
   end


end
