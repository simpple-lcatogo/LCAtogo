class SeUseConsumptionUtilityDatasController < ApplicationController
  # GET /se_use_consumption_utility_datas
  # GET /se_use_consumption_utility_datas.xml
  def index
    @se_use_consumption_utility_datas = SeUseConsumptionUtilityData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @se_use_consumption_utility_datas }
    end
  end

  # GET /se_use_consumption_utility_datas/1
  # GET /se_use_consumption_utility_datas/1.xml
  def show
    @se_use_consumption_utility_data = SeUseConsumptionUtilityData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @se_use_consumption_utility_data }
    end
  end

  # GET /se_use_consumption_utility_datas/new
  # GET /se_use_consumption_utility_datas/new.xml
  def new
    @se_use_consumption_utility_data = SeUseConsumptionUtilityData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @se_use_consumption_utility_data }
    end
  end

  # GET /se_use_consumption_utility_datas/1/edit
  def edit
    @se_use_consumption_utility_data = SeUseConsumptionUtilityData.find(params[:id])
  end

  # POST /se_use_consumption_utility_datas
  # POST /se_use_consumption_utility_datas.xml
  def create
    @se_use_consumption_utility_data = SeUseConsumptionUtilityData.new(params[:se_use_consumption_utility_data])

    respond_to do |format|
      if @se_use_consumption_utility_data.save
        format.js  { render :action => "create_se_use_consumption_utility_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @se_use_consumption_utility_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /se_use_consumption_utility_datas/1
  # PUT /se_use_consumption_utility_datas/1.xml
  def update
    @se_use_consumption_utility_data = SeUseConsumptionUtilityData.find(params[:id])

    respond_to do |format|
      if @se_use_consumption_utility_data.update_attributes(params[:se_use_consumption_utility_data])
        format.html { redirect_to(@se_use_consumption_utility_data, :notice => 'Se use consumption utility data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @se_use_consumption_utility_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /se_use_consumption_utility_datas/1
  # DELETE /se_use_consumption_utility_datas/1.xml
  def destroy
    @se_use_consumption_utility_data = SeUseConsumptionUtilityData.find(params[:id])
    @se_use_consumption_utility_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_se_use_consumption_utility_data" }
    end
  end
end
