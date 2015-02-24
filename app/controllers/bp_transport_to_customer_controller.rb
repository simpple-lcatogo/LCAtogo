class BpTransportToCustomerController < ApplicationController
  before_filter :require_user
  
  
  def show
  	@bp_product = get_bp_product(params[:id])#

    if @bp_product      
      @step = 4
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @bp_product.product.name, edit_product_url(@bp_product.product)
      add_breadcrumb _("Environmental Assessment").html_safe, bp_production_init_path(@bp_product)
      add_breadcrumb _("Data entry").html_safe, bp_production_url(@bp_product)
  
      @bp_transport_to_customer_datas = @bp_product.bp_transport_to_customer_datas
      @bp_packaging_datas = @bp_product.bp_packaging_datas
        
      @bp_modes = BpMode.all.sort_by{ |k| k['name'] }
      @bp_vehicles = BpVehicle.all.sort_by{ |k| k['name'] }
      @bp_distribution_default_values = BpDistributionDefaultValue.all
      @bp_distribution_user_values = BpDistributionUserValue.where("bp_product_id = ?", params[:id])

      @amount_of_product_package = BpDistributionDefaultValue.find_by_name("Amount of product packaged")
      @amount_of_product_package_user_value = BpDistributionUserValue.find_by_bp_distribution_default_value_id_and_bp_product_id(@amount_of_product_package.id, @bp_product.id)

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

     if @bp_product.product.step < 5     
       @bp_product.product.step = 4
       @bp_product.product.save
     end      
    
     respond_to do |format|
        format.html { redirect_to bp_end_of_life_url(@bp_product)}
     end   
 end

 
  def previous_step
     @bp_product = BpProduct.find(params[:bp_product_id].to_i)
     respond_to do |format|
        format.html { redirect_to bp_manufacturing_url(@bp_product)}
     end   
  end 
 
end
