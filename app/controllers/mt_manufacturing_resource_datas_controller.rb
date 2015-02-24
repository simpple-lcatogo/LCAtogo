class MtManufacturingResourceDatasController < ApplicationController
  # GET /mt_supplier_datas
  # GET /mt_supplier_datas.xml
  def index
    @mt_manufacturing_resource_datas = MtManufacturingResourceData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mt_manufacturing_resource_datas }
    end
  end

  # GET /mt_manufacturing_resource_datas/1
  # GET /mt_manufacturing_resource_datas/1.xml
  def show
    @mt_manufacturing_resource_data = MtManufacturingResourceData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mt_manufacturing_resource_data }
    end
  end

  # GET /mt_manufacturing_resource_datas/new
  # GET /mt_manufacturing_resource_datas/new.xml
  def new
    @mt_manufacturing_resource_data = MtManufacturingResourceData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mt_manufacturing_resource_data }
    end
  end

  # GET /mt_manufacturing_resource_datas/1/edit
  def edit
    @mt_manufacturing_resource_data = MtManufacturingResourceData.find(params[:id])
  end

  # POST /mt_manufacturing_resource_datas
  # POST /mt_manufacturing_resource_datas.xml
  def create
    @mt_manufacturing_resource_data = MtManufacturingResourceData.new(params[:mt_manufacturing_resource_data])
    
    respond_to do |format|
      if @mt_manufacturing_resource_data.save
        format.js  { render :action => "create_mt_manufacturing_resource_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mt_manufacturing_resource_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mt_manufacturing_resource_datas/1
  # PUT /mt_manufacturing_resource_datas/1.xml
  def update
    @mt_manufacturing_resource_data = MtManufacturingResourceData.find(params[:id])

    respond_to do |format|
      if @mt_manufacturing_resource_data.update_attributes(params[:mt_manufacturing_resource_data])
        format.html { redirect_to(@mt_manufacturing_resource_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mt_manufacturing_resource_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mt_manufacturing_resource_datas/1
  # DELETE /mt_manufacturing_resource_datas/1.xml
  def destroy
    @mt_manufacturing_resource_data = MtManufacturingResourceData.find(params[:id])
    @mt_manufacturing_resource_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_mt_manufacturing_resource_data" }
    end
  end
  
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end
  
  def update_values
      value = params[:update_value]
      if is_a_number?value
         mt_manufacturing_resource_data_id = params[:mt_manufacturing_resource_data_id]
         @mt_manufacturing_resource_data = MtManufacturingMainData.find(mt_manufacturing_resource_data_id)
         @mt_manufacturing_resource_data.quantity = value
         @mt_manufacturing_resource_data.save
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
