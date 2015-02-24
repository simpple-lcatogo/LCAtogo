class PcTransportDatasController < ApplicationController
 # GET /pc_transport_datas
  # GET /pc_transport_datas.xml
  def index
    @pc_transport_datas = PcTransportData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pc_transport_datas }
    end
  end

  # GET /pc_transport_datas/1
  # GET /pc_transport_datas/1.xml
  def show
    @pc_transport_data = PcTransportData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pc_transport_data }
    end
  end

  # GET /pc_transport_datas/new
  # GET /pc_transport_datas/new.xml
  def new
    @pc_transport_data = PcTransportData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pc_transport_data }
    end
  end

  # GET /pc_transport_datas/1/edit
  def edit
    @pc_transport_data = PcTransportData.find(params[:id])
  end

  # POST /pc_transport_datas
  # POST /pc_transport_datas.xml
  def create
    params[:pc_transport_data][:distance] = params[:pc_transport_data][:distance].gsub(",", ".").to_f    
    @pc_transport_data = PcTransportData.new(params[:pc_transport_data])
    respond_to do |format|
      if @pc_transport_data.save
        format.js  { render :action => "create_pc_transport_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pc_transport_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pc_transport_datas/1
  # PUT /pc_transport_datas/1.xml
  def update
    @pc_transport_data = PcTransportData.find(params[:id])

    respond_to do |format|
      if @pc_transport_data.update_attributes(params[:pc_transport_data])
        format.html { redirect_to(@pc_transport_data, :notice => 'Se recycling data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pc_transport_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pc_transport_datas/1
  # DELETE /pc_transport_datas/1.xml
  def destroy
    @pc_transport_data = PcTransportData.find(params[:id])
    @pc_transport_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_pc_transport_data" }
    end
  end
end
