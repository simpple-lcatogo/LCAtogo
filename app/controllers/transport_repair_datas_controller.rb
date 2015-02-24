class TransportRepairDatasController < ApplicationController

  # POST /transport_repair_datas
  # POST /transport_repair_datas.xml
  def create
    @transport_repair_data = TransportRepairData.new(params[:transport_repair_data])
    @product = Product.find(params[:product_id])
    @transport_repair_data.product = @product


    respond_to do |format|
      if @transport_repair_data.save
        format.js  { render :action => "create_transport_repair_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transport_repair_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transport_repair_datas/1
  # PUT /transport_repair_datas/1.xml
  def update
    @transport_repair_data = TransportRepairData.find(params[:id])

    respond_to do |format|
      if @transport_repair_data.update_attributes(params[:transport_repair_data])
        format.html { redirect_to(@transport_repair_data, :notice => 'Manufacturing data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transport_repair_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transport_repair_datas/1
  # DELETE /transport_repair_datas/1.xml
  def destroy
    @transport_repair_data = TransportRepairData.find(params[:id])
    @transport_repair_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_transport_repair_data" }
    end
  end
  
  
  
end
