class StEnergyDatasController < ApplicationController
  # GET /st_energy_datas
  # GET /st_energy_datas.xml
  def index
    @st_energy_datas = StEnergyData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @st_energy_datas }
    end
  end

  # GET /st_energy_datas/1
  # GET /st_energy_datas/1.xml
  def show
    @st_energy_data = StEnergyData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @st_energy_data }
    end
  end

  # GET /st_energy_datas/new
  # GET /st_energy_datas/new.xml
  def new
    @st_energy_data = StEnergyData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @st_energy_data }
    end
  end

  # GET /st_energy_datas/1/edit
  def edit
    @st_energy_data = StEnergyData.find(params[:id])
  end

  # POST /st_energy_datas
  # POST /st_energy_datas.xml
  def create
    @st_energy_data = StEnergyData.new(params[:st_energy_data])
    eco_cost = StExcelValue.find_by_local_name_and_category(@st_energy_data.st_energy_source.name, "Energy")
    if eco_cost
       @st_energy_data.eco_cost = eco_cost.value
    else
      eco_cost = StExcelValue.find_by_local_name_and_category(@st_energy_data.st_energy_source.name + ",", "Energy")
      if eco_cost
       @st_energy_data.eco_cost = eco_cost.value     
      end
    end



    respond_to do |format|
      if @st_energy_data.save
        format.js  { render :action => "create_st_energy_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @st_energy_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /st_energy_datas/1
  # PUT /st_energy_datas/1.xml
  def update
    @st_energy_data = StEnergyData.find(params[:id])

    respond_to do |format|
      if @st_energy_data.update_attributes(params[:st_energy_data])
        format.html { redirect_to(@st_energy_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @st_energy_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /st_energy_datas/1
  # DELETE /st_energy_datas/1.xml
  def destroy
    @st_energy_data = StEnergyData.find(params[:id])
    @st_energy_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_st_energy_data" }
    end
  end
end
