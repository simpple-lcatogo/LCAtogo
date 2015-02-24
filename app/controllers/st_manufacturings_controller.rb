class StManufacturingsController < ApplicationController

  def show

    @st_product = StProduct.find(params[:id])
    @product = @st_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @st_product.product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, st_production_init_path(@st_product)
    add_breadcrumb _("Data entry").html_safe, st_manufacturing_url(@st_product)

    if @st_product
      @step = 2
      st_energy_types = StEnergyType.all
      @st_energy_types = Array.new
      st_energy_types.each do |st_energy_type|
        if st_energy_type.name != 'Charging Battery with power from grid' 
          @st_energy_types << st_energy_type
        end
      end
      
      
      @st_energy_sources = StEnergySource.all
      @st_family_processes = StFamilyProcess.all
      @st_processes = StProcess.all
      
      @st_energy_datas = @st_product.st_energy_datas
      @st_process_datas = @st_product.st_process_datas      
      
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
      format.html { redirect_to st_distribution_path(@st_product)}
    end
  end

  def previous_step
    @st_product = StProduct.find(params[:st_product_id].to_i)
    respond_to do |format|
      format.html { redirect_to st_material_detail_path(@st_product)}
    end
  end

end
