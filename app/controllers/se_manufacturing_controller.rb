class SeManufacturingController < ApplicationController
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
    @se_product = SeProduct.find(params[:id])
    @product = @se_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @se_product.product.name, edit_product_url(@se_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, se_production_init_path(@se_product)
    add_breadcrumb _("Data entry").html_safe, se_manufacturing_url(@se_product)


    if @se_product
      @step = 1
      if !@se_product.se_manufacturing
        se_manufacturing = SeManufacturing.new 
        se_manufacturing.se_product_id = @se_product.id
        se_manufacturing.save
        @se_product.se_manufacturing = se_manufacturing        
      end
      @se_manufacturing = @se_product.se_manufacturing
      @se_manufacturing_datas = @se_product.se_manufacturing_datas

      
      @se_components = SeComponent.all.sort_by{ |k| k['name'] }

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
   @se_product = SeProduct.find(params[:se_product_id].to_i)
   respond_to do |format|
      format.html { redirect_to se_use_production_url(@se_product)}
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
  
  
  # PUT /se_manufacturing/1
  # PUT //se_manufacturing/1.xml
  def update
    @se_manufacturing = SeManufacturing.find(params[:id])

    respond_to do |format|
      if @se_manufacturing.update_attributes(params[:se_manufacturing])
        format.html { redirect_to(se_use_production_path(@se_manufacturing.se_product)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ph_intermediate_result.errors, :status => :unprocessable_entity }
      end
    end
  end  
  
end  