class StConsumableDatasController < ApplicationController
  # GET /st_consumable_datas
  # GET /st_consumable_datas.xml
  def index
    @st_consumable_datas = StConsumableData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @st_consumable_datas }
    end
  end

  # GET /st_consumable_datas/1
  # GET /st_consumable_datas/1.xml
  def show
    @st_consumable_data = StConsumableData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @st_consumable_data }
    end
  end

  # GET /st_consumable_datas/new
  # GET /st_consumable_datas/new.xml
  def new
    @st_consumable_data = StConsumableData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @st_consumable_data }
    end
  end

  # GET /st_consumable_datas/1/edit
  def edit
    @st_consumable_data = StConsumableData.find(params[:id])
  end

  # POST /st_consumable_datas
  # POST /st_consumable_datas.xml
  def create
    @st_consumable_data = StConsumableData.new(params[:st_consumable_data])
    eco_cost = StExcelValue.find_by_local_name_and_category(@st_consumable_data.st_material.name, "Materials")
    if eco_cost
       @st_consumable_data.eco_cost = eco_cost.value
    else
      eco_cost = StExcelValue.find_by_local_name_and_category(@st_consumable_data.st_material.name + ",", "Materials")
      if eco_cost
       @st_consumable_data.eco_cost = eco_cost.value     
      end
    end

    respond_to do |format|
      if @st_consumable_data.save
        format.js  { render :action => "create_st_consumable_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @st_consumable_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /st_consumable_datas/1
  # PUT /st_consumable_datas/1.xml
  def update
    @st_consumable_data = StConsumableData.find(params[:id])

    respond_to do |format|
      if @st_consumable_data.update_attributes(params[:st_consumable_data])
        format.html { redirect_to(@st_consumable_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @st_consumable_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /st_consumable_datas/1
  # DELETE /st_consumable_datas/1.xml
  def destroy
    @st_consumable_data = StConsumableData.find(params[:id])
    @st_consumable_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_st_consumable_data" }
    end
  end
end
