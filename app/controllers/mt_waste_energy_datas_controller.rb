class MtWasteEnergyDatasController < ApplicationController
  # GET /mt_energy_datas
  # GET /mt_energy_datas.xml
  def index
    @mt_waste_energy_datas = MtWasteEnergyData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mt_waste_energy_datas }
    end
  end

  # GET /mt_waste_energy_datas/1
  # GET /mt_waste_energy_datas/1.xml
  def show
    @mt_waste_energy_data = MtWasteEnergyData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mt_waste_energy_data }
    end
  end

  # GET /mt_waste_energy_datas/new
  # GET /mt_waste_energy_datas/new.xml
  def new
    @mt_waste_energy_data = MtWasteEnergyData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mt_waste_energy_data }
    end
  end

  # GET /mt_waste_energy_datas/1/edit
  def edit
    @mt_waste_energy_data = MtWasteEnergyData.find(params[:id])
  end

  # POST /mt_waste_energy_datas
  # POST /mt_waste_energy_datas.xml
  def create
    @mt_waste_energy_data = MtWasteEnergyData.new(params[:mt_waste_energy_data])
    
    respond_to do |format|
      if @mt_waste_energy_data.save
        format.js  { render :action => "create_mt_waste_energy_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mt_waste_energy_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mt_waste_energy_datas/1
  # PUT /mt_waste_energy_datas/1.xml
  def update
    @mt_waste_energy_data = MtWasteEnergyData.find(params[:id])

    respond_to do |format|
      if @mt_waste_energy_data.update_attributes(params[:mt_waste_energy_data])
        format.html { redirect_to(@mt_waste_energy_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mt_waste_energy_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mt_waste_energy_datas/1
  # DELETE /mt_waste_energy_datas/1.xml
  def destroy
    @mt_waste_energy_data = MtWasteEnergyData.find(params[:id])
    @mt_waste_energy_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_mt_waste_energy_data" }
    end
  end
  
  
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end
  
  def update_values
      value = params[:update_value]
      if is_a_number?value
         mt_waste_energy_data_id = params[:mt_waste_energy_data_id]
         @mt_waste_energy_data = MtWasteEnergyData.find(mt_waste_energy_data_id)
         @mt_waste_energy_data.quantity = value
         @mt_waste_energy_data.save
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
