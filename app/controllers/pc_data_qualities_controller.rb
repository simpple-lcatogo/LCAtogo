class PcDataQualitiesController < ApplicationController
  # GET /pc_data_qualities
  # GET /pc_data_qualities.xml
  def index
    @pc_data_qualities = PcDataQuality.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pc_data_qualities }
    end
  end

  # GET /pc_data_qualities/1
  # GET /pc_data_qualities/1.xml
  def show
    @pc_product = PcProduct.find(params[:id])
    @product = @pc_product.product
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @pc_product.product.name, edit_product_url(@pc_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, pc_production_init_path(@pc_product)
    add_breadcrumb _("Data Quality").html_safe, pc_data_quality_path(@pc_product)
    
    @step = 2
    if !@pc_product.pc_data_quality
        pc_data_quality = PcDataQuality.new 
        pc_data_quality.pc_product_id = @pc_product.id
        pc_data_quality.save
        @pc_product.pc_data_quality = pc_data_quality
    end
    @pc_data_quality = @pc_product.pc_data_quality               

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pc_data_quality }
    end
  end

  # GET /pc_data_qualities/new
  # GET /pc_data_qualities/new.xml
  def new
    @pc_data_quality = PcDataQuality.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pc_data_quality }
    end
  end

  # GET /pc_data_qualities/1/edit
  def edit
    @pc_data_quality = PcDataQuality.find(params[:id])
  end

  # POST /pc_data_qualities
  # POST /pc_data_qualities.xml
  def create
    @pc_data_quality = PcDataQuality.new(params[:pc_data_quality])

    respond_to do |format|
      if @pc_data_quality.save
        format.html { redirect_to(@pc_data_quality, :notice => 'Pc data quality was successfully created.') }
        format.xml  { render :xml => @pc_data_quality, :status => :created, :location => @pc_data_quality }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pc_data_quality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pc_data_qualities/1
  # PUT /pc_data_qualities/1.xml
  def update
    @pc_data_quality = PcDataQuality.find(params[:id])

    respond_to do |format|
      if @pc_data_quality.update_attributes(params[:pc_data_quality])
        format.html { redirect_to(pc_data_quality_path(@pc_data_quality.pc_product), :notice => 'Data quality was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pc_data_quality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pc_data_qualities/1
  # DELETE /pc_data_qualities/1.xml
  def destroy
    @pc_data_quality = PcDataQuality.find(params[:id])
    @pc_data_quality.destroy

    respond_to do |format|
      format.html { redirect_to(pc_data_qualities_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def intro
    @pc_product = PcProduct.find(params[:pc_data_quality_id])
    @product = @pc_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @pc_product.product.name, edit_product_url(@pc_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, pc_production_init_path(@pc_product)
    add_breadcrumb _("Data Quality").html_safe, pc_data_quality_intro_path(@pc_product)
    
    @step = 1    
    respond_to do |format|
      format.html # show.html.erb
    end
  end     
  
end
