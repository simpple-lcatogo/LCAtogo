class SeProductionController < ApplicationController
  before_filter :require_user

  def init
    puts params.inspect
    @se_product = SeProduct.find(params[:se_production_id])
    @product = @se_product.product
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @se_product.product.name, edit_product_url(@se_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, se_production_init_path(@se_product)
  end

 
  def intro
    @step = 0
    @se_product = SeProduct.find(params[:se_production_id])
    @product = @se_product.product    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @se_product.product.name, edit_product_url(@se_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, se_production_init_path(@se_product)
    add_breadcrumb _("Introduction").html_safe, se_production_intro_path(@se_product)
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
     @se_product = PhProduct.find(params[:se_product_id].to_i)

     respond_to do |format|
        format.html { redirect_to se_manufacturing_path(@se_product)}
     end   
  end      
  
end  