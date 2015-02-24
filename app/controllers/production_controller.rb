class ProductionController < ApplicationController
  before_filter :require_user

  def init
    @product = get_product(params[:production_id])
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
  end

 
  def intro
    @step = 0
    @product = get_product(params[:production_id])
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
    add_breadcrumb _("Introduction").html_safe, production_intro_path(@product)
  end
 
  def show
    #@product = Product.find(params[:id])
    @product = get_product(params[:id])
    if @product      
      @step = 1
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @product.name, edit_product_url(@product)
      add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
      add_breadcrumb _("Data entry").html_safe, production_url(@product)
  
      if @product.scenario
        @scenario = @product.scenario
      else
        @scenario = Scenario.new
        @scenario.product = @product
        @scenario.annual_failure = 10
        @scenario.save
      end
  
   
      @material_datas = @product.material_datas
      @component_datas = @product.component_datas      
      @families = Family.find(:all).sort_by{ |k| k['name'] } 
      @materials = Material.all.sort_by{ |k| k['name'] } 
      @data_modules = DataModule.all.sort_by{ |k| k['name'] }
      
      @process_datas = @product.process_datas
      @data_processes = DataProcess.all.sort_by{ |k| k['name'] }

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
        format.html { redirect_to scenario_url(@product)}
     end   
  end

  def next_intro_step
     @product = Product.find(params[:product_id].to_i)
     respond_to do |format|
        format.html { redirect_to scenario_url(@product)}
     end   
  end      
  
end  