class StDistributionsController < ApplicationController

  def show

    @st_product = StProduct.find(params[:id])
    @product = @st_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @st_product.product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, st_production_init_path(@st_product)
    add_breadcrumb _("Data entry").html_safe, st_distribution_url(@st_product)

    if @st_product
      @step = 3

      @st_packaging_types = StPackagingType.all
      @st_family_transports = StFamilyTransport.all
      @st_transports = StTransport.all
      
      @st_packaging_datas = @st_product.st_packaging_datas
      @st_transport_datas = @st_product.st_transport_datas
      
      respond_to do |format|
        format.html # show.html.erb
      end
    end

  end

  def update
    @st_material_detail = StMaterialDetail.find(params[:id])
    @st_product = @st_material_detail.st_product
    @product = @st_product.product


      if @st_material_detail.update_attributes(params[:st_material_detail])
        redirect_to(st_material_detail_path(@st_material_detail.st_product))
      else
        render :action => "show"
      end

  end

 def next_step
    @st_product = StProduct.find(params[:st_product_id].to_i)
    respond_to do |format|
      format.html { redirect_to st_use_path(@st_product)}
    end
  end

  def previous_step
    @st_product = StProduct.find(params[:st_product_id].to_i)
    respond_to do |format|
      format.html { redirect_to st_manufacturing_path(@st_product)}
    end
  end

end
