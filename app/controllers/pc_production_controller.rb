class PcProductionController < ApplicationController
  before_filter :require_user

  def init
    @pc_product = PcProduct.find(params[:pc_production_id])
    @product = @pc_product.product
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @pc_product.product.name, edit_product_url(@pc_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, pc_production_init_path(@pc_product)
  end

  def intro
    @step = 0
    @pc_product = PcProduct.find(params[:pc_production_id])
    @product = @pc_product.product
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @pc_product.product.name, edit_product_url(@pc_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, pc_production_init_path(@pc_product)
    add_breadcrumb _("Introduction").html_safe, pc_production_intro_path(@pc_product)
  end

end
