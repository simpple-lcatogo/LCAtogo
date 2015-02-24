class EconomicsController < ApplicationController
  # GET /economics
  # GET /economics.xml
  def index
    @economics = Economic.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @economics }
    end
  end

  # GET /economics/1
  # GET /economics/1.xml
  def show
    @step = 1
    @product = get_product(params[:id])
    if @product      
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @product.name, product_url(@product)
      add_breadcrumb _("LCC - based module").html_safe, economic_url(@product)
      
      
      if !@product.economic
        @product.economic = Economic.new
        @product.economic.save
      end
      
      @electronic_economics = @product.economic.electronic_economics
      @economical_phases = EconomicalPhase.find(:all)
      @economical_families = EconomicalFamily.all.sort_by{ |k| k['name'] } 
      @economical_flows = EconomicalFlow.all.sort_by{ |k| k['name'] }      
      
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

  # GET /economics/new
  # GET /economics/new.xml
  def new
    @economic = Economic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @economic }
    end
  end

  # GET /economics/1/edit
  def edit
    @economic = Economic.find(params[:id])
  end

  # POST /economics
  # POST /economics.xml
  def create
    @economic = Economic.new(params[:economic])

    respond_to do |format|
      if @economic.save
        format.html { redirect_to(@economic, :notice => 'Economic was successfully created.') }
        format.xml  { render :xml => @economic, :status => :created, :location => @economic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @economic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /economics/1
  # PUT /economics/1.xml
  def update
    @economic = Economic.find(params[:id])

    respond_to do |format|
      if @economic.update_attributes(params[:economic])
        format.html { redirect_to(@economic, :notice => 'Economic was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @economic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /economics/1
  # DELETE /economics/1.xml
  def destroy
    @economic = Economic.find(params[:id])
    @economic.destroy

    respond_to do |format|
      format.html { redirect_to(economics_url) }
      format.xml  { head :ok }
    end
  end
end
