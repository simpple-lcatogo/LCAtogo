class PcBasicDataEntryController < ApplicationController
  def show
    @pc_product = PcProduct.find(params[:id])
    @product = @pc_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @pc_product.product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, pc_production_init_path(@pc_product)
    add_breadcrumb _("Data entry").html_safe, pc_basic_data_entry_url(@pc_product)
  end

end
