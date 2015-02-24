class MtComparisonController < ApplicationController
  before_filter :require_user
 
  def show
    @mt_product = MtProduct.find(params[:id])
    @product = @mt_product.product
    if @mt_product      
      @step = 3

      @products_to_compare = Product.find(:all, :conditions => ["id != ? and user_id = ? and sector='machine'", @product.id, current_user.id])
       
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