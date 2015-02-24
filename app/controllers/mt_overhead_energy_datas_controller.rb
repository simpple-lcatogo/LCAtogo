class MtOverheadEnergyDatasController < ApplicationController
  # GET /mt_energy_datas
  # GET /mt_energy_datas.xml
  def index
    @mt_overhead_energy_datas = MtOverheadEnergyData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mt_overhead_energy_datas }
    end
  end

  # GET /mt_overhead_energy_datas/1
  # GET /mt_overhead_energy_datas/1.xml
  def show
    @mt_overhead_energy_data = MtOverheadEnergyData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mt_overhead_energy_data }
    end
  end

  # GET /mt_overhead_energy_datas/new
  # GET /mt_overhead_energy_datas/new.xml
  def new
    @mt_overhead_energy_data = MtOverheadEnergyData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mt_overhead_energy_data }
    end
  end

  # GET /mt_overhead_energy_datas/1/edit
  def edit
    @mt_overhead_energy_data = MtOverheadEnergyData.find(params[:id])
  end

  # POST /mt_overhead_energy_datas
  # POST /mt_overhead_energy_datas.xml
  def create
    @mt_overhead_energy_data = MtOverheadEnergyData.new(params[:mt_overhead_energy_data])
    
    respond_to do |format|
      if @mt_overhead_energy_data.save
        format.js  { render :action => "create_mt_overhead_energy_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mt_overhead_energy_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mt_overhead_energy_datas/1
  # PUT /mt_overhead_energy_datas/1.xml
  def update
    @mt_overhead_energy_data = MtOverheadEnergyData.find(params[:id])

    respond_to do |format|
      if @mt_overhead_energy_data.update_attributes(params[:mt_overhead_energy_data])
        format.html { redirect_to(@mt_overhead_energy_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mt_overhead_energy_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mt_overhead_energy_datas/1
  # DELETE /mt_overhead_energy_datas/1.xml
  def destroy
    @mt_overhead_energy_data = MtOverheadEnergyData.find(params[:id])
    @mt_overhead_energy_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_mt_overhead_energy_data" }
    end
  end
  
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end
  
  def update_values
      value = params[:update_value]
      if is_a_number?value
         mt_overhead_energy_data_id = params[:mt_overhead_energy_data_id]
         @mt_overhead_energy_data = MtOverheadEnergyData.find(mt_overhead_energy_data_id)
         @mt_overhead_energy_data.quantity = value
         @mt_overhead_energy_data.save
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
