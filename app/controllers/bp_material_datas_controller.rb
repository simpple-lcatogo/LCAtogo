class BpMaterialDatasController < ApplicationController
  # GET /bp_material_datas
  # GET /bp_material_datas.xml
  def index
    @bp_material_datas = BpMaterialData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bp_material_datas }
    end
  end

  # GET /bp_material_datas/1
  # GET /bp_material_datas/1.xml
  def show
    @bp_material_data = BpMaterialData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bp_material_data }
    end
  end

  # GET /bp_material_datas/new
  # GET /bp_material_datas/new.xml
  def new
    @bp_material_data = BpMaterialData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bp_material_data }
    end
  end

  # GET /bp_material_datas/1/edit
  def edit
    @bp_material_data = BpMaterialData.find(params[:id])
  end

  # POST /bp_material_datas
  # POST /bp_material_datas.xml
  def create
    @bp_material_data = BpMaterialData.new(params[:bp_material_data])
    @bp_material_data.quantity = params[:bp_material_data][:quantity].gsub(",", ".").to_f
    respond_to do |format|
      if @bp_material_data.save
        format.js  { render :action => "create_material" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bp_material_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bp_material_datas/1
  # PUT /bp_material_datas/1.xml
  def update
    @bp_material_data = BpMaterialData.find(params[:id])

    respond_to do |format|
      if @bp_material_data.update_attributes(params[:bp_material_data])
        format.html { redirect_to(@bp_material_data, :notice => 'Bp material data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bp_material_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bp_material_datas/1
  # DELETE /bp_material_datas/1.xml
  def destroy
    @bp_material_data = BpMaterialData.find(params[:id])
    @bp_material_data.destroy


    respond_to do |format|
      format.js  { render :action => "destroy_material" }
    end
  end


   def update_values
     update_value = params[:update_value].gsub(",", ".")
     @bp_material_data = BpMaterialData.find(params[:bp_material_data_id])

     if params[:field] == 'quantity'
        @bp_material_data.quantity = update_value
     elsif params[:field] == 'comment'
        @bp_material_data.comment = update_value
     end

     if @bp_material_data.save
        respond_to do |format|
          format.html {render :inline => update_value}
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
