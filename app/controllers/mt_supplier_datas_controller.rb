class MtSupplierDatasController < ApplicationController
  # GET /mt_supplier_datas
  # GET /mt_supplier_datas.xml
  def index
    @mt_supplier_datas = MtSupplierData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mt_supplier_datas }
    end
  end

  # GET /mt_supplier_datas/1
  # GET /mt_supplier_datas/1.xml
  def show
    @mt_supplier_data = MtSupplierData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mt_supplier_data }
    end
  end

  # GET /mt_supplier_datas/new
  # GET /mt_supplier_datas/new.xml
  def new
    @mt_supplier_data = MtSupplierData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mt_supplier_data }
    end
  end

  # GET /mt_supplier_datas/1/edit
  def edit
    @mt_supplier_data = MtSupplierData.find(params[:id])
  end

  # POST /mt_supplier_datas
  # POST /mt_supplier_datas.xml
  def create
    @mt_supplier_data = MtSupplierData.new(params[:mt_supplier_data])
    
    respond_to do |format|
      if @mt_supplier_data.save
        format.js  { render :action => "create_mt_supplier_data" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mt_supplier_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mt_supplier_datas/1
  # PUT /mt_supplier_datas/1.xml
  def update
    @mt_supplier_data = MtSupplierData.find(params[:id])

    respond_to do |format|
      if @mt_supplier_data.update_attributes(params[:mt_supplier_data])
        format.html { redirect_to(@mt_supplier_data) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mt_supplier_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mt_supplier_datas/1
  # DELETE /mt_supplier_datas/1.xml
  def destroy
    @mt_supplier_data = MtSupplierData.find(params[:id])
    @mt_supplier_data.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_mt_supplier_data" }
    end
  end
end
