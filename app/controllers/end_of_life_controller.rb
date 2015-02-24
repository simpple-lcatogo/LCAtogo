class EndOfLifeController < ApplicationController
  include ScenariosHelper  
  
  before_filter :require_user
 
  def show
    #@product = Product.find(params[:id])
    @product = get_product(params[:id])
    if @product      
      @step = 5
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @product.name, product_url(@product)
      add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
      add_breadcrumb _("Data entry").html_safe, end_of_life_url(@product)
   
      @reuse_end_of_lives = @product.reuse_end_of_lives 
      @families = Family.find(:all, :conditions => ["stage = 'Manufacturing'"])      
      @materials = Material.all.sort_by{ |k| k['name'] }
      
      @recycling_end_of_lives = @product.recycling_end_of_lives  
      
      
      @manufacturing_datas = @product.manufacturing_datas
      @recycling_datas = RecyclingData.find_all_by_product_id(@product.id)
      @reuse_datas = ReuseData.find_all_by_product_id(@product.id)      
      
      @average_technical_lifetime = calculate_average_technical_lifetime(@product).to_f
      
      if !@product.end_of_life 
        @product.end_of_life = EndOfLife.new
        @product.end_of_life.save
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
     if @product.step < 4     
       @product.step = 4
       @product.save
     end
     @product.end_of_life.landfill = params[:landfill].to_f
     @product.end_of_life.save     
    
     respond_to do |format|
        format.html { redirect_to indicator_url(@product)}
     end   
  end      

  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end  
  
  def update_collection_rate
      value = params[:update_value]
      if is_a_number?value
         product_id = params[:product_id]
         product = Product.find(product_id)
         @end_of_life = product.end_of_life
         @end_of_life.collection_rate = value
         @end_of_life.save
         respond_to do |format|
           format.html {render :inline => value}
           format.xml  { head :ok }
         end
      else
         respond_to do |format|
           format.html {render :inline => params[:original_value]}
           format.xml  { head :ok }
         end      
      end            
  end

end  