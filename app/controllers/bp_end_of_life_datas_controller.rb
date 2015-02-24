class BpEndOfLifeDatasController < ApplicationController
  # GET /bp_end_of_life_datas
  # GET /bp_end_of_life_datas.xml
  def index
    @bp_end_of_life_datas = BpEndOfLifeData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bp_end_of_life_datas }
    end
  end

  # GET /bp_end_of_life_datas/1
  # GET /bp_end_of_life_datas/1.xml
  def show
    @bp_end_of_life_data = BpEndOfLifeData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bp_end_of_life_data }
    end
  end

  # GET /bp_end_of_life_datas/new
  # GET /bp_end_of_life_datas/new.xml
  def new
    @bp_end_of_life_data = BpEndOfLifeData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bp_end_of_life_data }
    end
  end

  # GET /bp_end_of_life_datas/1/edit
  def edit
    @bp_end_of_life_data = BpEndOfLifeData.find(params[:id])
  end

  # POST /bp_end_of_life_datas
  # POST /bp_end_of_life_datas.xml
  def create
    @bp_end_of_life_data = BpEndOfLifeData.new(params[:bp_end_of_life_data])
    @bp_end_of_life_data.custom_transport_distance = params[:bp_end_of_life_data][:custom_transport_distance].gsub(",", ".").to_f
    respond_to do |format|
      if @bp_end_of_life_data.save
        format.html { redirect_to bp_indicator_url(@bp_end_of_life_data.bp_product)}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bp_end_of_life_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bp_end_of_life_datas/1
  # PUT /bp_end_of_life_datas/1.xml
  def update
    @bp_end_of_life_data = BpEndOfLifeData.find(params[:id])
    params[:bp_end_of_life_data][:custom_transport_distance] = params[:bp_end_of_life_data][:custom_transport_distance].gsub(",", ".").to_f
    params[:bp_end_of_life_data][:custom_landfill] = params[:bp_end_of_life_data][:custom_landfill].gsub(",", ".").to_f    
    params[:bp_end_of_life_data][:custom_incineration] = params[:bp_end_of_life_data][:custom_incineration].gsub(",", ".").to_f
    params[:bp_end_of_life_data][:custom_composting] = params[:bp_end_of_life_data][:custom_composting].gsub(",", ".").to_f
    params[:bp_end_of_life_data][:custom_recycling] = params[:bp_end_of_life_data][:custom_recycling].gsub(",", ".").to_f    
    
    respond_to do |format|
      if @bp_end_of_life_data.update_attributes(params[:bp_end_of_life_data])
        if params[:bp_end_of_life_data][:custom_transport_distance] == 0.0
           @bp_end_of_life_data.custom_transport_distance = nil
           @bp_end_of_life_data.save
        end
        format.html { redirect_to bp_indicator_url(@bp_end_of_life_data.bp_product)}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bp_end_of_life_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bp_end_of_life_datas/1
  # DELETE /bp_end_of_life_datas/1.xml
  def destroy
    @bp_end_of_life_data = BpEndOfLifeData.find(params[:id])
    @bp_end_of_life_data.destroy

    respond_to do |format|
      format.html { redirect_to(bp_end_of_life_datas_url) }
      format.xml  { head :ok }
    end
  end
end
