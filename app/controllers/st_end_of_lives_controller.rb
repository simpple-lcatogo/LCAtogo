class StEndOfLivesController < ApplicationController
  # GET /st_end_of_lives
  # GET /st_end_of_lives.xml
  def index
    @st_end_of_lives = StEndOfLife.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @st_end_of_lives }
    end
  end

   def get_eco_cost(name, category)   
      eco_cost = StExcelValue.find_by_local_name_and_category(name, category)
      if !eco_cost
         eco_cost = StExcelValue.find_by_local_name_and_category(name + ",", category)
      end
      if eco_cost
        return eco_cost.value
      end
      return 0       
   end  


  # GET /st_end_of_lives/1
  # GET /st_end_of_lives/1.xml
  def show
    @st_product = StProduct.find(params[:id])
    @product = @st_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @st_product.product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, st_production_init_path(@st_product)
    add_breadcrumb _("Data entry").html_safe, st_end_of_life_url(@st_product)

    if @st_product
      @step = 5
      if !@st_product.st_end_of_life
        st_end_of_life = StEndOfLife.new
        st_end_of_life.st_product_id = @st_product.id
        st_end_of_life.save
        @st_product.st_end_of_life = st_end_of_life
      end

      #@se_use_consumption = @se_product.se_use_consumption
      @st_end_of_life = @st_product.st_end_of_life
      @st_end_of_lives = Array.new
      
      @st_product.st_material_datas.each do |st_material_data|
        st_end_of_life_data = StEndOfLifeData.find_by_st_material_data_id(st_material_data.id)
        if !st_end_of_life_data
          if st_material_data.st_material
            st_end_of_life_data = StEndOfLifeData.new(:st_product_id => @st_product.id, :st_material_data_id => st_material_data.id, :quantity_recycling => st_material_data.quantity, :quantity_incineration => st_material_data.quantity)
            st_end_of_life_data.eco_cost_recycling = get_eco_cost(st_material_data.st_material.name, "Recycling")
            st_end_of_life_data.eco_cost_incineration = get_eco_cost(st_material_data.st_material.name, "Incineration")     
            st_end_of_life_data.save
          end
        end
        if st_end_of_life_data
           @st_end_of_lives << st_end_of_life_data
        end
      end

      @st_product.st_packaging_datas.each do |st_packaging_data|
        st_end_of_life_data = StEndOfLifeData.find_by_st_packaging_data_id(st_packaging_data.id)        
        if !st_end_of_life_data
          if st_packaging_data.st_packaging_type
            st_end_of_life_data = StEndOfLifeData.new(:st_product_id => @st_product.id, :st_packaging_data_id => st_packaging_data.id, :quantity_recycling => st_packaging_data.quantity, :quantity_incineration => st_packaging_data.quantity)
            st_end_of_life_data.eco_cost_recycling = get_eco_cost(st_packaging_data.st_packaging_type.name, "Recycling")
            st_end_of_life_data.eco_cost_incineration = get_eco_cost(st_packaging_data.st_packaging_type.name, "Incineration")     
            st_end_of_life_data.save
          end
        end  
        @st_end_of_lives << st_end_of_life_data
      end
      
      @st_product.st_consumable_datas.each do |st_consumable_data|
        st_end_of_life_data = StEndOfLifeData.find_by_st_consumable_data_id(st_consumable_data.id)
        if !st_end_of_life_data    
          if st_consumable_data.st_material
            st_end_of_life_data = StEndOfLifeData.new(:st_product_id => @st_product.id, :st_consumable_data_id => st_consumable_data.id, :quantity_recycling => st_consumable_data.quantity, :quantity_incineration => st_consumable_data.quantity)
            st_end_of_life_data.eco_cost_recycling = get_eco_cost(st_consumable_data.st_material.name, "Recycling")
            st_end_of_life_data.eco_cost_incineration = get_eco_cost(st_consumable_data.st_material.name, "Incineration")     
            st_end_of_life_data.save
          end
        end  
        @st_end_of_lives << st_end_of_life_data
      end

      excel_209 = 0.0025612273
      excel_210 = 0.40196901
      excel_211 = 0.038422594     
      excel_212 = 0.8804381
      excel_213 = 0.3    
      excel_214 = 0.1288
      excel_215 = 0.30758305      
      
      
      @recycling_processes = 0
      if @st_product.st_material_detail.product_weight
        @recycling_processes += excel_209 * @st_product.st_material_detail.product_weight
        if @st_product.st_material_detail.textile_weight
           @recycling_processes += excel_211 * @st_product.st_material_detail.product_weight * (@st_product.st_material_detail.textile_weight / 100)
        end
        if @st_product.st_material_detail.electronic_weight
           @recycling_processes += excel_210 * @st_product.st_material_detail.product_weight * (@st_product.st_material_detail.electronic_weight / 100)
        end   
      end
      
      @incineration_processes = 0
      if @st_product.st_material_detail.product_weight
        @incineration_processes += excel_209 * @st_product.st_material_detail.product_weight
        if @st_product.st_material_detail.textile_weight        
           @incineration_processes += excel_213 * @st_product.st_material_detail.product_weight * (@st_product.st_material_detail.textile_weight / 100)
        end
        if @st_product.st_material_detail.electronic_weight           
           @incineration_processes += excel_212 * @st_product.st_material_detail.product_weight * (@st_product.st_material_detail.electronic_weight / 100)
        end   
      end
             
      @landfill_ewaste = 0       
      @landfill_other = 0
      if @st_product.st_material_detail.product_weight && @st_product.st_material_detail.electronic_weight
         @landfill_ewaste = excel_215 * @st_product.st_material_detail.product_weight * (@st_product.st_material_detail.electronic_weight / 100)  
         @landfill_other = excel_214 * @st_product.st_material_detail.product_weight * ((100 - @st_product.st_material_detail.electronic_weight) / 100)
      end   
      
      respond_to do |format|
        format.html # show.html.erb
        #format.xml  { render :xml => @se_use_consumption }
      end
    end

  end

  # GET /st_end_of_lives/new
  # GET /st_end_of_lives/new.xml
  def new
    @st_end_of_life = StEndOfLife.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @st_end_of_life }
    end
  end

  # GET /st_end_of_lives/1/edit
  def edit
    @st_end_of_life = StEndOfLife.find(params[:id])
  end

  # POST /st_end_of_lives
  # POST /st_end_of_lives.xml
  def create
    @st_end_of_life = StEndOfLife.new(params[:st_end_of_life])

    respond_to do |format|
      if @st_end_of_life.save
        format.html { redirect_to(@st_end_of_life) }
        format.xml  { render :xml => @st_end_of_life, :status => :created, :location => @st_end_of_life }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @st_end_of_life.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /st_end_of_lives/1
  # PUT /st_end_of_lives/1.xml
  def update
    @st_end_of_life = StEndOfLife.find(params[:id])
    return_url = ''
    if params[:arrow]
       if params[:arrow] == 'next'
          return_url = st_result_path(@st_end_of_life.st_product)     
       end
       if params[:arrow] == 'previous'
          return_url = st_use_path(@st_end_of_life.st_product)
       end      
    end

    respond_to do |format|
      if @st_end_of_life.update_attributes(params[:st_end_of_life])
        format.html { redirect_to(return_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @st_end_of_life.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /st_end_of_lives/1
  # DELETE /st_end_of_lives/1.xml
  def destroy
    @st_end_of_life = StEndOfLife.find(params[:id])
    @st_end_of_life.destroy

    respond_to do |format|
      format.html { redirect_to(st_end_of_lives_url) }
      format.xml  { head :ok }
    end
  end
  
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end     
  
  def update_quantity_incineration
      value = params[:update_value]
      if is_a_number?value
         st_end_of_life_data_id = params[:st_end_of_life_data_id]
         @st_end_of_life_data = StEndOfLifeData.find(st_end_of_life_data_id)
         @st_end_of_life_data.quantity_incineration = value
         @st_end_of_life_data.save
         @new_eco_cost = 0 
         if @st_end_of_life_data.eco_cost_incineration
            @new_eco_cost = value.to_f * @st_end_of_life_data.eco_cost_incineration
         end
         @update_value = value
         respond_to do |format|   
           format.js  { render :action => "update_quantity_incineration" }
           format.xml  { head :ok }
         end
      else
         respond_to do |format|
           format.html {render :inline => params[:original_value]}          
           format.xml  { head :ok }
         end      
      end
  end       

  def update_quantity_recycling
      value = params[:update_value]
      if is_a_number?value
         st_end_of_life_data_id = params[:st_end_of_life_data_id]
         @st_end_of_life_data = StEndOfLifeData.find(st_end_of_life_data_id)
         @st_end_of_life_data.quantity_recycling = value
         @st_end_of_life_data.save
         @new_eco_cost = 0 
         if @st_end_of_life_data.eco_cost_recycling
            @new_eco_cost = value.to_f * @st_end_of_life_data.eco_cost_recycling
         end
         @update_value = value
         
         respond_to do |format| 
           format.js  { render :action => "update_quantity_recycling" }
           #format.html {render :inline => value}
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
