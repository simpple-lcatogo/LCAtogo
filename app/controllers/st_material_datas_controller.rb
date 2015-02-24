class StMaterialDatasController < ApplicationController
  # GET /st_material_datas
  # GET /st_material_datas.xml
  def index
    @st_material_datas = StMaterialData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @st_material_datas }
    end
  end

  # GET /st_material_datas/1
  # GET /st_material_datas/1.xml
  def show
    @st_material_data = StMaterialData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @st_material_data }
    end
  end

  # GET /st_material_datas/new
  # GET /st_material_datas/new.xml
  def new
    @st_material_data = StMaterialData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @st_material_data }
    end
  end

  # GET /st_material_datas/1/edit
  def edit
    @st_material_data = StMaterialData.find(params[:id])
  end

  # POST /st_material_datas
  # POST /st_material_datas.xml
  def create
    @st_material_data = StMaterialData.new(params[:st_material_data])
    if @st_material_data.st_material         
        eco_cost = StExcelValue.find_by_local_name_and_category(@st_material_data.st_material.name, "Materials")
        if eco_cost
           @st_material_data.eco_cost = eco_cost.value
        else
          eco_cost = StExcelValue.find_by_local_name_and_category(@st_material_data.st_material.name + ",", "Materials")
          if eco_cost
           @st_material_data.eco_cost = eco_cost.value   
          else 
            eco_cost = StExcelValue.find_by_local_name_and_category(@st_material_data.st_material.name + " ", "Materials")
            if eco_cost
              @st_material_data.eco_cost = eco_cost.value   
            end        
          end
        end
    else 
      @st_material_data.eco_cost = @st_material_data.user_eco_costs
    end  
    if @st_material_data.st_material && @st_material_data.st_material.unit == 'g'
       if @st_material_data.eco_cost
          @st_material_data.eco_cost = @st_material_data.eco_cost / 1000
       end   
    end
    
    respond_to do |format|
      if @st_material_data.save
        format.js  { render :action => "create_st_material_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @st_material_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /st_material_datas/1
  # PUT /st_material_datas/1.xml
  def update
    @st_material_data = StMaterialData.find(params[:id])

    respond_to do |format|
      if @st_material_data.update_attributes(params[:st_material_data])
        format.html { redirect_to(@st_material_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @st_material_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /st_material_datas/1
  # DELETE /st_material_datas/1.xml
  def destroy
    @st_material_data = StMaterialData.find(params[:id])
    @st_material_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_st_material_data" }
    end
  end
end
