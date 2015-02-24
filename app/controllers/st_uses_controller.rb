class StUsesController < ApplicationController
  # GET /st_uses
  # GET /st_uses.xml
  def index
    @st_uses = StUse.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @st_uses }
    end
  end

  # GET /st_uses/1
  # GET /st_uses/1.xml
  def show
    @st_product = StProduct.find(params[:id])
    @product = @st_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @st_product.product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, st_production_init_path(@st_product)
    add_breadcrumb _("Data entry").html_safe, st_use_url(@st_product)

    if @st_product
      @step = 4
      if !@st_product.st_use
        st_use = StUse.new
        st_use.st_product_id = @st_product.id
        st_use.save
        @st_product.st_use = st_use

      end

      @st_use = @st_product.st_use
      @st_materials = StMaterial.all
      @st_families = StFamily.all
      @st_energy_types = StEnergyType.all
      @st_energy_sources = StEnergySource.all
      @st_consumption_datas = @st_product.st_consumption_datas
      @st_consumable_datas = @st_product.st_consumable_datas

      if @st_use.lifetime
         @lifetime_hidden = @st_use.lifetime
      else
         @lifetime_hidden = 0
      end

      if @st_product.st_end_of_life && @st_product.st_end_of_life.lifetime
        @end_of_life_lifetime = @st_product.st_end_of_life.lifetime
      else
        @end_of_life_lifetime = 0
      end




      respond_to do |format|
        format.html # show.html.erb
      end
    end

  end

  # GET /st_uses/new
  # GET /st_uses/new.xml
  def new
    @st_use = StUse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @st_use }
    end
  end

  # GET /st_uses/1/edit
  def edit
    @st_use = StUse.find(params[:id])
  end

  # POST /st_uses
  # POST /st_uses.xml
  def create
    @st_use = StUse.new(params[:st_use])

    respond_to do |format|
      if @st_use.save
        format.html { redirect_to(@st_use) }
        format.xml  { render :xml => @st_use, :status => :created, :location => @st_use }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @st_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /st_uses/1
  # PUT /st_uses/1.xml
  def update
    @st_use = StUse.find(params[:id])
    return_url = ''
    if params[:arrow]
       if params[:arrow] == 'next'
          return_url = st_end_of_life_path(@st_use.st_product)     
       end
       if params[:arrow] == 'previous'
          return_url = st_distribution_path(@st_use.st_product)
       end      
    end
    respond_to do |format|
      if @st_use.update_attributes(params[:st_use])
        format.html { redirect_to(return_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @st_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /st_uses/1
  # DELETE /st_uses/1.xml
  def destroy
    @st_use = StUse.find(params[:id])
    @st_use.destroy

    respond_to do |format|
      format.html { redirect_to(st_uses_url) }
      format.xml  { head :ok }
    end
  end
end
