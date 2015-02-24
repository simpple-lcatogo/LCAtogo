class BpManufacturingTransportDatasController < ApplicationController
  # GET /bp_manufacturing_transport_datas
  # GET /bp_manufacturing_transport_datas.xml
  def index
    @bp_manufacturing_transport_datas = BpManufacturingTransportData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bp_manufacturing_transport_datas }
    end
  end

  # GET /bp_manufacturing_transport_datas/1
  # GET /bp_manufacturing_transport_datas/1.xml
  def show
    @bp_manufacturing_transport_data = BpManufacturingTransportData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bp_manufacturing_transport_data }
    end
  end

  # GET /bp_manufacturing_transport_datas/new
  # GET /bp_manufacturing_transport_datas/new.xml
  def new
    @bp_manufacturing_transport_data = BpManufacturingTransportData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bp_manufacturing_transport_data }
    end
  end

  # GET /bp_manufacturing_transport_datas/1/edit
  def edit
    @bp_manufacturing_transport_data = BpManufacturingTransportData.find(params[:id])
  end

  # POST /bp_manufacturing_transport_datas
  # POST /bp_manufacturing_transport_datas.xml
  def create
    @bp_manufacturing_transport_data = BpManufacturingTransportData.new(params[:bp_manufacturing_transport_data])
    @bp_manufacturing_transport_data.distance = params[:bp_manufacturing_transport_data][:distance].gsub(",", ".").to_f
    @bp_manufacturing_transport_data.amount = params[:bp_manufacturing_transport_data][:amount].gsub(",", ".").to_f    

    respond_to do |format|
      if @bp_manufacturing_transport_data.save
        format.js  { render :action => "create_bp_manufacturing_transport" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bp_manufacturing_transport_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bp_manufacturing_transport_datas/1
  # PUT /bp_manufacturing_transport_datas/1.xml
  def update
    @bp_manufacturing_transport_data = BpManufacturingTransportData.find(params[:id])

    respond_to do |format|
      if @bp_manufacturing_transport_data.update_attributes(params[:bp_manufacturing_transport_data])
        format.html { redirect_to(@bp_manufacturing_transport_data, :notice => 'Bp manufacturing transport data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bp_manufacturing_transport_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bp_manufacturing_transport_datas/1
  # DELETE /bp_manufacturing_transport_datas/1.xml
  def destroy
    @bp_manufacturing_transport_data = BpManufacturingTransportData.find(params[:id])
    @bp_manufacturing_transport_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_bp_manufacturing_transport" }
    end
  end


  def update_values
     update_value = params[:update_value]
     @bp_manufacturing_transport_data = BpManufacturingTransportData.find(params[:bp_manufacturing_transport_id])
     if params[:field] != 'comment'
        update_value = update_value.gsub(",", ".")
     end
    if params[:field] == 'amount'
      @bp_manufacturing_transport_data.amount = update_value
    elsif params[:field] == 'distance'
      @bp_manufacturing_transport_data.distance = update_value
    elsif params[:field] == 'comment'
      @bp_manufacturing_transport_data.comment = update_value
    end

     if @bp_manufacturing_transport_data.save
        respond_to do |format|
          format.html {render :inline => update_value}
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
