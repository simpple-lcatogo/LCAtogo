class StDataQualitiesController < ApplicationController
  # GET /st_data_qualities
  # GET /st_data_qualities.xml
  def index
    @st_data_qualities = StDataQuality.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @st_data_qualities }
    end
  end

  # GET /st_data_qualities/1
  # GET /st_data_qualities/1.xml
  def show
    @st_product = StProduct.find(params[:id])
    @product = @st_product.product
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @st_product.product.name, edit_product_url(@st_product.product)
    add_breadcrumb _("Data Quality").html_safe, st_data_quality_path(@st_product)
    
    @step = 2
    if !@st_product.st_data_quality
        st_data_quality = StDataQuality.new 
        st_data_quality.st_product_id = @st_product.id
        st_data_quality.save
        @st_product.st_data_quality = st_data_quality
    end
    @st_data_quality = @st_product.st_data_quality    
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end


  def intro
    @st_product = StProduct.find(params[:st_data_quality_id])
    @product = @st_product.product
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @st_product.product.name, edit_product_url(@st_product.product)
    add_breadcrumb _("Data Quality").html_safe, st_data_quality_intro_path(@st_product)
    
    @step = 1    
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /st_data_qualities/new
  # GET /st_data_qualities/new.xml
  def new
    @st_data_quality = StDataQuality.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @st_data_quality }
    end
  end

  # GET /st_data_qualities/1/edit
  def edit
    @st_data_quality = StDataQuality.find(params[:id])
  end

  # POST /st_data_qualities
  # POST /st_data_qualities.xml
  def create
    @st_data_quality = StDataQuality.new(params[:st_data_quality])

    respond_to do |format|
      if @st_data_quality.save
        format.html { redirect_to(@st_data_quality) }
        format.xml  { render :xml => @st_data_quality, :status => :created, :location => @st_data_quality }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @st_data_quality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /st_data_qualities/1
  # PUT /st_data_qualities/1.xml
  def update
    @st_data_quality = StDataQuality.find(params[:id])

    respond_to do |format|
      if @st_data_quality.update_attributes(params[:st_data_quality])
        format.html { redirect_to(st_data_quality_path(@st_data_quality.st_product)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @st_data_quality.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /st_data_qualities/1
  # DELETE /st_data_qualities/1.xml
  def destroy
    @st_data_quality = StDataQuality.find(params[:id])
    @st_data_quality.destroy

    respond_to do |format|
      format.html { redirect_to(st_data_qualities_url) }
      format.xml  { head :ok }
    end
  end
end
