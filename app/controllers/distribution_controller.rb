class DistributionController < ApplicationController
  #before_filter :require_user
 
  def show
    #@product = Product.find(params[:id])
    @product = get_product(params[:id])
    if @product      
      @step = 3
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @product.name, product_url(@product)
      add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
      add_breadcrumb _("Data entry").html_safe, distribution_url(@product)
  
   
      @packaging_distributions = @product.packaging_distributions 
      @packagings = Packaging.all
      @materials = Array.new
      
      @transport_distributions = @product.transport_distributions
      @vehicles = Array.new
      @data_modes = DataMode.all.sort_by{ |k| k['name'] }

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

     if @product.step < 3     
       @product.step = 3
       @product.save
     end      
    
     respond_to do |format|
        format.html { redirect_to use_url(@product)}
     end   
  end      

end  