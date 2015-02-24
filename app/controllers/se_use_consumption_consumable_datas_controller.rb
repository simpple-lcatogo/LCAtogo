class SeUseConsumptionConsumableDatasController < ApplicationController
  # GET /se_use_consumption_consumable_datas
  # GET /se_use_consumption_consumable_datas.xml
  def index
    @se_use_consumption_consumable_datas = SeUseConsumptionConsumableData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @se_use_consumption_consumable_datas }
    end
  end

  # GET /se_use_consumption_consumable_datas/1
  # GET /se_use_consumption_consumable_datas/1.xml
  def show
    @se_use_consumption_consumable_data = SeUseConsumptionConsumableData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @se_use_consumption_consumable_data }
    end
  end

  # GET /se_use_consumption_consumable_datas/new
  # GET /se_use_consumption_consumable_datas/new.xml
  def new
    @se_use_consumption_consumable_data = SeUseConsumptionConsumableData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @se_use_consumption_consumable_data }
    end
  end

  # GET /se_use_consumption_consumable_datas/1/edit
  def edit
    @se_use_consumption_consumable_data = SeUseConsumptionConsumableData.find(params[:id])
  end

  # POST /se_use_consumption_consumable_datas
  # POST /se_use_consumption_consumable_datas.xml
  def create
    @se_use_consumption_consumable_data = SeUseConsumptionConsumableData.new(params[:se_use_consumption_consumable_data])

    respond_to do |format|
      if @se_use_consumption_consumable_data.save
        format.js  { render :action => "create_se_use_consumption_consumable_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @se_use_consumption_consumable_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /se_use_consumption_consumable_datas/1
  # PUT /se_use_consumption_consumable_datas/1.xml
  def update
    @se_use_consumption_consumable_data = SeUseConsumptionConsumableData.find(params[:id])

    respond_to do |format|
      if @se_use_consumption_consumable_data.update_attributes(params[:se_use_consumption_consumable_data])
        format.html { redirect_to(@se_use_consumption_consumable_data, :notice => 'Se use consumption consumable data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @se_use_consumption_consumable_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /se_use_consumption_consumable_datas/1
  # DELETE /se_use_consumption_consumable_datas/1.xml
  def destroy
    @se_use_consumption_consumable_data = SeUseConsumptionConsumableData.find(params[:id])
    
    @se_use_consumption_consumable_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_se_use_consumption_consumable_data" }
    end
  end

  def update_values
    update_value = params[:update_value]

    se_use_consumption_consumable_data = SeUseConsumptionConsumableData.find(params[:id])
    
    if params[:field] == 'cost'
      se_use_consumption_consumable_data.cost = update_value
      update_value = update_value + " &euro;/kg"
    end  

    if se_use_consumption_consumable_data.save
        respond_to do |format|
          format.html {render :inline => update_value }
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
