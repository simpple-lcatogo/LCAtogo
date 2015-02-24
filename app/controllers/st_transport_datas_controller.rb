class StTransportDatasController < ApplicationController
  # GET /st_transport_datas
  # GET /st_transport_datas.xml
  def index
    @st_transport_datas = StTransportData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @st_transport_datas }
    end
  end

  # GET /st_transport_datas/1
  # GET /st_transport_datas/1.xml
  def show
    @st_transport_data = StTransportData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @st_transport_data }
    end
  end

  # GET /st_transport_datas/new
  # GET /st_transport_datas/new.xml
  def new
    @st_transport_data = StTransportData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @st_transport_data }
    end
  end

  # GET /st_transport_datas/1/edit
  def edit
    @st_transport_data = StTransportData.find(params[:id])
  end

  # POST /st_transport_datas
  # POST /st_transport_datas.xml
  def create
    @st_transport_data = StTransportData.new(params[:st_transport_data])
    eco_cost = StExcelValue.find_by_local_name_and_category(@st_transport_data.st_transport.name, "Transport")
    if eco_cost
       @st_transport_data.eco_cost = eco_cost.value
    else
      eco_cost = StExcelValue.find_by_local_name_and_category(@st_transport_data.st_transport.name + ",", "Transport")
      if eco_cost
       @st_transport_data.eco_cost = eco_cost.value     
      end
    end

    if @st_transport_data.st_transport.unit == 'Liter'
       if @st_transport_data.eco_cost
          @st_transport_data.eco_cost = @st_transport_data.eco_cost / 1000
       end   
    end

    respond_to do |format|
      if @st_transport_data.save
        format.js  { render :action => "create_st_transport_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @st_transport_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /st_transport_datas/1
  # PUT /st_transport_datas/1.xml
  def update
    @st_transport_data = StTransportData.find(params[:id])

    respond_to do |format|
      if @st_transport_data.update_attributes(params[:st_transport_data])
        format.html { redirect_to(@st_transport_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @st_transport_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /st_transport_datas/1
  # DELETE /st_transport_datas/1.xml
  def destroy
    @st_transport_data = StTransportData.find(params[:id])
    @st_transport_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_st_transport_data" }
    end
  end
end  
