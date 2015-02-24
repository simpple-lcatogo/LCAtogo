class BpDataQualitiesController < ApplicationController
  # GET /bp_data_qualities
  # GET /bp_data_qualities.xml
  def index
    @bp_data_qualities = BpDataQuality.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bp_data_qualities }
    end
  end

  # GET /bp_data_qualities/1
  # GET /bp_data_qualities/1.xml
  def show
    @bp_product = BpProduct.find(params[:id])
    @product = @bp_product.product
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @bp_product.product.name, edit_product_url(@bp_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, bp_production_init_path(@bp_product)
    add_breadcrumb _("Data Quality").html_safe, bp_data_quality_path(@bp_product)
    
    
    @step = 2
    if !@bp_product.bp_data_quality
        bp_data_quality = BpDataQuality.new 
        bp_data_quality.bp_product_id = @bp_product.id
        bp_data_quality.save
        @bp_product.bp_data_quality = bp_data_quality
    end
    @bp_data_quality = @bp_product.bp_data_quality               

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bp_data_quality }
    end
  end

  # GET /bp_data_qualities/new
  # GET /bp_data_qualities/new.xml
  def new
    @bp_data_quality = BpDataQuality.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bp_data_quality }
    end
  end

  # GET /bp_data_qualities/1/edit
  def edit
    @bp_data_quality = BpDataQuality.find(params[:id])
  end

  # POST /bp_data_qualities
  # POST /bp_data_qualities.xml
  def create
    @bp_data_quality = BpDataQuality.new(params[:bp_data_quality])

    respond_to do |format|
      if @bp_data_quality.save
        format.html { redirect_to(@bp_data_quality, :notice => 'Bp data quality was successfully created.') }
        format.xml  { render :xml => @bp_data_quality, :status => :created, :location => @bp_data_quality }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bp_data_quality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bp_data_qualities/1
  # PUT /bp_data_qualities/1.xml
  def update
    @bp_data_quality = BpDataQuality.find(params[:id])

    respond_to do |format|
      if @bp_data_quality.update_attributes(params[:bp_data_quality])
        format.html { redirect_to(bp_data_quality_url(@bp_data_quality.bp_product) , :notice => 'Bp data quality was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bp_data_quality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bp_data_qualities/1
  # DELETE /bp_data_qualities/1.xml
  def destroy
    @bp_data_quality = BpDataQuality.find(params[:id])
    @bp_data_quality.destroy


    respond_to do |format|
      format.html { redirect_to(bp_data_qualities_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def intro
    @bp_product = BpProduct.find(params[:bp_data_quality_id])
    @product = @bp_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @bp_product.product.name, edit_product_url(@bp_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, bp_production_init_path(@bp_product)
    add_breadcrumb _("Data Quality").html_safe, bp_data_quality_intro_path(@bp_product)
    
    @step = 1    
    respond_to do |format|
      format.html # show.html.erb
    end
  end  
  
end
