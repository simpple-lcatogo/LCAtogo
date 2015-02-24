class PhComparisonController < ApplicationController
  before_filter :require_user
 
  def show
    #@product = Product.find(params[:id])
   # @product = get_product(params[:id])
    @ph_product = PhProduct.find(params[:id])
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @ph_product.product.name, edit_product_url(@ph_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, ph_production_init_path(@ph_product)
    add_breadcrumb _("Results").html_safe, ph_comparison_url(@ph_product)
    
    @product = @ph_product.product
    if @ph_product      
      @step = 5

      @products_to_compare = Product.find(:all, :conditions => ["id != ? and user_id = ? and sector='renewable'", @product.id, current_user.id])
      @indicators = Indicator.all
  
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