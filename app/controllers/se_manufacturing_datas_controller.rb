class SeManufacturingDatasController < ApplicationController
  # GET /se_manufacturing_datas
  # GET /se_manufacturing_datas.xml
  def index
    @se_manufacturing_datas = SeManufacturingData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @se_manufacturing_datas }
    end
  end

  # GET /se_manufacturing_datas/1
  # GET /se_manufacturing_datas/1.xml
  def show
    @se_manufacturing_data = SeManufacturingData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @se_manufacturing_data }
    end
  end

  # GET /se_manufacturing_datas/new
  # GET /se_manufacturing_datas/new.xml
  def new
    @se_manufacturing_data = SeManufacturingData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @se_manufacturing_data }
    end
  end

  # GET /se_manufacturing_datas/1/edit
  def edit
    @se_manufacturing_data = SeManufacturingData.find(params[:id])
  end

  # POST /se_manufacturing_datas
  # POST /se_manufacturing_datas.xml
  def create
    @se_manufacturing_data = SeManufacturingData.new(params[:se_manufacturing_data])
    @se_product = SeProduct.find(params[:se_product_id])
    @se_manufacturing_data.se_product = @se_product


    respond_to do |format|
      if @se_manufacturing_data.save
         format.js  { render :action => "create_se_manufacturing" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @se_manufacturing_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /se_manufacturing_datas/1
  # PUT /se_manufacturing_datas/1.xml
  def update
    @se_manufacturing_data = SeManufacturingData.find(params[:id])

    respond_to do |format|
      if @se_manufacturing_data.update_attributes(params[:se_manufacturing_data])
        format.html { redirect_to(@se_manufacturing_data, :notice => 'Se manufacturing data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @se_manufacturing_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /se_manufacturing_datas/1
  # DELETE /se_manufacturing_datas/1.xml
  def destroy
    @se_manufacturing_data = SeManufacturingData.find(params[:id])
    @se_manufacturing_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_se_manufacturing" }
    end
  end

def update_values
     update_value = params[:update_value]
     @se_manufacturing_data = SeManufacturingData.find(params[:se_manufacturing_data_id])
     

     if params[:field] == 'quantity'
        @se_manufacturing_data.quantity = update_value
     elsif params[:field] == 'number'
        @se_manufacturing_data.number = update_value
     end

     if @se_manufacturing_data.save
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
