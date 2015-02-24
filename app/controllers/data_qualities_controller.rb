class DataQualitiesController < ApplicationController
  # GET /data_qualities
  # GET /data_qualities.xml
  def index
    @data_qualities = DataQuality.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @data_qualities }
    end
  end

  # GET /data_qualities/1
  # GET /data_qualities/1.xml
  def show
    @product = Product.find(params[:id])
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
    add_breadcrumb _("Data Quality").html_safe, data_quality_path(@product)
    
    @step = 2
    if !@product.data_quality
        data_quality = DataQuality.new 
        data_quality.product_id = @product.id
        data_quality.manufacturing = 'illustrative'
        data_quality.distribution = 'illustrative'
        data_quality.use = 'illustrative'
        data_quality.end_of_life = 'illustrative'        
        data_quality.save
        @product.data_quality = data_quality
    end
    @data_quality = @product.data_quality
    if @data_quality.manufacturing.blank?
       @data_quality.manufacturing = 'illustrative'
    end
    if @data_quality.distribution.blank?
       @data_quality.distribution = 'illustrative'
    end
    if @data_quality.use.blank?
       @data_quality.use = 'illustrative'
    end
    if @data_quality.end_of_life.blank?
       @data_quality.end_of_life = 'illustrative'
    end
    @data_quality.save
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @data_quality }
    end
  end

  # GET /data_qualities/new
  # GET /data_qualities/new.xml
  def new
    @data_quality = DataQuality.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @data_quality }
    end
  end

  # GET /data_qualities/1/edit
  def edit
    @data_quality = DataQuality.find(params[:id])
  end

  # POST /data_qualities
  # POST /data_qualities.xml
  def create
    @data_quality = DataQuality.new(params[:data_quality])

    respond_to do |format|
      if @data_quality.save
        format.html { redirect_to(@data_quality, :notice => 'Data quality was successfully created.') }
        format.xml  { render :xml => @data_quality, :status => :created, :location => @data_quality }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @data_quality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /data_qualities/1
  # PUT /data_qualities/1.xml
  def update
    @data_quality = DataQuality.find(params[:id])

    respond_to do |format|
      if @data_quality.update_attributes(params[:data_quality])
        format.html { redirect_to(data_quality_url(@data_quality.product) , :notice => 'Data quality was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @data_quality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /data_qualities/1
  # DELETE /data_qualities/1.xml
  def destroy
    @data_quality = DataQuality.find(params[:id])
    @data_quality.destroy

    respond_to do |format|
      format.html { redirect_to(data_qualities_url) }
      format.xml  { head :ok }
    end
  end
  
  def intro
    @product = Product.find(params[:data_quality_id])
 
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, production_init_path(@product)
    add_breadcrumb _("Data Quality").html_safe, data_quality_intro_path(@product)
 
    @step = 1    
    respond_to do |format|
      format.html # show.html.erb
    end
  end      
  
end
