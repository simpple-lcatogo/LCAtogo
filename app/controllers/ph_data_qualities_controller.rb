class PhDataQualitiesController < ApplicationController
  # GET /ph_data_qualities
  # GET /ph_data_qualities.xml
  def index
    @ph_data_qualities = PhDataQuality.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ph_data_qualities }
    end
  end

  # GET /ph_data_qualities/1
  # GET /ph_data_qualities/1.xml
  def show
    @ph_product = PhProduct.find(params[:id])
    @product = @ph_product.product
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @ph_product.product.name, edit_product_url(@ph_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, ph_production_init_path(@ph_product)
    add_breadcrumb _("Data Quality").html_safe, ph_data_quality_path(@ph_product)
    
    
    @step = 2
    if !@ph_product.ph_data_quality
        ph_data_quality = PhDataQuality.new 
        ph_data_quality.ph_product_id = @ph_product.id
        ph_data_quality.save
        @ph_product.ph_data_quality = ph_data_quality
    end
    @ph_data_quality = @ph_product.ph_data_quality    

    respond_to do |format|
      format.html # show.html.erb
     # format.xml  { render :xml => @ph_data_quality }
    end
  end


  def intro
    @ph_product = PhProduct.find(params[:ph_data_quality_id])
    @product = @ph_product.product
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @ph_product.product.name, edit_product_url(@ph_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, ph_production_init_path(@ph_product)
    add_breadcrumb _("Data Quality").html_safe, ph_data_quality_intro_path(@ph_product)
    
    @step = 1    
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /ph_data_qualities/new
  # GET /ph_data_qualities/new.xml
  def new
    @ph_data_quality = PhDataQuality.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ph_data_quality }
    end
  end

  # GET /ph_data_qualities/1/edit
  def edit
    @ph_data_quality = PhDataQuality.find(params[:id])
  end

  # POST /ph_data_qualities
  # POST /ph_data_qualities.xml
  def create
    @ph_data_quality = PhDataQuality.new(params[:ph_data_quality])

    respond_to do |format|
      if @ph_data_quality.save
        format.html { redirect_to(@ph_data_quality) }
        format.xml  { render :xml => @ph_data_quality, :status => :created, :location => @ph_data_quality }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ph_data_quality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ph_data_qualities/1
  # PUT /ph_data_qualities/1.xml
  def update
    @ph_data_quality = PhDataQuality.find(params[:id])

    respond_to do |format|
      if @ph_data_quality.update_attributes(params[:ph_data_quality])
        format.html { redirect_to(ph_data_quality_url(@ph_data_quality.ph_product)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ph_data_quality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ph_data_qualities/1
  # DELETE /ph_data_qualities/1.xml
  def destroy
    @ph_data_quality = PhDataQuality.find(params[:id])
    @ph_data_quality.destroy

    respond_to do |format|
      format.html { redirect_to(ph_data_qualities_url) }
      format.xml  { head :ok }
    end
  end
end
