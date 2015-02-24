class SeUseConsumptionsController < ApplicationController
  # GET /se_use_consumptions
  # GET /se_use_consumptions.xml
  def index
    @se_use_consumptions = SeUseConsumption.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @se_use_consumptions }
    end
  end

  # GET /se_use_consumptions/1
  # GET /se_use_consumptions/1.xml
  def show
    @se_product = SeProduct.find(params[:id])
    @product = @se_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @se_product.product.name, edit_product_url(@se_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, se_production_init_path(@se_product)
    add_breadcrumb _("Data entry").html_safe, se_manufacturing_url(@se_product)

    @se_energy_types = SeEnergyType.all.sort_by{ |k| k['name'] }
    @se_energy_uses = SeEnergyUse.all.sort_by{ |k| k['name'] }
    @se_use_consumption_datas = @se_product.se_use_consumption_datas
    @se_consumables = SeConsumable.all.sort_by{ |k| k['name'] }
    @se_use_consumption_consumable_datas = @se_product.se_use_consumption_consumable_datas
    @se_utilities = SeUtility.all.sort_by{ |k| k['name'] }
    @se_use_consumption_utility_datas = @se_product.se_use_consumption_utility_datas

    if @se_product      
      @step = 4
      if !@se_product.se_use_consumption
        se_use_consumption = SeUseConsumption.new 
        se_use_consumption.se_product_id = @se_product.id
        se_use_consumption.save
        @se_product.se_use_consumption = se_use_consumption        
      end    
    
      @se_use_consumption = @se_product.se_use_consumption
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @se_use_consumption }
      end
   end     
 
  end

  # GET /se_use_consumptions/new
  # GET /se_use_consumptions/new.xml
  def new
    @se_use_consumption = SeUseConsumption.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @se_use_consumption }
    end
  end

  # GET /se_use_consumptions/1/edit
  def edit
    @se_use_consumption = SeUseConsumption.find(params[:id])
  end

  # POST /se_use_consumptions
  # POST /se_use_consumptions.xml
  def create
    @se_use_consumption = SeUseConsumption.new(params[:se_use_consumption])

    respond_to do |format|
      if @se_use_consumption.save
        format.html { redirect_to(@se_use_consumption, :notice => 'Se use consumption was successfully created.') }
        format.xml  { render :xml => @se_use_consumption, :status => :created, :location => @se_use_consumption }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @se_use_consumption.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /se_use_consumptions/1
  # PUT /se_use_consumptions/1.xml
  def update
    @se_use_consumption = SeUseConsumption.find(params[:id])

    respond_to do |format|
      if @se_use_consumption.update_attributes(params[:se_use_consumption])
        format.html { redirect_to(se_use_consumption_path(@se_use_consumption.se_product), :notice => 'Electricity consumption of sensor system was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @se_use_consumption.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /se_use_consumptions/1
  # DELETE /se_use_consumptions/1.xml
  def destroy
    @se_use_consumption = SeUseConsumption.find(params[:id])
    @se_use_consumption.destroy

    respond_to do |format|
      format.html { redirect_to(se_use_consumptions_url) }
      format.xml  { head :ok }
    end
  end

  def next_step
    @se_product = SeProduct.find(params[:se_product_id].to_i)

    if @se_product.product.step < 5
      @se_product.product.step = 4
      @se_product.product.save
    end

    respond_to do |format|
      format.html { redirect_to se_use_cost_url(@se_product)}
    end
  end

  def previous_step
    @se_product = SeProduct.find(params[:se_product_id].to_i)
    respond_to do |format|
      format.html { redirect_to se_use_product_url(@se_product)}
    end
  end
      
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end       
      
  def update_sensor_system_with
      value = params[:update_value]
      if is_a_number?value
         se_use_consumption_id = params[:se_use_consumption_id]
         @se_use_consumption = SeUseConsumption.find(se_use_consumption_id)
         @se_use_consumption.sensor_system_with = value
         @se_use_consumption.save
         respond_to do |format|
           format.html {render :inline => value}
           format.xml  { head :ok }
         end
      else
         respond_to do |format|
           format.html {render :inline => params[:original_value]}
           format.xml  { head :ok }
         end      
      end
  end
  
end
