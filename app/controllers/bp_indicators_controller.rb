class BpIndicatorsController < ApplicationController
  def show
  	@bp_product = get_bp_product(params[:id])#
    if @bp_product      
      @indicators = Indicator.find_all_by_sector("bio-plastic")
      @product = @bp_product.product

      @step = 6
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @bp_product.product.name, edit_product_url(@bp_product.product)
      add_breadcrumb _("Environmental Assessment").html_safe, bp_production_init_path(@bp_product)
      add_breadcrumb _("Data entry").html_safe, bp_production_url(@bp_product)

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
        format.html { redirect_to(@indicator) }
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
        format.html { redirect_to(@indicator) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @indicator.errors, :status => :unprocessable_entity }
      end
    end
  end


 def previous_step
     @bp_product = BpProduct.find(params[:bp_product_id].to_i)
     respond_to do |format|
        format.html { redirect_to bp_end_of_life_url(@bp_product)}
     end   
  end 

end
