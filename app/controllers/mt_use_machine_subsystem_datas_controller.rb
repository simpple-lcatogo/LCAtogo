class MtUseMachineSubsystemDatasController < ApplicationController
  # GET /mt_supplier_datas
  # GET /mt_supplier_datas.xml
  def index
    @mt_use_machine_subsystem_datas = MtUseMachineSubsystemData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mt_use_machine_subsystem_datas }
    end
  end

  # GET /mt_use_machine_subsystem_datas/1
  # GET /mt_use_machine_subsystem_datas/1.xml
  def show
    @mt_use_machine_subsystem_data = MtUseMachineSubsystemData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mt_use_machine_subsystem_data }
    end
  end

  # GET /mt_use_machine_subsystem_datas/new
  # GET /mt_use_machine_subsystem_datas/new.xml
  def new
    @mt_use_machine_subsystem_data = MtUseMachineSubsystemData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mt_use_machine_subsystem_data }
    end
  end

  # GET /mt_use_machine_subsystem_datas/1/edit
  def edit
    @mt_use_machine_subsystem_data = MtUseMachineSubsystemData.find(params[:id])
  end

  # POST /mt_use_machine_subsystem_datas
  # POST /mt_use_machine_subsystem_datas.xml
  def create
    @mt_use_machine_subsystem_data = MtUseMachineSubsystemData.new(params[:mt_use_machine_subsystem_data])
    
    respond_to do |format|
      if @mt_use_machine_subsystem_data.save
        format.js  { render :action => "create_mt_use_machine_subsystem_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mt_use_machine_subsystem_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mt_use_machine_subsystem_datas/1
  # PUT /mt_use_machine_subsystem_datas/1.xml
  def update
    @mt_use_machine_subsystem_data = MtUseMachineSubsystemData.find(params[:id])

    respond_to do |format|
      if @mt_use_machine_subsystem_data.update_attributes(params[:mt_use_machine_subsystem_data])
        format.html { redirect_to(@mt_use_machine_subsystem_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mt_use_machine_subsystem_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mt_use_machine_subsystem_datas/1
  # DELETE /mt_use_machine_subsystem_datas/1.xml
  def destroy
    @mt_use_machine_subsystem_data = MtUseMachineSubsystemData.find(params[:id])
    @mt_use_machine_subsystem_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_mt_use_machine_subsystem_data" }
    end
  end
  
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end
  
  def update_processing
      value = params[:update_value]
      if is_a_number?value
         mt_use_machine_subsystem_data_id = params[:mt_use_machine_subsystem_data_id]
         @mt_use_machine_subsystem_data = MtUseMachineSubsystemData.find(mt_use_machine_subsystem_data_id)
         @mt_use_machine_subsystem_data.processing = value
         @mt_use_machine_subsystem_data.save
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
  
  def update_ready
      value = params[:update_value]
      if is_a_number?value
         mt_use_machine_subsystem_data_id = params[:mt_use_machine_subsystem_data_id]
         @mt_use_machine_subsystem_data = MtUseMachineSubsystemData.find(mt_use_machine_subsystem_data_id)
         @mt_use_machine_subsystem_data.ready = value
         @mt_use_machine_subsystem_data.save
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

  def update_standby
      value = params[:update_value]
      if is_a_number?value
         mt_use_machine_subsystem_data_id = params[:mt_use_machine_subsystem_data_id]
         @mt_use_machine_subsystem_data = MtUseMachineSubsystemData.find(mt_use_machine_subsystem_data_id)
         @mt_use_machine_subsystem_data.standby = value
         @mt_use_machine_subsystem_data.save
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
