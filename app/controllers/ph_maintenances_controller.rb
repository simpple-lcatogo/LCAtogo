class PhMaintenancesController < ApplicationController
  # GET /ph_maintenances
  # GET /ph_maintenances.xml
  def index
    @ph_maintenances = PhMaintenance.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ph_maintenances }
    end
  end

  # GET /ph_maintenances/1
  # GET /ph_maintenances/1.xml
  def show
    @ph_product = PhProduct.find(params[:id])
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @ph_product.product.name, edit_product_url(@ph_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, ph_production_init_path(@ph_product)
    add_breadcrumb _("Data Entry").html_safe, ph_maintenance_path(@ph_product)
    
    
    if !@ph_product.ph_maintenance
        ph_maintenance = PhMaintenance.new 
        ph_maintenance.ph_product_id = @ph_product.id
        ph_maintenance.save
        @ph_product.ph_maintenance = ph_maintenance
    end
    @ph_maintenance = @ph_product.ph_maintenance
    @step = 5
    @product = @ph_product.product
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ph_maintenance }
    end
  end

  # GET /ph_maintenances/new
  # GET /ph_maintenances/new.xml
  def new
    @ph_maintenance = PhMaintenance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ph_maintenance }
    end
  end

  # GET /ph_maintenances/1/edit
  def edit
    @ph_maintenance = PhMaintenance.find(params[:id])
  end

  # POST /ph_maintenances
  # POST /ph_maintenances.xml
  def create
    @ph_maintenance = PhMaintenance.new(params[:ph_maintenance])

    respond_to do |format|
      if @ph_maintenance.save
        format.html { redirect_to(@ph_maintenance) }
        format.xml  { render :xml => @ph_maintenance, :status => :created, :location => @ph_maintenance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ph_maintenance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ph_maintenances/1
  # PUT /ph_maintenances/1.xml
  def update
    @ph_maintenance = PhMaintenance.find(params[:id])

    respond_to do |format|
      if @ph_maintenance.update_attributes(params[:ph_maintenance])
        format.html { redirect_to(ph_result_summary_path(@ph_maintenance.ph_product)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ph_maintenance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ph_maintenances/1
  # DELETE /ph_maintenances/1.xml
  def destroy
    @ph_maintenance = PhMaintenance.find(params[:id])
    @ph_maintenance.destroy

    respond_to do |format|
      format.html { redirect_to(ph_maintenances_url) }
      format.xml  { head :ok }
    end
  end
end
