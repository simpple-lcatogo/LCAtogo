class BpCompoundMaterialDatasController < ApplicationController
  # GET /bp_compound_material_datas
  # GET /bp_compound_material_datas.xml
  def index
    @bp_compound_material_datas = BpCompoundMaterialData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bp_compound_material_datas }
    end
  end

  # GET /bp_compound_material_datas/1
  # GET /bp_compound_material_datas/1.xml
  def show
    @bp_compound_material_data = BpCompoundMaterialData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bp_compound_material_data }
    end
  end

  # GET /bp_compound_material_datas/new
  # GET /bp_compound_material_datas/new.xml
  def new
    @bp_compound_material_data = BpCompoundMaterialData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bp_compound_material_data }
    end
  end

  # GET /bp_compound_material_datas/1/edit
  def edit
    @bp_compound_material_data = BpCompoundMaterialData.find(params[:id])
  end

  # POST /bp_compound_material_datas
  # POST /bp_compound_material_datas.xml
  def create
    @bp_compound_material_data = BpCompoundMaterialData.new(params[:bp_compound_material_data])
    @bp_compound_material_data.amount = params[:bp_compound_material_data][:amount].gsub(",", ".").to_f
    respond_to do |format|
      if @bp_compound_material_data.save
        format.js  { render :action => "create_compound_material" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bp_compound_material_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bp_compound_material_datas/1
  # PUT /bp_compound_material_datas/1.xml
  def update
    @bp_compound_material_data = BpCompoundMaterialData.find(params[:id])

    respond_to do |format|
      if @bp_compound_material_data.update_attributes(params[:bp_compound_material_data])
        format.html { redirect_to(@bp_compound_material_data, :notice => 'Bp compound material data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bp_compound_material_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bp_compound_material_datas/1
  # DELETE /bp_compound_material_datas/1.xml
  def destroy
    @bp_compound_material_data = BpCompoundMaterialData.find(params[:id])
    @bp_compound_material_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_compound_material" }
    end
  end

  def update_values
     update_value = params[:update_value]
     if params[:field] != 'comment'
        update_value = update_value.gsub(",", ".")
     end
     @bp_compound_material_data = BpCompoundMaterialData.find(params[:bp_compound_material_data_id])

     if params[:field] == 'amount'
        @bp_compound_material_data.amount = update_value
     elsif params[:field] == 'comment'
        @bp_compound_material_data.comment = update_value
     end

     if @bp_compound_material_data.save
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
