class BpEconomicsController < ApplicationController
  # GET /bp_economics
  # GET /bp_economics.xml
  def index
    @bp_economics = BpEconomic.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bp_economics }
    end
  end

  # GET /bp_economics/1
  # GET /bp_economics/1.xml
  def show
    @step = 1
    @bp_product = BpProduct.find(params[:id])
    @product = @bp_product.product
    if @bp_product      
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @bp_product.product.name, edit_product_url(@bp_product.product)
      add_breadcrumb _("Environmental Assessment").html_safe, bp_production_init_path(@bp_product)
      add_breadcrumb _("Economic data").html_safe, bp_economic_url(@product.bp_product)

      if !@bp_product.bp_economic
        @bp_product.bp_economic = BpEconomic.new
        @bp_product.bp_economic.save
      end
      
      @bp_electronic_economics = @bp_product.bp_economic.bp_electronic_economics
      @bp_economical_phases = BpEconomicalPhase.find(:all, :conditions => ["name != 'End-Of-Life'"])
      @bp_economical_families = BpEconomicalFamily.all.sort_by{ |k| k['name'] } 
      @bp_economical_flows = BpEconomicalFlow.all.sort_by{ |k| k['name'] }      
      @bp_distribution_default_values = BpDistributionDefaultValue.all
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @product }
      end
    else
     respond_to do |format|
        format.html { redirect_to(products_url) }
        format.xml { head :ok }
     end      
   end    
  end

  # GET /bp_economics/new
  # GET /bp_economics/new.xml
  def new
    @bp_economic = BpEconomic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bp_economic }
    end
  end

  # GET /bp_economics/1/edit
  def edit
    @bp_economic = BpEconomic.find(params[:id])
  end

  # POST /bp_economics
  # POST /bp_economics.xml
  def create
    @bp_economic = BpEconomic.new(params[:bp_economic])

    respond_to do |format|
      if @bp_economic.save
        format.html { redirect_to(@bp_economic, :notice => 'Bp economic was successfully created.') }
        format.xml  { render :xml => @bp_economic, :status => :created, :location => @bp_economic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bp_economic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bp_economics/1
  # PUT /bp_economics/1.xml
  def update
    @bp_economic = BpEconomic.find(params[:id])

    respond_to do |format|
      if @bp_economic.update_attributes(params[:bp_economic])
        format.html { redirect_to(@bp_economic, :notice => 'Bp economic was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bp_economic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bp_economics/1
  # DELETE /bp_economics/1.xml
  def destroy
    @bp_economic = BpEconomic.find(params[:id])
    @bp_economic.destroy

    respond_to do |format|
      format.html { redirect_to(bp_economics_url) }
      format.xml  { head :ok }
    end
  end
end
