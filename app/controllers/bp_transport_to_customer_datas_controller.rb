class BpTransportToCustomerDatasController < ApplicationController
  # GET /bp_transport_to_customer_datas
  # GET /bp_transport_to_customer_datas.xml
  def index
    @bp_transport_to_customer_datas = BpTransportToCustomerData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bp_transport_to_customer_datas }
    end
  end

  # GET /bp_transport_to_customer_datas/1
  # GET /bp_transport_to_customer_datas/1.xml
  def show
    @bp_transport_to_customer_data = BpTransportToCustomerData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bp_transport_to_customer_data }
    end
  end

  # GET /bp_transport_to_customer_datas/new
  # GET /bp_transport_to_customer_datas/new.xml
  def new
    @bp_transport_to_customer_data = BpTransportToCustomerData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bp_transport_to_customer_data }
    end
  end

  # GET /bp_transport_to_customer_datas/1/edit
  def edit
    @bp_transport_to_customer_data = BpTransportToCustomerData.find(params[:id])
  end

  # POST /bp_transport_to_customer_datas
  # POST /bp_transport_to_customer_datas.xml
  def create
    @bp_transport_to_customer_data = BpTransportToCustomerData.new(params[:bp_transport_to_customer_data])
    @bp_transport_to_customer_data.distance = params[:bp_transport_to_customer_data][:distance].gsub(",", ".").to_f
    @bp_transport_to_customer_data.amount = params[:bp_transport_to_customer_data][:amount].gsub(",", ".").to_f    

    respond_to do |format|
      if @bp_transport_to_customer_data.save
        format.js  { render :action => "create_bp_transport_to_customer" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bp_transport_to_customer_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bp_transport_to_customer_datas/1
  # PUT /bp_transport_to_customer_datas/1.xml
  def update
    @bp_transport_to_customer_data = BpTransportToCustomerData.find(params[:id])

    respond_to do |format|
      if @bp_transport_to_customer_data.update_attributes(params[:bp_transport_to_customer_data])
        format.html { redirect_to(@bp_transport_to_customer_data, :notice => 'Bp transport to customer data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bp_transport_to_customer_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bp_transport_to_customer_datas/1
  # DELETE /bp_transport_to_customer_datas/1.xml
  def destroy
    @bp_transport_to_customer_data = BpTransportToCustomerData.find(params[:id])
    @bp_transport_to_customer_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_bp_transport_to_customer" }
    end
  end

  def update_values
     update_value = params[:update_value]
     @bp_transport_to_customer_data = BpTransportToCustomerData.find(params[:bp_transport_to_customer_id])
     if params[:field] != 'comment'
        update_value = update_value.gsub(",", ".")
     end
     if params[:field] == 'distance'
        @bp_transport_to_customer_data.distance = update_value
     elsif params[:field] == 'amount'
        @bp_transport_to_customer_data.amount = update_value
     elsif params[:field] == 'comment'
        @bp_transport_to_customer_data.comment = update_value      
     end

     if @bp_transport_to_customer_data.save
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
