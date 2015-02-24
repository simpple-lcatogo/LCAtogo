class PhBasicInformationsController < ApplicationController
  # GET /ph_basic_informations
  # GET /ph_basic_informations.xml
  def index
    @ph_basic_informations = PhBasicInformation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ph_basic_informations }
    end
  end

  # GET /ph_basic_informations/1
  # GET /ph_basic_informations/1.xml
  def show     
    @ph_product = PhProduct.find(params[:id])
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @ph_product.product.name, edit_product_url(@ph_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, ph_production_init_path(@ph_product)
    add_breadcrumb _("Data Entry").html_safe, ph_basic_information_path(@ph_product)
    
    
    if !@ph_product.ph_basic_information
        ph_basic_information = PhBasicInformation.new 
        ph_basic_information.ph_product_id = @ph_product.id
        ph_basic_information.working = 'no'
        ph_basic_information.know_power = 'no'        
        ph_basic_information.save
        @ph_product.ph_basic_information = ph_basic_information
    end
    @ph_basic_information = @ph_product.ph_basic_information
    @step = 1
    @product = @ph_product.product

    @ph_country_infos = PhCountryInfo.all
    @ph_mounting_types = PhMountingType.all
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ph_basic_information }
    end
  end

  # GET /ph_basic_informations/new
  # GET /ph_basic_informations/new.xml
  def new
    @ph_basic_information = PhBasicInformation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ph_basic_information }
    end
  end

  # GET /ph_basic_informations/1/edit
  def edit
    @ph_basic_information = PhBasicInformation.find(params[:id])
  end

  # POST /ph_basic_informations
  # POST /ph_basic_informations.xml
  def create
    @ph_basic_information = PhBasicInformation.new(params[:ph_basic_information])

    respond_to do |format|
      if @ph_basic_information.save
        format.html { redirect_to(@ph_basic_information) }
        format.xml  { render :xml => @ph_basic_information, :status => :created, :location => @ph_basic_information }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ph_basic_information.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ph_basic_informations/1
  # PUT /ph_basic_informations/1.xml
  def update
    @ph_basic_information = PhBasicInformation.find(params[:id])

    respond_to do |format|
      if @ph_basic_information.update_attributes(params[:ph_basic_information])
        format.html { redirect_to(ph_specified_path(@ph_basic_information.ph_product)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ph_basic_information.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ph_basic_informations/1
  # DELETE /ph_basic_informations/1.xml
  def destroy
    @ph_basic_information = PhBasicInformation.find(params[:id])
    @ph_basic_information.destroy

    respond_to do |format|
      format.html { redirect_to(ph_basic_informations_url) }
      format.xml  { head :ok }
    end
  end
end
