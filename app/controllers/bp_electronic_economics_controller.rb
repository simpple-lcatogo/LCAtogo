class BpElectronicEconomicsController < ApplicationController
  # GET /bp_electronic_economics
  # GET /bp_electronic_economics.xml
  def index
    @bp_electronic_economics = BpElectronicEconomic.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bp_electronic_economics }
    end
  end

  # GET /bp_electronic_economics/1
  # GET /bp_electronic_economics/1.xml
  def show
    @bp_electronic_economic = BpElectronicEconomic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bp_electronic_economic }
    end
  end

  # GET /bp_electronic_economics/new
  # GET /bp_electronic_economics/new.xml
  def new
    @bp_electronic_economic = BpElectronicEconomic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bp_electronic_economic }
    end
  end

  # GET /bp_electronic_economics/1/edit
  def edit
    @bp_electronic_economic = BpElectronicEconomic.find(params[:id])
  end

  # POST /bp_electronic_economics
  # POST /bp_electronic_economics.xml
  def create
    @bp_electronic_economic = BpElectronicEconomic.new(params[:bp_electronic_economic])
    @bp_economic = BpEconomic.find(params[:bp_economic_id])
    @bp_electronic_economic.bp_economic = @bp_economic

    respond_to do |format|
      if @bp_electronic_economic.save
        format.js  { render :action => "create_economic" }
      end
    end
  end

  # PUT /bp_electronic_economics/1
  # PUT /bp_electronic_economics/1.xml
  def update
    @bp_electronic_economic = BpElectronicEconomic.find(params[:id])

    respond_to do |format|
      if @bp_electronic_economic.update_attributes(params[:bp_electronic_economic])
        format.html { redirect_to(@bp_electronic_economic, :notice => 'Bp electronic economic was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bp_electronic_economic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bp_electronic_economics/1
  # DELETE /bp_electronic_economics/1.xml
  def destroy
    @bp_electronic_economic = BpElectronicEconomic.find(params[:id])
    @bp_electronic_economic.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_economic" }
    end
  end
end
