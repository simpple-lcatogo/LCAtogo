class PcComparisonController < ApplicationController
  before_filter :require_user
 
  def show
    @pc_product = PcProduct.find(params[:id])
    @product = @pc_product.product
    if @pc_product      
      @step = 2
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @product.name, edit_product_url(@product)
      add_breadcrumb _("Environmental Assessment").html_safe, pc_basic_url(@pc_product)
      add_breadcrumb _("Comparison").html_safe, pc_comparison_path(@product.pc_product)

      @products_to_compare = Product.find(:all, :conditions => ["id != ? and user_id = ? and sector='printed'", @product.id, current_user.id])
      @indicators = Indicator.find(:all, :conditions => ["sector='printed'"])

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