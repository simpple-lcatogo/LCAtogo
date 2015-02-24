class StComparisonController < ApplicationController
  before_filter :require_user
 
  def show
    @st_product = StProduct.find(params[:id])
    @product = @st_product.product
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @st_product.product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, st_production_init_path(@st_product)
    add_breadcrumb _("Results").html_safe, st_comparison_url(@st_product)
    
    if @st_product      
      @step = 3

      @products_to_compare = Product.find(:all, :conditions => ["id != ? and user_id = ? and sector='textiles'", @product.id, current_user.id])
       
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