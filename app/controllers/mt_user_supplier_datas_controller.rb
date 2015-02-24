class MtUserSupplierDatasController < ApplicationController
  # GET /mt_supplier_datas
  # GET /mt_supplier_datas.xml
  def index
    @mt_user_supplier_datas = MtUserSupplierData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mt_user_supplier_datas }
    end
  end

  # GET /mt_user_supplier_datas/1
  # GET /mt_user_supplier_datas/1.xml
  def show
    @mt_user_supplier_data = MtUserSupplierData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mt_user_supplier_data }
    end
  end

  # GET /mt_user_supplier_datas/new
  # GET /mt_user_supplier_datas/new.xml
  def new
    @mt_user_supplier_data = MtUserSupplierData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mt_user_supplier_data }
    end
  end

  # GET /mt_user_supplier_datas/1/edit
  def edit
    @mt_user_supplier_data = MtUserSupplierData.find(params[:id])
  end

  # POST /mt_user_supplier_datas
  # POST /mt_user_supplier_datas.xml
  def create
    @mt_user_supplier_data = MtUserSupplierData.new(params[:mt_user_supplier_data])
    
    respond_to do |format|
      if @mt_user_supplier_data.save
        format.js  { render :action => "create_mt_user_supplier_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mt_user_supplier_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mt_user_supplier_datas/1
  # PUT /mt_user_supplier_datas/1.xml
  def update
    @mt_user_supplier_data = MtUserSupplierData.find(params[:id])

    respond_to do |format|
      if @mt_user_supplier_data.update_attributes(params[:mt_user_supplier_data])
        format.html { redirect_to(@mt_user_supplier_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mt_user_supplier_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mt_user_supplier_datas/1
  # DELETE /mt_user_supplier_datas/1.xml
  def destroy
    @mt_user_supplier_data = MtUserSupplierData.find(params[:id])
    @mt_user_supplier_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_mt_user_supplier_data" }
    end
  end
  
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end
  
  def update_values
      value = params[:update_value]
      if is_a_number?value
         mt_user_supplier_data_id = params[:mt_user_supplier_data_id]
         @mt_user_supplier_data = MtUserSupplierData.find(mt_user_supplier_data_id)
         @mt_user_supplier_data.quantity = value
         @mt_user_supplier_data.save
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

  def update_process
      value = params[:update_value]
      if is_a_number?value
         mt_user_supplier_data_id = params[:mt_user_supplier_data_id]
         @mt_user_supplier_data = MtUserSupplierData.find(mt_user_supplier_data_id)
         @mt_user_supplier_data.value = value
         @mt_user_supplier_data.save
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
