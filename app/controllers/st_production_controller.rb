class StProductionController < ApplicationController
  def init

    @st_product = get_st_product(params[:st_product_id])
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @st_product.product.name, edit_product_url(@st_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, st_production_init_path(@st_product)
  end

  def intro
    @step = 0
    @st_product = get_st_product(params[:st_product_id])

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @st_product.product.name, edit_product_url(@st_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, st_production_init_path(@st_product)
    add_breadcrumb _("Introduction").html_safe, st_production_intro_path(@st_product)
  end

end
