class BpManufacturingDatasController < ApplicationController
  include ApplicationHelper    
  # GET /bp_manufacturing_datas
  # GET /bp_manufacturing_datas.xml
  def index
    @bp_manufacturing_datas = BpManufacturingData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bp_manufacturing_datas }
    end
  end

  # GET /bp_manufacturing_datas/1
  # GET /bp_manufacturing_datas/1.xml
  def show
    @bp_manufacturing_data = BpManufacturingData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bp_manufacturing_data }
    end
  end

  # GET /bp_manufacturing_datas/new
  # GET /bp_manufacturing_datas/new.xml
  def new
    @bp_manufacturing_data = BpManufacturingData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bp_manufacturing_data }
    end
  end

  # GET /bp_manufacturing_datas/1/edit
  def edit
    @bp_manufacturing_data = BpManufacturingData.find(params[:id])
  end

  # POST /bp_manufacturing_datas
  # POST /bp_manufacturing_datas.xml
  def create
    @bp_manufacturing_data = BpManufacturingData.new(params[:bp_manufacturing_data])
    @bp_manufacturing_data.quantity = params[:bp_manufacturing_data][:quantity].gsub(",", ".").to_f
    
    
    @bp_manufacturing_process_variables = BpManufacturingProcess.find(params[:bp_manufacturing_data][:bp_manufacturing_process_id]).bp_manufacturing_process_variables

    @bp_manufacturing_process_variable_values = BpManufacturingProcessVariableValue.all

    respond_to do |format|
      if @bp_manufacturing_data.save
        format.js  { render :action => "create_bp_manufacturing_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bp_manufacturing_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bp_manufacturing_datas/1
  # PUT /bp_manufacturing_datas/1.xml
  def update
    @bp_manufacturing_data = BpManufacturingData.find(params[:id])

    respond_to do |format|
      if @bp_manufacturing_data.update_attributes(params[:bp_manufacturing_data])
        format.html { redirect_to(@bp_manufacturing_data, :notice => 'Bp manufacturing data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bp_manufacturing_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bp_manufacturing_datas/1
  # DELETE /bp_manufacturing_datas/1.xml
  def destroy
    @bp_manufacturing_data = BpManufacturingData.find(params[:id])
    @bp_manufacturing_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_bp_manufacturing_data" }
      #format.html { redirect_to(bp_manufacturing_datas_url) }
      #format.xml  { head :ok }
    end
  end

  def update_values
     update_value = params[:update_value]
     @bp_manufacturing_data = BpManufacturingData.find(params[:bp_manufacturing_data_id])
     @bp_manufacturing_process_variable_drying = BpManufacturingProcessVariable.find_by_name("Electricity consumption")
    
     if params[:field] == 'quantity'
        @bp_manufacturing_data.quantity = update_value
     elsif params[:field] == 'comment'
        @bp_manufacturing_data.comment = update_value
     end

     is_pellets = false

     if @bp_manufacturing_data.save
        if params[:field] == 'quantity'
          if @bp_manufacturing_data.bp_manufacturing_process && @bp_manufacturing_data.bp_manufacturing_process.name == 'Drying of pellets'
             @pellets_value_default = calculate_default_pellets @bp_manufacturing_data, true
             @pellets_value_user = calculate_default_pellets @bp_manufacturing_data, false             
             @update_value = update_value
             is_pellets = true
          end
        end 
        respond_to do |format|
          if is_pellets
            format.js  { render :action => "update_value" }
          else
            format.html {render :inline => update_value}
          end
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
