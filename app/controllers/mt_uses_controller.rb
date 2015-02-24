class MtUsesController < ApplicationController
  # GET /mt_uses
  # GET /mt_uses.xml
  def index
    @mt_uses = MtUse.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mt_uses }
    end
  end

  # GET /mt_uses/1
  # GET /mt_uses/1.xml
  def show
    @mt_product = MtProduct.find(params[:id])
    @product = @mt_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @mt_product.product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, mt_production_init_path(@mt_product)
    add_breadcrumb _("Data entry").html_safe, mt_use_url(@mt_product)

    if @mt_product
      @step = 4
      if !@mt_product.mt_use
        mt_use = MtUse.new
        mt_use.mt_product_id = @mt_product.id
        mt_use.save
        @mt_product.mt_use = mt_use
      end

      @mt_use = @mt_product.mt_use
      
      family_electricity = MtEnergyFamily.find_by_name("Electricity")
      @mt_energy_processes = MtEnergyProcess.find_all_by_mt_energy_family_id(family_electricity.id).sort_by{ |k| k['name'] }
      @mt_families = MtFamily.all
      @mt_energy_families = MtEnergyFamily.find_all_by_name("Other Energy")
      @mt_use_additional_energy_datas = @mt_product.mt_use_additional_energy_datas
      @mt_use_operating_resource_datas = @mt_product.mt_use_operating_resource_datas      
      @mt_subsystems = MtSubsystem.all
      @mt_use_machine_subsystem_datas = @mt_product.mt_use_machine_subsystem_datas  
      @mt_consumables = MtConsumable.all
      
      @detailed = false
      if @mt_product.mt_assessment && @mt_product.mt_assessment.assessment_type == 'detailed'
        @detailed = true
      end        
      
      respond_to do |format|
        format.html # show.html.erb
      end
    end        
  end

  # GET /mt_uses/new
  # GET /mt_uses/new.xml
  def new
    @mt_use = MtUse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mt_use }
    end
  end

  # GET /mt_uses/1/edit
  def edit
    @mt_use = MtUse.find(params[:id])
  end

  # POST /mt_uses
  # POST /mt_uses.xml
  def create
    @mt_use = MtUse.new(params[:mt_use])

    respond_to do |format|
      if @mt_use.save
        format.html { redirect_to(@mt_use, :notice => 'Mt use was successfully created.') }
        format.xml  { render :xml => @mt_use, :status => :created, :location => @mt_use }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mt_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mt_uses/1
  # PUT /mt_uses/1.xml
  def update
    @mt_use = MtUse.find(params[:id])
    return_url = ''
    if params[:arrow]
       if params[:arrow] == 'next'
          return_url = mt_end_of_life_path(@mt_use.mt_product)     
       end
       if params[:arrow] == 'previous'
          return_url = mt_distribution_path(@mt_use.mt_product)
       end      
    end

    respond_to do |format|
      if @mt_use.update_attributes(params[:mt_use])
        format.html { redirect_to(return_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mt_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mt_uses/1
  # DELETE /mt_uses/1.xml
  def destroy
    @mt_use = MtUse.find(params[:id])
    @mt_use.destroy

    respond_to do |format|
      format.html { redirect_to(mt_uses_url) }
      format.xml  { head :ok }
    end
  end
end
