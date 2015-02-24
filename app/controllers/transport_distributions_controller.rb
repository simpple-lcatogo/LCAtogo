class TransportDistributionsController < ApplicationController
  # GET /transport_distributions
  # GET /transport_distributions.xml
  def index
    @transport_distributions = TransportDistribution.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transport_distributions }
    end
  end

  # GET /transport_distributions/1
  # GET /transport_distributions/1.xml
  def show
    @transport_distribution = TransportDistribution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transport_distribution }
    end
  end

  # GET /transport_distributions/new
  # GET /transport_distributions/new.xml
  def new
    @transport_distribution = TransportDistribution.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transport_distribution }
    end
  end

  # GET /transport_distributions/1/edit
  def edit
    @transport_distribution = TransportDistribution.find(params[:id])
  end

  # POST /transport_distributions
  # POST /transport_distributions.xml
  def create
    @transport_distribution = TransportDistribution.new(params[:transport_distribution])
    @product = Product.find(params[:product_id])
    @transport_distribution.product = @product

    respond_to do |format|
      if @transport_distribution.save
        format.js  { render :action => "create_transport" } 
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transport_distribution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transport_distributions/1
  # PUT /transport_distributions/1.xml
  def update
    @transport_distribution = TransportDistribution.find(params[:id])

    respond_to do |format|
      if @transport_distribution.update_attributes(params[:transport_distribution])
        format.html { redirect_to(@transport_distribution, :notice => 'Transport distribution was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transport_distribution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transport_distributions/1
  # DELETE /transport_distributions/1.xml
  def destroy
    @transport_distribution = TransportDistribution.find(params[:id])
    @transport_distribution.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_transport" } 
    end
  end


  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

  def update_quantity
    value = params[:update_value]
    if is_a_number?value
      transport_distribution_id = params[:transport_distribution_id]
      @transport_distribution = TransportDistribution.find(transport_distribution_id)
      @transport_distribution.quantity = value
      @transport_distribution.save
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
      transport_distribution_id = params[:transport_distribution_id]
      @transport_distribution = TransportDistribution.find(transport_distribution_id)
      @transport_distribution.distance = value
      @transport_distribution.save
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
