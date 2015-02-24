class SeUseConsumptionDatasController < ApplicationController
  # GET /se_use_consumption_datas
  # GET /se_use_consumption_datas.xml
  def index
    @se_use_consumption_datas = SeUseConsumptionData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @se_use_consumption_datas }
    end
  end

  # GET /se_use_consumption_datas/1
  # GET /se_use_consumption_datas/1.xml
  def show
    @se_use_consumption_data = SeUseConsumptionData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @se_use_consumption_data }
    end
  end

  # GET /se_use_consumption_datas/new
  # GET /se_use_consumption_datas/new.xml
  def new
    @se_use_consumption_data = SeUseConsumptionData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @se_use_consumption_data }
    end
  end

  # GET /se_use_consumption_datas/1/edit
  def edit
    @se_use_consumption_data = SeUseConsumptionData.find(params[:id])
  end

  # POST /se_use_consumption_datas
  # POST /se_use_consumption_datas.xml
  def create
    @se_use_consumption_data = SeUseConsumptionData.new(params[:se_use_consumption_data])

    respond_to do |format|
      if @se_use_consumption_data.save
        format.js  { render :action => "create_se_use_consumption_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @se_use_consumption_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /se_use_consumption_datas/1
  # PUT /se_use_consumption_datas/1.xml
  def update
    @se_use_consumption_data = SeUseConsumptionData.find(params[:id])

    respond_to do |format|
      if @se_use_consumption_data.update_attributes(params[:se_use_consumption_data])
        format.html { redirect_to(@se_use_consumption_data, :notice => 'Se use consumption data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @se_use_consumption_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /se_use_consumption_datas/1
  # DELETE /se_use_consumption_datas/1.xml
  def destroy
    @se_use_consumption_data = SeUseConsumptionData.find(params[:id])
    @se_use_consumption_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_se_use_consumption_data" }
    end
  end
end
