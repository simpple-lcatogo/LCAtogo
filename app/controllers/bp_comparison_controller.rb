class BpComparisonController < ApplicationController
  before_filter :require_user
 
  def show
    @bp_product = BpProduct.find(params[:id])
    @product = @bp_product.product
    if @bp_product      
      @step = 3

      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @bp_product.product.name, edit_product_url(@bp_product.product)
      add_breadcrumb _("Environmental Assessment").html_safe, bp_production_init_path(@bp_product)
      add_breadcrumb _("Comparison").html_safe, bp_comparison_url(@product.bp_product)
  
      @products_to_compare = Product.find(:all, :conditions => ["id != ? and user_id = ? and sector='bio_based'", @product.id, current_user.id])
      @indicators = Indicator.find(:all, :conditions => ["sector='bio-plastic'"])

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

  def destroy    
  end

  def next_step
     @product = Product.find(params[:product_id].to_i)
     respond_to do |format|
        format.html { redirect_to graphic_url(@product)}
     end   
  end      


end  