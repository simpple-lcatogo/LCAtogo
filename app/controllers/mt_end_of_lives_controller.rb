class MtEndOfLivesController < ApplicationController
  # GET /mt_end_of_lives
  # GET /mt_end_of_lives.xml
  def index
    @mt_end_of_lives = MtEndOfLife.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mt_end_of_lives }
    end
  end

  # GET /mt_end_of_lives/1
  # GET /mt_end_of_lives/1.xml
  def show
    @mt_product = MtProduct.find(params[:id])
    @product = @mt_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @mt_product.product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, mt_production_init_path(@mt_product)
    add_breadcrumb _("Data entry").html_safe, mt_end_of_life_url(@mt_product)

    if @mt_product
      @step = 5
      if !@mt_product.mt_end_of_life
        mt_end_of_life = MtEndOfLife.new
        mt_end_of_life.mt_product_id = @mt_product.id
        mt_end_of_life.save
        @mt_product.mt_end_of_life = mt_end_of_life
      end

      #@se_use_consumption = @se_product.se_use_consumption
      @mt_end_of_life = @mt_product.mt_end_of_life
      @mt_families = MtFamily.all
    #  @mt_end_of_life_datas = @mt_product.mt_end_of_life_datas      
      
      @mt_material_datas = @mt_product.mt_material_datas   
      @mt_predefined_supplier_datas = @mt_product.mt_predefined_supplier_datas  
      @mt_user_supplier_datas = @mt_product.mt_user_supplier_datas  
      
      @detailed = false
      if @mt_product.mt_assessment && @mt_product.mt_assessment.assessment_type == 'detailed'
        @detailed = true
      end       
      
      respond_to do |format|
        format.html # show.html.erb
      end
    end                   
  end

  # GET /mt_end_of_lives/new
  # GET /mt_end_of_lives/new.xml
  def new
    @mt_end_of_life = MtEndOfLife.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mt_end_of_life }
    end
  end

  # GET /mt_end_of_lives/1/edit
  def edit
    @mt_end_of_life = MtEndOfLife.find(params[:id])
  end

  # POST /mt_end_of_lives
  # POST /mt_end_of_lives.xml
  def create
    @mt_end_of_life = MtEndOfLife.new(params[:mt_end_of_life])

    respond_to do |format|
      if @mt_end_of_life.save
        format.html { redirect_to(@mt_end_of_life) }
        format.xml  { render :xml => @mt_end_of_life, :status => :created, :location => @mt_end_of_life }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mt_end_of_life.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mt_end_of_lives/1
  # PUT /mt_end_of_lives/1.xml
  def update
    @mt_end_of_life = MtEndOfLife.find(params[:id])
    @mt_product = @mt_end_of_life.mt_product
    return_url = ''
    if params[:arrow]
       if params[:arrow] == 'next'
          return_url = mt_result_path(@mt_end_of_life.mt_product)     
       end
       if params[:arrow] == 'previous'
          return_url = mt_use_path(@mt_end_of_life.mt_product)
       end      
    end
    @detailed = false
    if @mt_product.mt_assessment && @mt_product.mt_assessment.assessment_type == 'detailed'
       @detailed = true
    end       
    
    if @detailed
       @mt_product.mt_material_datas.each do |mt_material_data|
         params.each do |key, value|
            if key == 'mt_material_data_' + mt_material_data.id.to_s + '_scenario'
               mt_material_data.scenario = value
               mt_material_data.save
            end
         end     
       end   
       @mt_product.mt_predefined_supplier_datas.each do |mt_predefined_supplier_data|
         params.each do |key, value|
            if key == 'mt_predefined_supplier_data_' + mt_predefined_supplier_data.id.to_s + '_scenario'
               mt_predefined_supplier_data.scenario = value
               mt_predefined_supplier_data.save
            end
         end     
       end   
       @mt_product.mt_user_supplier_datas.each do |mt_user_supplier_data|
         params.each do |key, value|
            if key == 'mt_user_supplier_data_' + mt_user_supplier_data.id.to_s + '_scenario'
               mt_user_supplier_data.scenario = value
               mt_user_supplier_data.save
            end
         end     
       end   
    
    end   
    
    respond_to do |format|
      if @mt_end_of_life.update_attributes(params[:mt_end_of_life])
        format.html { redirect_to(return_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mt_end_of_life.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mt_end_of_lives/1
  # DELETE /mt_end_of_lives/1.xml
  def destroy
    @mt_end_of_life = MtEndOfLife.find(params[:id])
    @mt_end_of_life.destroy

    respond_to do |format|
      format.html { redirect_to(mt_end_of_lives_url) }
      format.xml  { head :ok }
    end
  end
end
