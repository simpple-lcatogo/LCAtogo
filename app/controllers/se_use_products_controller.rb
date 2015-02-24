class SeUseProductsController < ApplicationController
  # GET /se_use_products
  # GET /se_use_products.xml
  def index
    @se_use_products = SeUseProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @se_use_products }
    end
  end

  # GET /se_use_products/1
  # GET /se_use_products/1.xml
  def show
    @se_product = SeProduct.find(params[:id])
    @product = @se_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @se_product.product.name, edit_product_url(@se_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, se_production_init_path(@se_product)
    add_breadcrumb _("Data entry").html_safe, se_manufacturing_url(@se_product)

    @se_use_product_datas = @se_product.se_use_product_datas

    if @se_product      
      @step = 3
      if !@se_product.se_use_product
        se_use_product = SeUseProduct.new 
        se_use_product.se_product_id = @se_product.id
        se_use_product.save
        @se_product.se_use_product = se_use_product        
      end    
    
      @se_use_product = @se_product.se_use_product
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @se_use_product }
      end
   end 
  end

  # GET /se_use_products/new
  # GET /se_use_products/new.xml
  def new
    @se_use_product = SeUseProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @se_use_product }
    end
  end

  # GET /se_use_products/1/edit
  def edit
    @se_use_product = SeUseProduct.find(params[:id])
  end

  # POST /se_use_products
  # POST /se_use_products.xml
  def create
    @se_use_product = SeUseProduct.new(params[:se_use_product])

    respond_to do |format|
      if @se_use_product.save
        format.html { redirect_to(@se_use_product, :notice => 'Se use product was successfully created.') }
        format.xml  { render :xml => @se_use_product, :status => :created, :location => @se_use_product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @se_use_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /se_use_products/1
  # PUT /se_use_products/1.xml
  def update
    @se_use_product = SeUseProduct.find(params[:id])

    respond_to do |format|
      if @se_use_product.update_attributes(params[:se_use_product])
        format.html { redirect_to(@se_use_product, :notice => 'Se use product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @se_use_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /se_use_products/1
  # DELETE /se_use_products/1.xml
  def destroy
    @se_use_product = SeUseProduct.find(params[:id])
    @se_use_product.destroy

    respond_to do |format|
      format.html { redirect_to(se_use_products_url) }
      format.xml  { head :ok }
    end
  end

  def update_values
    update_value = params[:update_value]

    se_use_consumption_consumable_data = SeUseConsumptionConsumableData.find(params[:id])
    
    if params[:field] == 'cost'
      se_use_consumption_consumable_data.cost = update_value
      update_value = update_value + " &euro;/kg"
    end  

    if se_use_consumption_consumable_data.save
      puts se_use_consumption_consumable_data.inspect 

        respond_to do |format|
          format.html {render :inline => update_value }
          format.xml  { head :ok }
        end 
     else
        respond_to do |format|
          format.html {render :inline => params[:original_value]}
          format.xml  { head :ok }
        end  
     end 

  end

  def next_step
    @se_product = SeProduct.find(params[:se_product_id].to_i)
    if @se_product.product.step < 4
      @se_product.product.step = 3
      @se_product.product.save
    end

    respond_to do |format|
      format.html { redirect_to se_use_consumption_url(@se_product)}
    end
  end

  def previous_step
    @se_product = SeProduct.find(params[:se_product_id].to_i)
    respond_to do |format|
      format.html { redirect_to se_use_production_url(@se_product)}
    end
  end


end
