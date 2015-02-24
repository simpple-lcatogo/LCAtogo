class MaterialDatasController < ApplicationController
  # GET /material_datas
  # GET /material_datas.xml
  def index
    @material_datas = MaterialData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @material_datas }
    end
  end

  # GET /material_datas/1
  # GET /material_datas/1.xml
  def show
    @material_data = MaterialData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @material_data }
    end
  end

  # GET /material_datas/new
  # GET /material_datas/new.xml
  def new
    @material_data = MaterialData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @material_data }
    end
  end

  # GET /material_datas/1/edit
  def edit
    @material_data = MaterialData.find(params[:id])
  end

  # POST /material_datas
  # POST /material_datas.xml
  def create
    @material_data = MaterialData.new(params[:material_data])
    @product = Product.find(params[:product_id])
    @material_data.product = @product


    respond_to do |format|
      if @material_data.save
        format.js  { render :action => "create_material" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @material_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /material_datas/1
  # PUT /material_datas/1.xml
  def update
    @material_data = MaterialData.find(params[:id])

    respond_to do |format|
      if @material_data.update_attributes(params[:material_data])
        format.html { redirect_to(@material_data, :notice => 'Material data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @material_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /material_datas/1
  # DELETE /material_datas/1.xml
  def destroy
    @material_data = MaterialData.find(params[:id])
    @material_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_material" }
    end
  end
  
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end   
  
  def update_values
      value = params[:update_value]
      if is_a_number?value
         material_data_id = params[:material_data_id]
         @material_data = MaterialData.find(material_data_id)
         @material_data.quantity = value
         @material_data.save
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
