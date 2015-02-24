class PcIndicatorsController < ApplicationController
  def show
  	@pc_product = get_pc_product(params[:id])#
    if @pc_product      
      @indicators = Indicator.find_all_by_sector("printed")
      @product = @pc_product.product

      @step = 2
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @pc_product.product.name, edit_product_url(@pc_product.product)
      add_breadcrumb _("Environmental Assessment").html_safe, pc_production_init_path(@pc_product)
      add_breadcrumb _("Data entry").html_safe, pc_indicator_path(@pc_product)
  	
  	  
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

  # POST /indicators
  # POST /indicators.xml
  def create
    @indicator = Indicator.new(params[:indicator])

    respond_to do |format|
      if @indicator.save
        format.html { redirect_to(@indicator, :notice => 'Indicator was successfully created.') }
        format.xml  { render :xml => @indicator, :status => :created, :location => @indicator }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @indicator.errors, :status => :unprocessable_entity }
      end
    end
  end


  # PUT /indicators/1
  # PUT /indicators/1.xml
  def update
    @indicator = Indicator.find(params[:id])

    respond_to do |format|
      if @indicator.update_attributes(params[:indicator])
        format.html { redirect_to(@indicator, :notice => 'Indicator was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @indicator.errors, :status => :unprocessable_entity }
      end
    end
  end


 

end
