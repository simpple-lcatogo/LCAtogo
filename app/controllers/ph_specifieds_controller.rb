class PhSpecifiedsController < ApplicationController
  # GET /ph_specifieds
  # GET /ph_specifieds.xml
  def index
    @ph_specifieds = PhSpecified.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ph_specifieds }
    end
  end

  # GET /ph_specifieds/1
  # GET /ph_specifieds/1.xml
  def show
    @ph_product = PhProduct.find(params[:id])
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @ph_product.product.name, edit_product_url(@ph_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, ph_production_init_path(@ph_product)
    add_breadcrumb _("Data Entry").html_safe, ph_specified_path(@ph_product)
    
    if !@ph_product.ph_specified
        ph_specified = PhSpecified.new 
        ph_specified.ph_product_id = @ph_product.id
        ph_specified.save
        @ph_product.ph_specified = ph_specified
    end
    @ph_specified = @ph_product.ph_specified
    @step = 2
    @product = @ph_product.product

    if @ph_product.ph_basic_information
       if @ph_product.ph_basic_information.know_power == 'yes' && @ph_product.ph_basic_information.working == 'yes'
          @user_power_before = @ph_product.ph_basic_information.user_power
       end      
    end

    @ph_area_units = PhUnit.find(:all, :conditions => ["unit_filter='area'"])
    @ph_power_units = PhUnit.find(:all, :conditions => ["unit_filter='power'"])    
    @ph_module_types = PhModuleType.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ph_specified }
    end
  end

  # GET /ph_specifieds/new
  # GET /ph_specifieds/new.xml
  def new
    @ph_specified = PhSpecified.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ph_specified }
    end
  end

  # GET /ph_specifieds/1/edit
  def edit
    @ph_specified = PhSpecified.find(params[:id])
  end

  # POST /ph_specifieds
  # POST /ph_specifieds.xml
  def create
    @ph_specified = PhSpecified.new(params[:ph_specified])

    respond_to do |format|
      if @ph_specified.save
        format.html { redirect_to(@ph_specified) }
        format.xml  { render :xml => @ph_specified, :status => :created, :location => @ph_specified }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ph_specified.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ph_specifieds/1
  # PUT /ph_specifieds/1.xml
  def update
    @ph_specified = PhSpecified.find(params[:id])

    respond_to do |format|
      if @ph_specified.update_attributes(params[:ph_specified])
        format.html { redirect_to(ph_intermediate_result_path(@ph_specified.ph_product)) }
#        format.html { redirect_to(@ph_specified, :notice => 'Ph specified was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ph_specified.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ph_specifieds/1
  # DELETE /ph_specifieds/1.xml
  def destroy
    @ph_specified = PhSpecified.find(params[:id])
    @ph_specified.destroy

    respond_to do |format|
      format.html { redirect_to(ph_specifieds_url) }
      format.xml  { head :ok }
    end
  end
end
