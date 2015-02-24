class SeRecyclingDatasController < ApplicationController
  # GET /se_recycling_datas
  # GET /se_recycling_datas.xml
  def index
    @se_recycling_datas = SeRecyclingData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @se_recycling_datas }
    end
  end

  # GET /se_recycling_datas/1
  # GET /se_recycling_datas/1.xml
  def show
    @se_recycling_data = SeRecyclingData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @se_recycling_data }
    end
  end

  # GET /se_recycling_datas/new
  # GET /se_recycling_datas/new.xml
  def new
    @se_recycling_data = SeRecyclingData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @se_recycling_data }
    end
  end

  # GET /se_recycling_datas/1/edit
  def edit
    @se_recycling_data = SeRecyclingData.find(params[:id])
  end

  # POST /se_recycling_datas
  # POST /se_recycling_datas.xml
  def create
    @se_recycling_data = SeRecyclingData.new(params[:se_recycling_data])

    respond_to do |format|
      if @se_recycling_data.save
        format.js  { render :action => "create_se_recycling_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @se_recycling_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /se_recycling_datas/1
  # PUT /se_recycling_datas/1.xml
  def update
    @se_recycling_data = SeRecyclingData.find(params[:id])

    respond_to do |format|
      if @se_recycling_data.update_attributes(params[:se_recycling_data])
        format.html { redirect_to(@se_recycling_data, :notice => 'Se recycling data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @se_recycling_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /se_recycling_datas/1
  # DELETE /se_recycling_datas/1.xml
  def destroy
    @se_recycling_data = SeRecyclingData.find(params[:id])
    @se_recycling_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_se_recycling_data" }
    end
  end
end
