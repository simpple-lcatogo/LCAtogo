class ManufacturingController < ApplicationController
  include ScenariosHelper  
  
  before_filter :require_user


  def init
    @product = get_product(params[:production_id])
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @product.name, product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
  end

 
  def intro
    @step = 0
    @product = get_product(params[:production_id])
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @product.name, product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
    add_breadcrumb _("Introduction").html_safe, production_intro_path(@product)
  end
 
  def show
    @product = get_product(params[:id])
    if @product      
      @step = 2
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @product.name, product_url(@product)
      add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
      add_breadcrumb _("Data entry").html_safe, manufacturing_url(@product)
  
   
      @manufacturing_datas = @product.manufacturing_datas
      @families = Family.find_all_by_stage("Manufacturing").sort_by{ |k| k['name'] } 
      @materials = Material.all.sort_by{ |k| k['name'] } 
      @data_modules = DataModule.all.sort_by{ |k| k['name'] }
      
      @process_datas = @product.process_datas
      @data_processes = DataProcess.all.sort_by{ |k| k['name'] }

      @average_technical_lifetime = calculate_average_technical_lifetime(@product)
      @average_technical_lifetime =  @average_technical_lifetime.round(2)

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
     @product.overhead_miscellaneous = params[:overhead_miscellaneous].to_f
     @product.save

     if @product.step < 3     
       @product.step = 3
       @product.save
     end      
    
     respond_to do |format|
        format.html { redirect_to distribution_url(@product)}
     end   
  end      

  def next_intro_step
     @product = Product.find(params[:product_id].to_i)
     if @product.step < 3     
       @product.step = 3
       @product.save
     end      
    
     respond_to do |format|
        format.html { redirect_to production_url(@product)}
     end   
  end      
  
end  