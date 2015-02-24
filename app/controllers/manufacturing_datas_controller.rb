class ManufacturingDatasController < ApplicationController
  include ScenariosHelper  
  # GET /manufacturing_datas
  # GET /manufacturing_datas.xml
  def index
    @manufacturing_datas = ManufacturingData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @manufacturing_datas }
    end
  end

  # GET /manufacturing_datas/1
  # GET /manufacturing_datas/1.xml
  def show
    @manufacturing_data = ManufacturingData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @manufacturing_data }
    end
  end

  # GET /manufacturing_datas/new
  # GET /manufacturing_datas/new.xml
  def new
    @manufacturing_data = ManufacturingData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @manufacturing_data }
    end
  end

  # GET /manufacturing_datas/1/edit
  def edit
    @manufacturing_data = ManufacturingData.find(params[:id])
  end

  # POST /manufacturing_datas
  # POST /manufacturing_datas.xml
  def create
    @manufacturing_data = ManufacturingData.new(params[:manufacturing_data])
    @product = Product.find(params[:product_id])
    @manufacturing_data.product = @product
    if @manufacturing_data.family.name == 'Display'
      aspect = @manufacturing_data.aspect                
      ratio = @manufacturing_data.ratio      
      diagonal = @manufacturing_data.diagonal      
      if aspect && ratio && diagonal
        result = (aspect * ratio)
        result = result / ((aspect ** 2) + (ratio ** 2));
        result = result * ((diagonal * 2.54) ** 2);        
        @manufacturing_data.quantity = result  
      end
    end

    @average_technical_lifetime = calculate_average_technical_lifetime(@product)
    @average_technical_lifetime =  @average_technical_lifetime.round(2)

    respond_to do |format|
      if @manufacturing_data.save
        format.js  { render :action => "create_manufacturing" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @manufacturing_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /manufacturing_datas/1
  # PUT /manufacturing_datas/1.xml
  def update
    @manufacturing_data = ManufacturingData.find(params[:id])

    respond_to do |format|
      if @manufacturing_data.update_attributes(params[:manufacturing_data])
        format.html { redirect_to(@manufacturing_data, :notice => 'Manufacturing data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @manufacturing_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /manufacturing_datas/1
  # DELETE /manufacturing_datas/1.xml
  def destroy
    @manufacturing_data = ManufacturingData.find(params[:id])
    @manufacturing_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_manufacturing" }
    end
  end
  
  
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end   
  
  def update_values
      value = params[:update_value]
      if is_a_number?value
         manufacturing_data_id = params[:manufacturing_data_id]
         @manufacturing_data = ManufacturingData.find(manufacturing_data_id)
         @manufacturing_data.quantity = value
         @manufacturing_data.save
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
  
  def update_component_age
      value = params[:update_value]
      if is_a_number?value
         manufacturing_data_id = params[:manufacturing_data_id]
         @manufacturing_data = ManufacturingData.find(manufacturing_data_id)
         @manufacturing_data.component_age = value
         @manufacturing_data.save
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

  def update_component_total_lifetime
      value = params[:update_value]
      if is_a_number?value
         manufacturing_data_id = params[:manufacturing_data_id]
         @manufacturing_data = ManufacturingData.find(manufacturing_data_id)
         @manufacturing_data.component_total_lifetime = value
         @manufacturing_data.save
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
