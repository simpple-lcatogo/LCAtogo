class MtDataQualitiesController < ApplicationController
  # GET /mt_data_qualities
  # GET /mt_data_qualities.xml
  def index
    @mt_data_qualities = MtDataQuality.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mt_data_qualities }
    end
  end

  def intro
    @mt_product = MtProduct.find(params[:mt_data_quality_id])
    @product = @mt_product.product
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @mt_product.product.name, edit_product_url(@mt_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, mt_production_init_path(@mt_product)
    add_breadcrumb _("Data Quality").html_safe, mt_data_quality_intro_path(@mt_product)
    
    @step = 1    
    respond_to do |format|
      format.html # show.html.erb
    end
  end


  # GET /mt_data_qualities/1
  # GET /mt_data_qualities/1.xml
  def show
    @mt_product = MtProduct.find(params[:id])
    @product = @mt_product.product
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @mt_product.product.name, edit_product_url(@mt_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, mt_production_init_path(@mt_product)
    add_breadcrumb _("Data Quality").html_safe, mt_data_quality_path(@mt_product)
    
    @step = 2
    if !@mt_product.mt_data_quality
        mt_data_quality = MtDataQuality.new 
        mt_data_quality.mt_product_id = @mt_product.id
        mt_data_quality.save
        @mt_product.mt_data_quality = mt_data_quality
    end
    @mt_data_quality = @mt_product.mt_data_quality     

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mt_data_quality }
    end
  end

  # GET /mt_data_qualities/new
  # GET /mt_data_qualities/new.xml
  def new
    @mt_data_quality = MtDataQuality.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mt_data_quality }
    end
  end

  # GET /mt_data_qualities/1/edit
  def edit
    @mt_data_quality = MtDataQuality.find(params[:id])
  end

  # POST /mt_data_qualities
  # POST /mt_data_qualities.xml
  def create
    @mt_data_quality = MtDataQuality.new(params[:mt_data_quality])

    respond_to do |format|
      if @mt_data_quality.save
        format.html { redirect_to(@mt_data_quality, :notice => 'Mt data quality was successfully created.') }
        format.xml  { render :xml => @mt_data_quality, :status => :created, :location => @mt_data_quality }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mt_data_quality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mt_data_qualities/1
  # PUT /mt_data_qualities/1.xml
  def update
    @mt_data_quality = MtDataQuality.find(params[:id])

    respond_to do |format|
      if @mt_data_quality.update_attributes(params[:mt_data_quality])
        format.html { redirect_to(mt_data_quality_url(@mt_data_quality.mt_product)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mt_data_quality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mt_data_qualities/1
  # DELETE /mt_data_qualities/1.xml
  def destroy
    @mt_data_quality = MtDataQuality.find(params[:id])
    @mt_data_quality.destroy

    respond_to do |format|
      format.html { redirect_to(mt_data_qualities_url) }
      format.xml  { head :ok }
    end
  end
end
