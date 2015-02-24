class MtEndOfLifeDatasController < ApplicationController
  # GET /mt_end_of_life_datas
  # GET /mt_end_of_life_datas.xml
  def index
    @mt_end_of_life_datas = MtEndOfLifeData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mt_end_of_life_datas }
    end
  end

  # GET /mt_end_of_life_datas/1
  # GET /mt_end_of_life_datas/1.xml
  def show
    @mt_end_of_life_data = MtEndOfLifeData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mt_end_of_life_data }
    end
  end

  # GET /mt_end_of_life_datas/new
  # GET /mt_end_of_life_datas/new.xml
  def new
    @mt_end_of_life_data = MtEndOfLifeData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mt_end_of_life_data }
    end
  end

  # GET /mt_end_of_life_datas/1/edit
  def edit
    @mt_end_of_life_data = MtEndOfLifeData.find(params[:id])
  end

  # POST /mt_end_of_life_datas
  # POST /mt_end_of_life_datas.xml
  def create
    @mt_end_of_life_data = MtEndOfLifeData.new(params[:mt_end_of_life_data])

    respond_to do |format|
      if @mt_end_of_life_data.save
        format.html { redirect_to(@mt_end_of_life_data) }
        format.xml  { render :xml => @mt_end_of_life_data, :status => :created, :location => @mt_end_of_life_data }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mt_end_of_life_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mt_end_of_life_datas/1
  # PUT /mt_end_of_life_datas/1.xml
  def update
    @mt_end_of_life_data = MtEndOfLifeData.find(params[:id])

    respond_to do |format|
      if @mt_end_of_life_data.update_attributes(params[:mt_end_of_life_data])
        format.html { redirect_to(@mt_end_of_life_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mt_end_of_life_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mt_end_of_life_datas/1
  # DELETE /mt_end_of_life_datas/1.xml
  def destroy
    @mt_end_of_life_data = MtEndOfLifeData.find(params[:id])
    @mt_end_of_life_data.destroy

    respond_to do |format|
      format.html { redirect_to(mt_end_of_life_datas_url) }
      format.xml  { head :ok }
    end
  end
end
