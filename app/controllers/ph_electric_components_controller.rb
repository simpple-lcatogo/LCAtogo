class PhElectricComponentsController < ApplicationController
  # GET /ph_electric_components
  # GET /ph_electric_components.xml
  def index
    @ph_electric_components = PhElectricComponent.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ph_electric_components }
    end
  end

  # GET /ph_electric_components/1
  # GET /ph_electric_components/1.xml
  def show
    @ph_product = PhProduct.find(params[:id])

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @ph_product.product.name, edit_product_url(@ph_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, ph_production_init_path(@ph_product)
    add_breadcrumb _("Data Entry").html_safe, ph_electric_component_path(@ph_product)
    
    if !@ph_product.ph_electric_component
        ph_electric_component = PhElectricComponent.new 
        ph_electric_component.ph_product_id = @ph_product.id
        ph_electric_component.include_batteries = 'no'        
        ph_electric_component.save
        @ph_product.ph_electric_component = ph_electric_component
    end
    @ph_electric_component = @ph_product.ph_electric_component
    @step = 4
    @product = @ph_product.product
    
    @ph_battery_types = PhBatteryType.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ph_electric_component }
    end
  end

  # GET /ph_electric_components/new
  # GET /ph_electric_components/new.xml
  def new
    @ph_electric_component = PhElectricComponent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ph_electric_component }
    end
  end

  # GET /ph_electric_components/1/edit
  def edit
    @ph_electric_component = PhElectricComponent.find(params[:id])
  end

  # POST /ph_electric_components
  # POST /ph_electric_components.xml
  def create
    @ph_electric_component = PhElectricComponent.new(params[:ph_electric_component])

    respond_to do |format|
      if @ph_electric_component.save
        format.html { redirect_to(@ph_electric_component) }
        format.xml  { render :xml => @ph_electric_component, :status => :created, :location => @ph_electric_component }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ph_electric_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ph_electric_components/1
  # PUT /ph_electric_components/1.xml
  def update
    @ph_electric_component = PhElectricComponent.find(params[:id])

    respond_to do |format|
      if @ph_electric_component.update_attributes(params[:ph_electric_component])
        format.html { redirect_to(ph_maintenance_path(@ph_electric_component.ph_product)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ph_electric_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ph_electric_components/1
  # DELETE /ph_electric_components/1.xml
  def destroy
    @ph_electric_component = PhElectricComponent.find(params[:id])
    @ph_electric_component.destroy

    respond_to do |format|
      format.html { redirect_to(ph_electric_components_url) }
      format.xml  { head :ok }
    end
  end
end
