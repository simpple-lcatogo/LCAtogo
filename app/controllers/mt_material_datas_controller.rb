class MtMaterialDatasController < ApplicationController
  # GET /mt_material_datas
  # GET /mt_material_datas.xml
  def index
    @mt_material_datas = MtMaterialData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mt_material_datas }
    end
  end

  # GET /mt_material_datas/1
  # GET /mt_material_datas/1.xml
  def show
    @mt_material_data = MtMaterialData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mt_material_data }
    end
  end

  # GET /mt_material_datas/new
  # GET /mt_material_datas/new.xml
  def new
    @mt_material_data = MtMaterialData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mt_material_data }
    end
  end

  # GET /mt_material_datas/1/edit
  def edit
    @mt_material_data = MtMaterialData.find(params[:id])
  end

  # POST /mt_material_datas
  # POST /mt_material_datas.xml
  def create
    @mt_material_data = MtMaterialData.new(params[:mt_material_data])
    @detailed = false
    if @mt_material_data.mt_product.mt_assessment && @mt_material_data.mt_product.mt_assessment.assessment_type == 'detailed'
       @detailed = true
    end
    
    respond_to do |format|
      if @mt_material_data.save
        format.js  { render :action => "create_mt_material_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mt_material_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mt_material_datas/1
  # PUT /mt_material_datas/1.xml
  def update
    @mt_material_data = MtMaterialData.find(params[:id])

    respond_to do |format|
      if @mt_material_data.update_attributes(params[:mt_material_data])
        format.html { redirect_to(@mt_material_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mt_material_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mt_material_datas/1
  # DELETE /mt_material_datas/1.xml
  def destroy
    @mt_material_data = MtMaterialData.find(params[:id])
    @mt_material_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_mt_material_data" }
    end
  end
  
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end
  
  def update_values
      value = params[:update_value]
      if is_a_number?value
         mt_material_data_id = params[:mt_material_data_id]
         @mt_material_data = MtMaterialData.find(mt_material_data_id)
         @mt_material_data.quantity = value
         @mt_material_data.save
         respond_to do |format|
           format.html {render :inline => value}
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
