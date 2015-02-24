class StConsumptionDatasController < ApplicationController
  # GET /st_consumption_datas
  # GET /st_consumption_datas.xml
  def index
    @st_consumption_datas = StConsumptionData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @st_consumption_datas }
    end
  end

  # GET /st_consumption_datas/1
  # GET /st_consumption_datas/1.xml
  def show
    @st_consumption_data = StConsumptionData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @st_consumption_data }
    end
  end

  # GET /st_consumption_datas/new
  # GET /st_consumption_datas/new.xml
  def new
    @st_consumption_data = StConsumptionData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @st_consumption_data }
    end
  end

  # GET /st_consumption_datas/1/edit
  def edit
    @st_consumption_data = StConsumptionData.find(params[:id])
  end

  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

  # POST /st_consumption_datas
  # POST /st_consumption_datas.xml
  def create
    @st_consumption_data = StConsumptionData.new(params[:st_consumption_data])
    if is_a_number?(params[:lifetime_hidden])
       @lifetime_hidden = params[:lifetime_hidden].to_f
    else
      @lifetime_hidden = 0
    end
    if @st_consumption_data.st_product.st_end_of_life && @st_consumption_data.st_product.st_end_of_life.lifetime
      @end_of_life_lifetime = @st_consumption_data.st_product.st_end_of_life.lifetime
    else
      @end_of_life_lifetime = 0
    end
    eco_cost = StExcelValue.find_by_local_name_and_category(@st_consumption_data.st_energy_source.name, "Energy")
    if eco_cost
       @st_consumption_data.eco_cost = eco_cost.value
    else
      eco_cost = StExcelValue.find_by_local_name_and_category(@st_consumption_data.st_energy_source.name + ",", "Energy")
      if eco_cost
       @st_consumption_data.eco_cost = eco_cost.value     
      end
    end
    respond_to do |format|
      if @st_consumption_data.save
        format.js  { render :action => "create_st_consumption_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @st_consumption_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /st_consumption_datas/1
  # PUT /st_consumption_datas/1.xml
  def update
    @st_consumption_data = StConsumptionData.find(params[:id])

    respond_to do |format|
      if @st_consumption_data.update_attributes(params[:st_consumption_data])
        format.html { redirect_to(@st_consumption_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @st_consumption_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /st_consumption_datas/1
  # DELETE /st_consumption_datas/1.xml
  def destroy
    @st_consumption_data = StConsumptionData.find(params[:id])
    @st_consumption_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_st_consumption_data" }
    end
  end
end
