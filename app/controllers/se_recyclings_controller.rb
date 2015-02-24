class SeRecyclingsController < ApplicationController

  # GET /se_recyclings/1
  # GET /se_recyclings/1.xml
  def show
    @se_product = SeProduct.find(params[:id])
    @product = @se_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @se_product.product.name, edit_product_url(@se_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, se_production_init_path(@se_product)
    add_breadcrumb _("Data entry").html_safe, se_manufacturing_url(@se_product)

    @se_production_yield_loss_materials = SeProductionYieldLossMaterial.all.sort_by{ |k| k['order'] }
    @se_recycling_datas = @se_product.se_recycling_datas

    if @se_product      
      @step = 6
      respond_to do |format|
        format.html # show.html.erb
      end
    else
      respond_to do |format|
       format.html { redirect_to(products_url) }
        format.xml { head :ok }
      end
    end
    
  end

  def next_step
    @se_product = SeProduct.find(params[:se_product_id].to_i)
    if @se_product.product.step < 7
      @se_product.product.step = 6
      @se_product.product.save
    end

    respond_to do |format|
      format.html { redirect_to se_result_url(@se_product)}
    end
  end

  def previous_step
    @se_product = SeProduct.find(params[:se_product_id].to_i)
    respond_to do |format|
      format.html { redirect_to se_use_cost_url(@se_product)}
    end
  end

end
