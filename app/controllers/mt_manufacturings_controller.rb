class MtManufacturingsController < ApplicationController
  # GET /mt_manufacturings
  # GET /mt_manufacturings.xml
  def index
    @mt_manufacturings = MtManufacturing.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mt_manufacturings }
    end
  end

  # GET /mt_manufacturings/1
  # GET /mt_manufacturings/1.xml
  def show
    @mt_product = MtProduct.find(params[:id])
    @product = @mt_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @mt_product.product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, mt_production_init_path(@mt_product)
    add_breadcrumb _("Data entry").html_safe, mt_manufacturing_url(@mt_product)

    if @mt_product
      @step = 2
      if !@mt_product.mt_manufacturing
        mt_manufacturing = MtManufacturing.new
        mt_manufacturing.mt_product_id = @mt_product.id
        mt_manufacturing.save
        @mt_product.mt_manufacturing = mt_manufacturing
      end

      @mt_manufacturing = @mt_product.mt_manufacturing
      @mt_energy_families = MtEnergyFamily.all
      @mt_families = MtFamily.all

      @mt_consumables = MtConsumable.all      
      @mt_manufacturing_processes = MtManufacturingProcess.all
      @mt_energy_datas = @mt_product.mt_energy_datas
      @mt_overhead_energy_datas = @mt_product.mt_overhead_energy_datas      
      @mt_waste_energy_datas = @mt_product.mt_waste_energy_datas    
      @mt_manufacturing_resource_datas = @mt_product.mt_manufacturing_resource_datas
      @mt_manufacturing_main_datas = @mt_product.mt_manufacturing_main_datas
      @product_weight = 0
      if @mt_product.mt_assessment
         @product_weight = @mt_product.mt_assessment.weight
      end      

      @detailed = false
      if @mt_product.mt_assessment && @mt_product.mt_assessment.assessment_type == 'detailed'
        @detailed = true
      end
      
      if @detailed
         @mt_families = Array.new
         MtFamily.all.each do |mt_family|
          if mt_family.name != 'Electronics' && mt_family.name != 'Other' && mt_family.name != 'Supplier parts'
             @mt_families << mt_family    
          end
        end             
      end
      
      respond_to do |format|
        format.html # show.html.erb
      end
    end
  end

  # GET /mt_manufacturings/new
  # GET /mt_manufacturings/new.xml
  def new
    @mt_manufacturing = MtManufacturing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mt_manufacturing }
    end
  end

  # GET /mt_manufacturings/1/edit
  def edit
    @mt_manufacturing = MtManufacturing.find(params[:id])
  end

  # POST /mt_manufacturings
  # POST /mt_manufacturings.xml
  def create
    @mt_manufacturing = MtManufacturing.new(params[:mt_manufacturing])

    respond_to do |format|
      if @mt_manufacturing.save
        format.html { redirect_to(@mt_manufacturing, :notice => 'Mt manufacturing was successfully created.') }
        format.xml  { render :xml => @mt_manufacturing, :status => :created, :location => @mt_manufacturing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mt_manufacturing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mt_manufacturings/1
  # PUT /mt_manufacturings/1.xml
  def update
    @mt_manufacturing = MtManufacturing.find(params[:id])
    return_url = ''
    if params[:arrow]
       if params[:arrow] == 'next'
          return_url = mt_distribution_path(@mt_manufacturing.mt_product)     
       end
       if params[:arrow] == 'previous'
          return_url = mt_raw_material_path(@mt_manufacturing.mt_product)
       end      
    end

    respond_to do |format|
      if @mt_manufacturing.update_attributes(params[:mt_manufacturing])
        format.html { redirect_to(return_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mt_manufacturing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mt_manufacturings/1
  # DELETE /mt_manufacturings/1.xml
  def destroy
    @mt_manufacturing = MtManufacturing.find(params[:id])
    @mt_manufacturing.destroy

    respond_to do |format|
      format.html { redirect_to(mt_manufacturings_url) }
      format.xml  { head :ok }
    end
  end
  
  
 def next_step
    @mt_product = MtProduct.find(params[:mt_product_id].to_i)
    return_url = ''
    if params[:arrow]
       if params[:arrow] == 'next'
          return_url = mt_distribution_path(@mt_product)     
       end
       if params[:arrow] == 'previous'
          return_url = mt_raw_material_path(@mt_product)
       end      
    end

    respond_to do |format|
        format.html { redirect_to(return_url) }
        format.xml  { head :ok }
    end

  end  
  
end
