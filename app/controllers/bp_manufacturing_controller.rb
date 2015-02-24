class BpManufacturingController < ApplicationController
	def show
  	@bp_product = get_bp_product(params[:id])#

    if @bp_product      
      @step = 3
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @bp_product.product.name, edit_product_url(@bp_product.product)
      add_breadcrumb _("Environmental Assessment").html_safe, bp_production_init_path(@bp_product)
      add_breadcrumb _("Data entry").html_safe, bp_production_url(@bp_product)
  
      @bp_material_datas = @bp_product.bp_material_datas
      @bp_manufacturing_datas = @bp_product.bp_manufacturing_datas
      @bp_finishing_datas = @bp_product.bp_finishing_datas      

      @bp_manufacturing_process_variable_values = BpManufacturingProcessVariableValue.all
     
      @bp_manufacturing_process_user_variables = Array.new
      @bp_finishing_process_user_variables = Array.new

      @bp_manufacturing_datas.each do |i|
        i.bp_manufacturing_process_user_variables.each do |j|
          @bp_manufacturing_process_user_variables << j
        end  
      end 

      @bp_finishing_datas.each do |i|
        i.bp_finishing_process_user_variables.each do |j|
          @bp_finishing_process_user_variables << j
        end  
      end 


      @bp_units = BpUnit.all.sort_by{ |k| k['name'] }

      @bp_manufacturing_processes = BpManufacturingProcess.where("process_type = 'processing'").sort_by{ |k| k['name'] }
      @bp_finishing_processes = BpManufacturingProcess.where("process_type = 'finishing'").sort_by{ |k| k['name'] }

      @bp_modes = BpMode.all.sort_by{ |k| k['name'] }
      @bp_vehicles = BpVehicle.all.sort_by{ |k| k['name'] }
      @bp_manufacturing_transport_datas = @bp_product.bp_manufacturing_transport_datas
      @bp_country_infos = BpCountryInfo.all.sort_by{ |k| k['name'] }

      respond_to do |format|
        format.html # index.html.erb
      end
    else
     respond_to do |format|
        format.html { redirect_to(products_url) }
        format.xml { head :ok }
     end      
   end
  end	

  def next_step
     @bp_product = BpProduct.find(params[:bp_product_id].to_i)

     if @bp_product.product.step < 4     
       @bp_product.product.step = 3
       @bp_product.product.save
     end      
    
     respond_to do |format|
        format.html { redirect_to bp_transport_to_customer_url(@bp_product)}
     end   
 end
 
  def previous_step
     @bp_product = BpProduct.find(params[:bp_product_id].to_i)
     respond_to do |format|
        format.html { redirect_to bp_transport_to_converter_url(@bp_product)}
     end   
  end 
 
 
end
