class MtRawMaterialsController < ApplicationController

  def show

    @mt_product = MtProduct.find(params[:id])
    @product = @mt_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @mt_product.product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, mt_production_init_path(@mt_product)
    add_breadcrumb _("Data entry").html_safe, mt_raw_material_url(@mt_product)

    if @mt_product
      @step = 1
      @mt_materials = MtMaterial.all
      @mt_families_materials = Array.new 
      @mt_families_suppliers = Array.new      

      
      @mt_families_materials << MtFamily.find_by_name("Plastics")   
      @mt_families_materials << MtFamily.find_by_name("Metals")      
      @mt_families_materials << MtFamily.find_by_name("Other")      
      
      
      @mt_families_suppliers << MtFamily.find_by_name("Supplier parts - Electronics")   
      @mt_families_suppliers << MtFamily.find_by_name("Supplier parts - Others")

      
      
      @mt_families = Array.new
      @mt_families << MtFamily.find_by_name("Plastics")  
      @mt_families << MtFamily.find_by_name("Metals")
      @mt_families << MtFamily.find_by_name("Supplier parts - Electronics")
      @mt_families << MtFamily.find_by_name("Supplier parts - Others")
      @mt_families << MtFamily.find_by_name("Other")
      
      
      
      @mt_material_datas = @mt_product.mt_material_datas
      @mt_supplier_datas = @mt_product.mt_supplier_datas
      @mt_predefined_supplier_datas = @mt_product.mt_predefined_supplier_datas
      @mt_user_supplier_datas = @mt_product.mt_user_supplier_datas  
      @mt_transport_types = MtTransportType.all
      @mt_supplier_part_datas = @mt_product.mt_supplier_part_datas
      @mt_manufacturing_processes = MtManufacturingProcess.all
      
      @product_weight = 0
      if @mt_product.mt_assessment
         @product_weight = @mt_product.mt_assessment.weight
      end
      
      @detailed = false
      if @mt_product.mt_assessment && @mt_product.mt_assessment.assessment_type == 'detailed'
        @detailed = true
      end
      
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

 def next_step
    @mt_product = MtProduct.find(params[:mt_product_id].to_i)
    respond_to do |format|
      format.html { redirect_to mt_manufacturing_path(@mt_product)}
    end
  end

end
