class SeUseCostsController < ApplicationController
  # GET /se_use_costs
  # GET /se_use_costs.xml
  def index
    @se_use_costs = SeUseCost.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @se_use_costs }
    end
  end

  # GET /se_use_costs/1
  # GET /se_use_costs/1.xml
  def show
    @se_product = SeProduct.find(params[:id])
    @product = @se_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @se_product.product.name, edit_product_url(@se_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, se_production_init_path(@se_product)
    add_breadcrumb _("Data entry").html_safe, se_manufacturing_url(@se_product)

    @se_use_consumption_consumable_datas = @se_product.se_use_consumption_consumable_datas
    @se_use_product_datas = @se_product.se_use_product_datas

    if @se_product      
      @step = 5
      if !@se_product.se_use_cost
        se_use_cost = SeUseCost.new 
        se_use_cost.se_product_id = @se_product.id
        se_use_cost.save
        @se_product.se_use_cost = se_use_cost        
      end    
    
      @se_use_cost = @se_product.se_use_cost
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @se_use_cost }
      end
    end
  end

  # GET /se_use_costs/new
  # GET /se_use_costs/new.xml
  def new
    @se_use_cost = SeUseCost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @se_use_cost }
    end
  end

  # GET /se_use_costs/1/edit
  def edit
    @se_use_cost = SeUseCost.find(params[:id])
  end

  # POST /se_use_costs
  # POST /se_use_costs.xml
  def create
    @se_use_cost = SeUseCost.new(params[:se_use_cost])

    respond_to do |format|
      if @se_use_cost.save
        format.html { redirect_to(@se_use_cost, :notice => 'The use cost was successfully created.') }
        format.xml  { render :xml => @se_use_cost, :status => :created, :location => @se_use_cost }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @se_use_cost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /se_use_costs/1
  # PUT /se_use_costs/1.xml
  def update
    @se_use_cost = SeUseCost.find(params[:id])
    return_url = ''
    if params[:arrow]
       if params[:arrow] == 'next'
          return_url = se_recycling_url(@se_use_cost.se_product)     
       end
       if params[:arrow] == 'previous'
          return_url = se_use_consumption_url(@se_use_cost.se_product)
       end      
    end

    respond_to do |format|
      if @se_use_cost.update_attributes(params[:se_use_cost])
        format.html { redirect_to(return_url, :notice => 'The use cost was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @se_use_cost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /se_use_costs/1
  # DELETE /se_use_costs/1.xml
  def destroy
    @se_use_cost = SeUseCost.find(params[:id])
    @se_use_cost.destroy

    respond_to do |format|
      format.html { redirect_to(se_use_costs_url) }
      format.xml  { head :ok }
    end
  end

  def next_step
    @se_product = SeProduct.find(params[:se_product_id].to_i)

    if @se_product.product.step < 6
      @se_product.product.step = 5
      @se_product.product.save
    end

    respond_to do |format|
      format.html { redirect_to se_recycling_url(@se_product)}
    end
  end

  def previous_step
    @se_product = SeProduct.find(params[:se_product_id].to_i)
    respond_to do |format|
      format.html { redirect_to se_use_consumption_url(@se_product)}
    end
  end
end
