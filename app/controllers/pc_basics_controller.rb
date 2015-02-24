class PcBasicsController < ApplicationController
  # GET /pc_basics
  # GET /pc_basics.xml
  def index
    @pc_basics = PcBasic.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pc_basics }
    end
  end

  # GET /pc_basics/1
  # GET /pc_basics/1.xml
  def show
    @pc_product = PcProduct.find(params[:id])
    @product = @pc_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @pc_product.product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, pc_production_init_path(@pc_product)
    add_breadcrumb _("Data entry").html_safe, pc_basic_path(@pc_product)

    if @pc_product
      @step = 1
      if !@pc_product.pc_basic
        pc_basic = PcBasic.new
        pc_basic.pc_product_id = @pc_product.id
        pc_basic.save
        @pc_product.pc_basic = pc_basic
      end

      #@se_use_consumption = @se_product.se_use_consumption
      @pc_basic = @pc_product.pc_basic  
      @pc_country_infos = PcCountryInfo.all
      @pc_coating_types = PcCoatingType.all
      @pc_transport_datas = @pc_product.pc_transport_datas
      
      @pc_transport_types = PcTransportType.all
       respond_to do |format|
          format.html # show.html.erb
        end
      end        
    end
  # GET /pc_basics/new
  # GET /pc_basics/new.xml
  def new
    @pc_basic = PcBasic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pc_basic }
    end
  end

  # GET /pc_basics/1/edit
  def edit
    @pc_basic = PcBasic.find(params[:id])
  end

  # POST /pc_basics
  # POST /pc_basics.xml
  def create
    @pc_basic = PcBasic.new(params[:pc_basic])

    respond_to do |format|
      if @pc_basic.save
        format.html { redirect_to(pc_indicator_path(@pc_basic.pc_product))}
        format.xml  { render :xml => @pc_basic, :status => :created, :location => @pc_basic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pc_basic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pc_basics/1
  # PUT /pc_basics/1.xml
  def update
    @pc_basic = PcBasic.find(params[:id])
    params[:pc_basic][:pcb_area] = params[:pc_basic][:pcb_area].gsub(",", ".").to_f
    respond_to do |format|
      if @pc_basic.update_attributes(params[:pc_basic])
        format.html { redirect_to(pc_indicator_path(@pc_basic.pc_product)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pc_basic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pc_basics/1
  # DELETE /pc_basics/1.xml
  def destroy
    @pc_basic = PcBasic.find(params[:id])
    @pc_basic.destroy

    respond_to do |format|
      format.html { redirect_to(pc_basics_url) }
      format.xml  { head :ok }
    end
  end
end
