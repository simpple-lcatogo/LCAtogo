class PhProductionController < ApplicationController
  before_filter :require_user

  def init
    puts params.inspect
    @ph_product = PhProduct.find(params[:ph_production_id])
    @product = @ph_product.product
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @ph_product.product.name, edit_product_url(@ph_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, ph_production_init_path(@ph_product)
  end

 
  def intro
    @step = 0
    @ph_product = PhProduct.find(params[:ph_production_id])
    @product = @ph_product.product    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @ph_product.product.name, edit_product_url(@ph_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, ph_production_init_path(@ph_product)
    add_breadcrumb _("Introduction").html_safe, ph_production_intro_path(@ph_product)
  end
 
  
  
  def destroy    
  end

  def next_step
     @bp_product = BpProduct.find(params[:bp_product_id].to_i)
     if @bp_product.product.step < 3
       @bp_product.product.step = 3
       @bp_product.product.save
     end      
    
     respond_to do |format|
        format.html { redirect_to bp_transport_to_converter_url(@bp_product)}
     end
  end

  def next_intro_step
     @ph_product = PhProduct.find(params[:ph_product_id].to_i)

     respond_to do |format|
        format.html { redirect_to ph_basic_information_path(@ph_product)}
     end   
  end      
  
end  