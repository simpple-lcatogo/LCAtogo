class StPackagingDatasController < ApplicationController
  # GET /st_packaging_datas
  # GET /st_packaging_datas.xml
  def index
    @st_packaging_datas = StPackagingData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @st_packaging_datas }
    end
  end

  # GET /st_packaging_datas/1
  # GET /st_packaging_datas/1.xml
  def show
    @st_packaging_data = StPackagingData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @st_packaging_data }
    end
  end

  # GET /st_packaging_datas/new
  # GET /st_packaging_datas/new.xml
  def new
    @st_packaging_data = StPackagingData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @st_packaging_data }
    end
  end

  # GET /st_packaging_datas/1/edit
  def edit
    @st_packaging_data = StPackagingData.find(params[:id])
  end

  # POST /st_packaging_datas
  # POST /st_packaging_datas.xml
  def create
    @st_packaging_data = StPackagingData.new(params[:st_packaging_data])
    eco_cost = StExcelValue.find_by_local_name_and_category(@st_packaging_data.st_packaging_type.name, "Packaging")
    if eco_cost
       @st_packaging_data.eco_cost = eco_cost.value
    else
      eco_cost = StExcelValue.find_by_local_name_and_category(@st_packaging_data.st_packaging_type.name + ",", "Packaging")
      if eco_cost
       @st_packaging_data.eco_cost = eco_cost.value     
      end
    end

    respond_to do |format|
      if @st_packaging_data.save
        format.js  { render :action => "create_st_packaging_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @st_packaging_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /st_packaging_datas/1
  # PUT /st_packaging_datas/1.xml
  def update
    @st_packaging_data = StPackagingData.find(params[:id])

    respond_to do |format|
      if @st_packaging_data.update_attributes(params[:st_packaging_data])
        format.html { redirect_to(@st_packaging_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @st_packaging_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /st_packaging_datas/1
  # DELETE /st_packaging_datas/1.xml
  def destroy
    @st_packaging_data = StPackagingData.find(params[:id])
    @st_packaging_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_st_packaging_data" }
    end
  end
end
