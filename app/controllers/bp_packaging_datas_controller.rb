class BpPackagingDatasController < ApplicationController
  # GET /bp_packaging_datas
  # GET /bp_packaging_datas.xml
  def index
    @bp_packaging_datas = BpPackagingData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bp_packaging_datas }
    end
  end

  # GET /bp_packaging_datas/1
  # GET /bp_packaging_datas/1.xml
  def show
    @bp_packaging_data = BpPackagingData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bp_packaging_data }
    end
  end

  # GET /bp_packaging_datas/new
  # GET /bp_packaging_datas/new.xml
  def new
    @bp_packaging_data = BpPackagingData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bp_packaging_data }
    end
  end

  # GET /bp_packaging_datas/1/edit
  def edit
    @bp_packaging_data = BpPackagingData.find(params[:id])
  end

  # POST /bp_packaging_datas
  # POST /bp_packaging_datas.xml
  def create
    @bp_packaging_data = BpPackagingData.new(params[:bp_packaging_data])
    @bp_packaging_data.amount = params[:bp_packaging_data][:amount].gsub(",", ".").to_f

    respond_to do |format|
      if @bp_packaging_data.save
        format.js  { render :action => "create_bp_packaging_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bp_packaging_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bp_packaging_datas/1
  # PUT /bp_packaging_datas/1.xml
  def update
    @bp_packaging_data = BpPackagingData.find(params[:id])

    respond_to do |format|
      if @bp_packaging_data.update_attributes(params[:bp_packaging_data])
        format.html { redirect_to(@bp_packaging_data, :notice => 'Bp packaging data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bp_packaging_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bp_packaging_datas/1
  # DELETE /bp_packaging_datas/1.xml
  def destroy
    @bp_packaging_data = BpPackagingData.find(params[:id])
    @bp_packaging_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_bp_packaging_data" }
    end
  end
end
