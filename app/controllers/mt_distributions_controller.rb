class MtDistributionsController < ApplicationController
  # GET /mt_distributions
  # GET /mt_distributions.xml
  def index
    @mt_distributions = MtDistribution.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mt_distributions }
    end
  end

  # GET /mt_distributions/1
  # GET /mt_distributions/1.xml
  def show
    @mt_product = MtProduct.find(params[:id])
    @product = @mt_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @mt_product.product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, mt_production_init_path(@mt_product)
    add_breadcrumb _("Data entry").html_safe, mt_distribution_url(@mt_product)

    if @mt_product
      @step = 3
      if !@mt_product.mt_distribution
        mt_distribution = MtDistribution.new
        mt_distribution.mt_product_id = @mt_product.id
        mt_distribution.save
        @mt_product.mt_distribution = mt_distribution
      end

      @mt_distribution = @mt_product.mt_distribution
      @mt_distribution_transport_datas = @mt_product.mt_distribution_transport_datas
      @mt_distribution_packaging_datas = @mt_product.mt_distribution_packaging_datas
      @mt_transport_types = MtTransportType.all
      
      mt_family_plastic = MtFamily.find_by_name("Plastics")
      
      @mt_materials = MtMaterial.find_all_by_mt_family_id(mt_family_plastic.id)
      mt_materials_no_family = MtMaterial.find_all_by_mt_family_id(nil)
      mt_materials_no_family.each do |mt_material_no_family|
         @mt_materials << mt_material_no_family
      end
      
      @detailed = false
      if @mt_product.mt_assessment && @mt_product.mt_assessment.assessment_type == 'detailed'
        @detailed = true
      end      
      
      respond_to do |format|
        format.html # show.html.erb
      end
    end
  end

  # GET /mt_distributions/new
  # GET /mt_distributions/new.xml
  def new
    @mt_distribution = MtDistribution.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mt_distribution }
    end
  end

  # GET /mt_distributions/1/edit
  def edit
    @mt_distribution = MtDistribution.find(params[:id])
  end

  # POST /mt_distributions
  # POST /mt_distributions.xml
  def create
    @mt_distribution = MtDistribution.new(params[:mt_distribution])

    
    respond_to do |format|
      if @mt_distribution.save
        format.html { redirect_to(@mt_distribution) }
        format.xml  { render :xml => @mt_distribution, :status => :created, :location => @mt_distribution }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mt_distribution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mt_distributions/1
  # PUT /mt_distributions/1.xml
  def update
    @mt_distribution = MtDistribution.find(params[:id])
    return_url = ''
    if params[:arrow]
       if params[:arrow] == 'next'
          return_url = mt_use_path(@mt_distribution.mt_product)     
       end
       if params[:arrow] == 'previous'
          return_url = mt_manufacturing_path(@mt_distribution.mt_product)
       end      
    end
    respond_to do |format|
      if @mt_distribution.update_attributes(params[:mt_distribution])
        format.html { redirect_to(return_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mt_distribution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mt_distributions/1
  # DELETE /mt_distributions/1.xml
  def destroy
    @mt_distribution = MtDistribution.find(params[:id])
    @mt_distribution.destroy

    respond_to do |format|
      format.html { redirect_to(mt_distributions_url) }
      format.xml  { head :ok }
    end
  end
  
  
  
 def next_step
    @mt_product = MtProduct.find(params[:mt_product_id].to_i)
    return_url = ''
    if params[:arrow]
       if params[:arrow] == 'next'
          return_url = mt_use_path(@mt_product)     
       end
       if params[:arrow] == 'previous'
          return_url = mt_manufacturing_path(@mt_product)
       end      
    end

    respond_to do |format|
        format.html { redirect_to(return_url) }
        format.xml  { head :ok }
    end

  end    
  
end
