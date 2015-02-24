class SummaryController < ApplicationController
  before_filter :require_user
 
  def show
    #@product = Product.find(params[:id])
    @product = get_product(params[:id])
    if @product      
      @step = 4
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @product.name, product_url(@product)
      add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
      add_breadcrumb _("Summary").html_safe, summary_url(@product)
  
 
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