class MtPredefinedSupplierDatasController < ApplicationController
  # GET /mt_supplier_datas
  # GET /mt_supplier_datas.xml
  def index
    @mt_predefined_supplier_datas = MtPredefinedSupplierData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mt_predefined_supplier_datas }
    end
  end

  # GET /mt_predefined_supplier_datas/1
  # GET /mt_predefined_supplier_datas/1.xml
  def show
    @mt_predefined_supplier_data = MtPredefinedSupplierData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mt_predefined_supplier_data }
    end
  end

  # GET /mt_predefined_supplier_datas/new
  # GET /mt_predefined_supplier_datas/new.xml
  def new
    @mt_predefined_supplier_data = MtPredefinedSupplierData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mt_predefined_supplier_data }
    end
  end

  # GET /mt_predefined_supplier_datas/1/edit
  def edit
    @mt_predefined_supplier_data = MtPredefinedSupplierData.find(params[:id])
  end

  # POST /mt_predefined_supplier_datas
  # POST /mt_predefined_supplier_datas.xml
  def create
    @mt_predefined_supplier_data = MtPredefinedSupplierData.new(params[:mt_predefined_supplier_data])
    
    respond_to do |format|
      if @mt_predefined_supplier_data.save
        format.js  { render :action => "create_mt_predefined_supplier_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mt_predefined_supplier_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mt_predefined_supplier_datas/1
  # PUT /mt_predefined_supplier_datas/1.xml
  def update
    @mt_predefined_supplier_data = MtPredefinedSupplierData.find(params[:id])

    respond_to do |format|
      if @mt_predefined_supplier_data.update_attributes(params[:mt_predefined_supplier_data])
        format.html { redirect_to(@mt_predefined_supplier_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mt_predefined_supplier_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mt_predefined_supplier_datas/1
  # DELETE /mt_predefined_supplier_datas/1.xml
  def destroy
    @mt_predefined_supplier_data = MtPredefinedSupplierData.find(params[:id])
    @mt_predefined_supplier_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_mt_predefined_supplier_data" }
    end
  end
  
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end
  
  def update_values
      value = params[:update_value]
      if is_a_number?value
         mt_predefined_supplier_data_id = params[:mt_predefined_supplier_data_id]
         @mt_predefined_supplier_data = MtPredefinedSupplierData.find(mt_predefined_supplier_data_id)
         @mt_predefined_supplier_data.quantity = value
         @mt_predefined_supplier_data.save
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

  def update_distance
      value = params[:update_value]
      if is_a_number?value
         mt_predefined_supplier_data_id = params[:mt_predefined_supplier_data_id]
         @mt_predefined_supplier_data = MtPredefinedSupplierData.find(mt_predefined_supplier_data_id)
         @mt_predefined_supplier_data.distance = value
         @mt_predefined_supplier_data.save
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
