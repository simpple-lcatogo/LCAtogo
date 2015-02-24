class UseController < ApplicationController
  before_filter :require_user
 
  def show
    #@product = Product.find(params[:id])
    @product = get_product(params[:id])
    if @product      
      @step = 4
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @product.name, product_url(@product)
      add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
      add_breadcrumb _("Data entry").html_safe, use_url(@product)
  
   
      @consumable_uses = @product.consumable_uses 
      @families_consumption = Family.find(:all, :conditions => ["stage = 'Consumption'"])
      @families_repair = Family.find(:all, :conditions => ["stage = 'Manufacturing' and name != 'Housing & internal structural elements'"])
      @materials = Material.all.sort_by{ |k| k['name'] }
      @materials_consumption = Array.new
      
      @consumption_uses = @product.consumption_uses 
      @energy_modes = EnergyMode.all.sort_by{ |k| k['name'] } 
      @energy_types = EnergyType.all.sort_by{ |k| k['name'] }      
      @repair_uses = @product.repair_uses 
      @manufacturing_datas = @product.manufacturing_datas
      @transport_repair_datas = @product.transport_repair_datas
      
      if !@product.use 
        @product.use = Use.new
        @product.use.save
        @product.save
      end

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
     @product.use.lifetime = params[:lifetimeHidden].to_f
     @product.use.working = params[:workingHidden].to_f
     @product.use.save
     
     respond_to do |format|
        format.html { redirect_to end_of_life_url(@product)}
     end   
  end      

end  