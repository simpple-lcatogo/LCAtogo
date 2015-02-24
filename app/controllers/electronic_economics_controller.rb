class ElectronicEconomicsController < ApplicationController
  # GET /electronic_economics
  # GET /electronic_economics.xml
  def index
    @electronic_economics = ElectronicEconomic.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @electronic_economics }
    end
  end

  # GET /electronic_economics/1
  # GET /electronic_economics/1.xml
  def show
    @electronic_economic = ElectronicEconomic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @electronic_economic }
    end
  end

  # GET /electronic_economics/new
  # GET /electronic_economics/new.xml
  def new
    @electronic_economic = ElectronicEconomic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @electronic_economic }
    end
  end

  # GET /electronic_economics/1/edit
  def edit
    @electronic_economic = ElectronicEconomic.find(params[:id])
  end

  # POST /electronic_economics
  # POST /electronic_economics.xml
  def create
    @electronic_economic = ElectronicEconomic.new(params[:electronic_economic])
    @electronic_economic.unit = params[:unitHidden]
    @economic = Economic.find(params[:economic_id])
    @electronic_economic.economic = @economic

    respond_to do |format|
      if @electronic_economic.save
        format.js  { render :action => "create_economic" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @electronic_economic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /electronic_economics/1
  # PUT /electronic_economics/1.xml
  def update
    @electronic_economic = ElectronicEconomic.find(params[:id])

    respond_to do |format|
      if @electronic_economic.update_attributes(params[:electronic_economic])
        format.html { redirect_to(@electronic_economic, :notice => 'Electronic economic was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @electronic_economic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /electronic_economics/1
  # DELETE /electronic_economics/1.xml
  def destroy
    @electronic_economic = ElectronicEconomic.find(params[:id])
    @electronic_economic.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_economic" }
    end
  end
end
