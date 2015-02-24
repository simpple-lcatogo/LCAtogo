class StProcessDatasController < ApplicationController
  # GET /st_process_datas
  # GET /st_process_datas.xml
  def index
    @st_process_datas = StProcessData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @st_process_datas }
    end
  end

  # GET /st_process_datas/1
  # GET /st_process_datas/1.xml
  def show
    @st_process_data = StProcessData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @st_process_data }
    end
  end

  # GET /st_process_datas/new
  # GET /st_process_datas/new.xml
  def new
    @st_process_data = StProcessData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @st_process_data }
    end
  end

  # GET /st_process_datas/1/edit
  def edit
    @st_process_data = StProcessData.find(params[:id])
  end

  # POST /st_process_datas
  # POST /st_process_datas.xml
  def create
    @st_process_data = StProcessData.new(params[:st_process_data])
    if @st_process_data.st_process
        eco_cost = StExcelValue.find_by_local_name_and_category(@st_process_data.st_process.name, "Manufacturing")
        if eco_cost
           @st_process_data.eco_cost = eco_cost.value
        else
          eco_cost = StExcelValue.find_by_local_name_and_category(@st_process_data.st_process.name + ",", "Manufacturing")
          if eco_cost
           @st_process_data.eco_cost = eco_cost.value     
          end
        end
    else
      @st_process_data.eco_cost = @st_process_data.user_eco_costs
    end  
    respond_to do |format|
      if @st_process_data.save
        format.js  { render :action => "create_st_process_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @st_process_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /st_process_datas/1
  # PUT /st_process_datas/1.xml
  def update
    @st_process_data = StProcessData.find(params[:id])

    respond_to do |format|
      if @st_process_data.update_attributes(params[:st_process_data])
        format.html { redirect_to(@st_process_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @st_process_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /st_process_datas/1
  # DELETE /st_process_datas/1.xml
  def destroy
    @st_process_data = StProcessData.find(params[:id])
    @st_process_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_st_process_data" }
    end
  end
end
