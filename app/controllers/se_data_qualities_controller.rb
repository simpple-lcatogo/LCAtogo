class SeDataQualitiesController < ApplicationController
  # GET /se_data_qualities
  # GET /se_data_qualities.xml
  def index
    @se_data_qualities = SeDataQuality.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @se_data_qualities }
    end
  end

  # GET /se_data_qualities/1
  # GET /se_data_qualities/1.xml
  def show
    @se_product = SeProduct.find(params[:id])
    @product = @se_product.product
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @se_product.product.name, edit_product_url(@se_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, se_production_init_path(@se_product)
    add_breadcrumb _("Data Quality").html_safe, se_data_quality_path(@se_product)
    
    @step = 2
    if !@se_product.se_data_quality
        se_data_quality = SeDataQuality.new 
        se_data_quality.se_product_id = @se_product.id
        se_data_quality.save
        @se_product.se_data_quality = se_data_quality
    end
    @se_data_quality = @se_product.se_data_quality               

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @se_data_quality }
    end
  end

  # GET /se_data_qualities/new
  # GET /se_data_qualities/new.xml
  def new
    @se_data_quality = SeDataQuality.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @se_data_quality }
    end
  end

  # GET /se_data_qualities/1/edit
  def edit
    @se_data_quality = SeDataQuality.find(params[:id])
  end

  # POST /se_data_qualities
  # POST /se_data_qualities.xml
  def create
    @se_data_quality = SeDataQuality.new(params[:se_data_quality])

    respond_to do |format|
      if @se_data_quality.save
        format.html { redirect_to(@se_data_quality, :notice => 'Se data quality was successfully created.') }
        format.xml  { render :xml => @se_data_quality, :status => :created, :location => @se_data_quality }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @se_data_quality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /se_data_qualities/1
  # PUT /se_data_qualities/1.xml
  def update
    @se_data_quality = SeDataQuality.find(params[:id])

    respond_to do |format|
      if @se_data_quality.update_attributes(params[:se_data_quality])
        format.html { redirect_to(se_data_quality_path(@se_data_quality.se_product), :notice => 'Se data quality was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @se_data_quality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /se_data_qualities/1
  # DELETE /se_data_qualities/1.xml
  def destroy
    @se_data_quality = SeDataQuality.find(params[:id])
    @se_data_quality.destroy

    respond_to do |format|
      format.html { redirect_to(se_data_qualities_url) }
      format.xml  { head :ok }
    end
  end
  
  def intro
    @se_product = SeProduct.find(params[:se_data_quality_id])
    @product = @se_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @se_product.product.name, edit_product_url(@se_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, se_production_init_path(@se_product)
    add_breadcrumb _("Data Quality").html_safe, se_data_quality_intro_path(@se_product)
    
    @step = 1    
    respond_to do |format|
      format.html # show.html.erb
    end
  end    
  
end
