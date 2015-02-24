class PackagingDistributionsController < ApplicationController
  #skip_before_filter :authenticate_user!
  # GET /packaging_distributions
  # GET /packaging_distributions.xml
  def index
    @packaging_distributions = PackagingDistribution.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @packaging_distributions }
    end
  end

  # GET /packaging_distributions/1
  # GET /packaging_distributions/1.xml
  def show
    @packaging_distribution = PackagingDistribution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @packaging_distribution }
    end
  end

  # GET /packaging_distributions/new
  # GET /packaging_distributions/new.xml
  def new
    @packaging_distribution = PackagingDistribution.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @packaging_distribution }
    end
  end

  # GET /packaging_distributions/1/edit
  def edit
    @packaging_distribution = PackagingDistribution.find(params[:id])
  end

  # POST /packaging_distributions
  # POST /packaging_distributions.xml
  def create
    @packaging_distribution = PackagingDistribution.new(params[:packaging_distribution])
    @product = Product.find(params[:product_id])
    @packaging_distribution.product = @product

    respond_to do |format|
      if @packaging_distribution.save
        format.js  { render :action => "create_packaging" }        
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @packaging_distribution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /packaging_distributions/1
  # PUT /packaging_distributions/1.xml
  def update
    @packaging_distribution = PackagingDistribution.find(params[:id])

    respond_to do |format|
      if @packaging_distribution.update_attributes(params[:packaging_distribution])
        format.html { redirect_to(@packaging_distribution, :notice => 'Packaging distribution was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @packaging_distribution.errors, :status => :unprocessable_entity }
      end
    end
  end

  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

  def update_values
    value = params[:update_value]
    if is_a_number?value
      packaging_distribution_id = params[:packaging_distribution_id]
      @packaging_distribution = PackagingDistribution.find(packaging_distribution_id)
      @packaging_distribution.quantity = value
      @packaging_distribution.save
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


  # DELETE /packaging_distributions/1
  # DELETE /packaging_distributions/1.xml
  def destroy
    @packaging_distribution = PackagingDistribution.find(params[:id])
    @packaging_distribution.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_packaging" }
    end
  end



end
