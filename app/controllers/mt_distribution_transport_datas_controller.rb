class MtDistributionTransportDatasController < ApplicationController
  # GET /mt_supplier_datas
  # GET /mt_supplier_datas.xml
  def index
    @mt_distribution_transport_datas = MtDistributionTransportData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mt_distribution_transport_datas }
    end
  end

  # GET /mt_distribution_transport_datas/1
  # GET /mt_distribution_transport_datas/1.xml
  def show
    @mt_distribution_transport_data = MtDistributionTransportData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mt_distribution_transport_data }
    end
  end

  # GET /mt_distribution_transport_datas/new
  # GET /mt_distribution_transport_datas/new.xml
  def new
    @mt_distribution_transport_data = MtDistributionTransportData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mt_distribution_transport_data }
    end
  end

  # GET /mt_distribution_transport_datas/1/edit
  def edit
    @mt_distribution_transport_data = MtDistributionTransportData.find(params[:id])
  end

  # POST /mt_distribution_transport_datas
  # POST /mt_distribution_transport_datas.xml
  def create
    @mt_distribution_transport_data = MtDistributionTransportData.new(params[:mt_distribution_transport_data])
    
    respond_to do |format|
      if @mt_distribution_transport_data.save
        format.js  { render :action => "create_mt_distribution_transport_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mt_distribution_transport_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mt_distribution_transport_datas/1
  # PUT /mt_distribution_transport_datas/1.xml
  def update
    @mt_distribution_transport_data = MtDistributionTransportData.find(params[:id])

    respond_to do |format|
      if @mt_distribution_transport_data.update_attributes(params[:mt_distribution_transport_data])
        format.html { redirect_to(@mt_distribution_transport_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mt_distribution_transport_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mt_distribution_transport_datas/1
  # DELETE /mt_distribution_transport_datas/1.xml
  def destroy
    @mt_distribution_transport_data = MtDistributionTransportData.find(params[:id])
    @mt_distribution_transport_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_mt_distribution_transport_data" }
    end
  end
  
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end
  
  def update_distance
      value = params[:update_value]
      if is_a_number?value
         mt_distribution_transport_data_id = params[:mt_distribution_transport_data_id]
         @mt_distribution_transport_data = MtDistributionTransportData.find(mt_distribution_transport_data_id)
         @mt_distribution_transport_data.distance = value
         @mt_distribution_transport_data.save
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
