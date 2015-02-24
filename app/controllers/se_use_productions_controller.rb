class SeUseProductionsController < ApplicationController
  # GET /se_use_productions
  # GET /se_use_productions.xml
  def index
    @se_use_productions = SeUseProduction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @se_use_productions }
    end
  end

  # GET /se_use_productions/1
  # GET /se_use_productions/1.xml
  def show
    @se_product = SeProduct.find(params[:id])
    @product = @se_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @se_product.product.name, edit_product_url(@se_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, se_production_init_path(@se_product)
    add_breadcrumb _("Data entry").html_safe, se_manufacturing_url(@se_product)
    
    @se_use_production_datas = @se_product.se_use_production_datas

    if @se_product      
      @step = 2
      if !@se_product.se_use_production
        se_use_production = SeUseProduction.new 
        se_use_production.se_product_id = @se_product.id
        se_use_production.save
        @se_product.se_use_production = se_use_production        
      end    
      
      @se_use_production = @se_product.se_use_production
      @se_country_infos = SeCountryInfo.all.sort_by{ |k| k['order'] }

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @se_use_production }
      end
   end 
  end

  # GET /se_use_productions/new
  # GET /se_use_productions/new.xml
  def new
    @se_use_production = SeUseProduction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @se_use_production }
    end
  end

  # GET /se_use_productions/1/edit
  def edit
    @se_use_production = SeUseProduction.find(params[:id])
  end

  # POST /se_use_productions
  # POST /se_use_productions.xml
  def create
    @se_use_production = SeUseProduction.new(params[:se_use_production])

    respond_to do |format|
      if @se_use_production.save
        format.html { redirect_to(@se_use_production, :notice => 'Se use production was successfully created.') }
        format.xml  { render :xml => @se_use_production, :status => :created, :location => @se_use_production }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @se_use_production.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /se_use_productions/1
  # PUT /se_use_productions/1.xml
  def update
    @se_use_production = SeUseProduction.find(params[:id])
    return_url = ''
    if params[:arrow]
       if params[:arrow] == 'next'
          return_url = se_use_product_url(@se_use_production.se_product)     
       end
       if params[:arrow] == 'previous'
          return_url = se_manufacturing_url(@se_use_production.se_product)     
       end      
    end
    

    respond_to do |format|
      if @se_use_production.update_attributes(params[:se_use_production])
        #format.html { redirect_to(se_use_product_path(@se_use_production.se_product), :notice => 'Se basic information was successfully updated.') }
        format.html { redirect_to(return_url, :notice => 'Se use production was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @se_use_production.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /se_use_productions/1
  # DELETE /se_use_productions/1.xml
  def destroy
    @se_use_production = SeUseProduction.find(params[:id])
    @se_use_production.destroy

    respond_to do |format|
      format.html { redirect_to(se_use_productions_url) }
      format.xml  { head :ok }
    end
  end

  def next_step
    @se_product = SeProduct.find(params[:se_product_id].to_i)
    if @se_product.product.step < 3
      @se_product.product.step = 2
      @se_product.product.save
    end

    respond_to do |format|
      format.html { redirect_to se_use_product_url(@se_product)}
    end
  end

  def previous_step
    @se_product = SeProduct.find(params[:se_product_id].to_i)
    respond_to do |format|
      format.html { redirect_to se_manufacturing_url(@se_product)}
    end
  end
end
