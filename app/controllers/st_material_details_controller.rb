class StMaterialDetailsController < ApplicationController

  def show

    @st_product = StProduct.find(params[:id])
    @product = @st_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @st_product.product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, st_production_init_path(@st_product)
    add_breadcrumb _("Data entry").html_safe, st_material_detail_url(@st_product)

    if @st_product
      @step = 1
      if !@st_product.st_material_detail
        st_material_detail = StMaterialDetail.new
        st_material_detail.st_product_id = @st_product.id
        st_material_detail.save
        @st_product.st_material_detail = st_material_detail
      end

      #@se_use_consumption = @se_product.se_use_consumption
      @st_material_detail = @st_product.st_material_detail
      @st_materials = StMaterial.all
      @st_families = StFamily.all
      @st_material_datas = @st_product.st_material_datas
      
      
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
        redirect_to(st_manufacturing_path(@st_product))
      else
        render :action => "show"
      end

  end

end
