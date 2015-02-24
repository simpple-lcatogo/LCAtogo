class BpDistributionUserValueController < ApplicationController
  
  def update_values
  	update_value = params[:update_value].gsub(",", ".")
     
  	bp_distribution_user_value = BpDistributionUserValue.find_or_initialize_by_bp_product_id_and_bp_distribution_default_value_id(params[:bp_product_id], params[:bp_distribution_default_value_id])
    
  	bp_distribution_user_value.bp_distribution_default_value =  BpDistributionDefaultValue.find(params[:bp_distribution_default_value_id])
  	bp_distribution_user_value.value = update_value


     if bp_distribution_user_value.save
        respond_to do |format|
          format.html {render :inline => update_value }
          format.xml  { head :ok }
        end 
     else
        respond_to do |format|
          format.html {render :inline => params[:original_value]}
          format.xml  { head :ok }
        end  
     end 

  end

end
