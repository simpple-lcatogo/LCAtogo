class BpFinishingDatasController < ApplicationController
  # GET /bp_manufacturing_datas
  # GET /bp_manufacturing_datas.xml
  def index
    @bp_finishing_datas = BpFinishingData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bp_finishing_datas }
    end
  end

  # GET /bp_manufacturing_datas/1
  # GET /bp_manufacturing_datas/1.xml
  def show
    @bp_finishing_data = BpFinishingData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bp_finishing_data }
    end
  end

  # GET /bp_manufacturing_datas/new
  # GET /bp_manufacturing_datas/new.xml
  def new
    @bp_finishing_data = BpFinishingData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bp_finishing_data }
    end
  end

  # GET /bp_manufacturing_datas/1/edit
  def edit
    @bp_finishing_data = BpFinishingData.find(params[:id])
  end

  # POST /bp_manufacturing_datas
  # POST /bp_manufacturing_datas.xml
  def create
    @bp_finishing_data = BpFinishingData.new(params[:bp_finishing_data])
    @bp_finishing_data.quantity = params[:bp_finishing_data][:quantity].gsub(",", ".").to_f
    
    @bp_manufacturing_process_variables = BpManufacturingProcess.find(params[:bp_finishing_data][:bp_manufacturing_process_id]).bp_manufacturing_process_variables

    @bp_manufacturing_process_variable_values = BpManufacturingProcessVariableValue.all

    respond_to do |format|
      if @bp_finishing_data.save
        format.js  { render :action => "create_bp_finishing_data" }
        #format.html { redirect_to(@bp_manufacturing_data, :notice => 'Bp manufacturing data was successfully created.') }
        #format.xml  { render :xml => @bp_manufacturing_data, :status => :created, :location => @bp_manufacturing_data }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bp_finishing_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bp_manufacturing_datas/1
  # PUT /bp_manufacturing_datas/1.xml
  def update
    @bp_finishing_data = BpFinishingData.find(params[:id])

    respond_to do |format|
      if @bp_finishing_data.update_attributes(params[:bp_finishing_data])
        format.html { redirect_to(@bp_finishing_data, :notice => 'Bp manufacturing data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bp_finishing_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bp_manufacturing_datas/1
  # DELETE /bp_manufacturing_datas/1.xml
  def destroy
    @bp_finishing_data = BpFinishingData.find(params[:id])
    @bp_finishing_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_bp_finishing_data" }
      #format.html { redirect_to(bp_manufacturing_datas_url) }
      #format.xml  { head :ok }
    end
  end

  def update_values
     update_value = params[:update_value]
     @bp_finishing_data = BpFinishingData.find(params[:bp_finishing_data_id])

     if params[:field] == 'quantity'
        @bp_finishing_data.quantity = update_value
     elsif params[:field] == 'comment'
        @bp_finishing_data.comment = update_value
     end

     if @bp_finishing_data.save
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
