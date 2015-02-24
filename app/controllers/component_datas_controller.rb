class ComponentDatasController < ApplicationController
  # GET /material_datas
  # GET /material_datas.xml
  def index
    @component_datas = ComponentData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @component_datas }
    end
  end

  # GET /material_datas/1
  # GET /material_datas/1.xml
  def show
    @component_data = ComponentData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @component_data }
    end
  end

  # GET /material_datas/new
  # GET /material_datas/new.xml
  def new
    @component_data = ComponentData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @component_data }
    end
  end

  # GET /material_datas/1/edit
  def edit
    @component_data = ComponentData.find(params[:id])
  end

  # POST /material_datas
  # POST /material_datas.xml
  def create
    @component_data = ComponentData.new(params[:component_data])
    @product = Product.find(params[:product_id])
    @component_data.product = @product


    respond_to do |format|
      if @component_data.save
        format.js  { render :action => "create_component" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @component_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /material_datas/1
  # PUT /material_datas/1.xml
  def update
    @component_data = ComponentData.find(params[:id])

    respond_to do |format|
      if @component_data.update_attributes(params[:component_data])
        format.html { redirect_to(@component_data, :notice => 'Material data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @component_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /material_datas/1
  # DELETE /material_datas/1.xml
  def destroy
    @component_data = ComponentData.find(params[:id])
    @component_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_component" }
    end
  end
  
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end   
  
  def update_values
      value = params[:update_value]
      if is_a_number?value
         component_data_id = params[:component_data_id]
         @component_data = ComponentData.find(component_data_id)
         @component_data.quantity = value
         @component_data.save
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
