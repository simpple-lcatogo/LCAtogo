class StEndOfLifeDatasController < ApplicationController
  # GET /st_end_of_life_datas
  # GET /st_end_of_life_datas.xml
  def index
    @st_end_of_life_datas = StEndOfLifeData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @st_end_of_life_datas }
    end
  end

  # GET /st_end_of_life_datas/1
  # GET /st_end_of_life_datas/1.xml
  def show
    @st_end_of_life_data = StEndOfLifeData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @st_end_of_life_data }
    end
  end

  # GET /st_end_of_life_datas/new
  # GET /st_end_of_life_datas/new.xml
  def new
    @st_end_of_life_data = StEndOfLifeData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @st_end_of_life_data }
    end
  end

  # GET /st_end_of_life_datas/1/edit
  def edit
    @st_end_of_life_data = StEndOfLifeData.find(params[:id])
  end

  # POST /st_end_of_life_datas
  # POST /st_end_of_life_datas.xml
  def create
    @st_end_of_life_data = StEndOfLifeData.new(params[:st_end_of_life_data])

    respond_to do |format|
      if @st_end_of_life_data.save
        format.html { redirect_to(@st_end_of_life_data) }
        format.xml  { render :xml => @st_end_of_life_data, :status => :created, :location => @st_end_of_life_data }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @st_end_of_life_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /st_end_of_life_datas/1
  # PUT /st_end_of_life_datas/1.xml
  def update
    @st_end_of_life_data = StEndOfLifeData.find(params[:id])

    respond_to do |format|
      if @st_end_of_life_data.update_attributes(params[:st_end_of_life_data])
        format.html { redirect_to(@st_end_of_life_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @st_end_of_life_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /st_end_of_life_datas/1
  # DELETE /st_end_of_life_datas/1.xml
  def destroy
    @st_end_of_life_data = StEndOfLifeData.find(params[:id])
    @st_end_of_life_data.destroy

    respond_to do |format|
      format.html { redirect_to(st_end_of_life_datas_url) }
      format.xml  { head :ok }
    end
  end
end
