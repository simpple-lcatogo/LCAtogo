class MtProductionController < ApplicationController
  before_filter :require_user

  def init
    @mt_product = get_mt_product(params[:mt_production_id])
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @mt_product.product.name, edit_product_url(@mt_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, mt_production_init_path(@mt_product)
  end

 
  def intro
    @step = 0
    @mt_product = get_mt_product(params[:mt_production_id])
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @mt_product.product.name, edit_product_url(@mt_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, mt_production_init_path(@mt_product)
    add_breadcrumb _("Introduction").html_safe, mt_production_intro_path(@mt_product)
  end
 
  def improvement   
    @mt_product = get_mt_product(params[:mt_production_id])
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @mt_product.product.name, edit_product_url(@mt_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, mt_production_init_path(@mt_product)
    add_breadcrumb _("Improvements").html_safe, mt_production_intro_path(@mt_product)
  end 
 
  def show

    @mt_product = get_mt_product(params[:id])#

    if @mt_product      
      @step = 1
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @mt_product.product.name, edit_product_url(@mt_product.product)
      add_breadcrumb _("Environmental Assessment").html_safe, mt_production_init_path(@mt_product)
      add_breadcrumb _("Data entry").html_safe, mt_production_url(@mt_product)
  
      
      @mt_material_datas = @mt_product.mt_material_datas
      @mt_compound_material_datas = @mt_product.mt_compound_material_datas

      @mt_materials_bio_based = BpMaterial.where("based_type = ?","bio").sort_by{ |k| k['name'] }
      @mt_materials_oil_based = BpMaterial.where("based_type = ?","oil").sort_by{ |k| k['name'] }

      @mt_compound_materials = BpCompoundMaterial.all.sort_by{ |k| k['name'] }

      @mt_compound_families = BpCompoundFamily.where("name != ?","Master-batch").sort_by{ |k| k['name'] }
      @mt_compound_family_master_batch = BpCompoundFamily.find_by_name("Master-batch")

      @mt_units = BpUnit.all.sort_by{ |k| k['name'] }

      respond_to do |format|
        format.html # index.html.erb
      end
    else
     respond_to do |format|
        format.html { redirect_to(products_url) }
        format.xml { head :ok }
     end      
   end

  
  end

  def destroy    
  end

  def next_step
     @mt_product = BpProduct.find(params[:mt_product_id].to_i)
     if @mt_product.product.step < 2     
       @mt_product.product.step = 1
       @mt_product.product.save
     end      
    
     respond_to do |format|
        format.html { redirect_to mt_transport_to_converter_url(@mt_product)}
     end   
  end      

  def next_intro_step
     @mt_product = BpProduct.find(params[:mt_product_id].to_i)

     respond_to do |format|
        format.html { redirect_to mt_production_url(@mt_product)}
     end   
  end      

  def update_functional_unit
     @mt_product = BpProduct.find(params[:mt_product_id].to_i)
     update_value = params[:update_value]
     @mt_product.functional_unit = update_value
     if @mtproduct.save
        respond_to do |format|
          format.html {render :inline => update_value }
          format.xml  { head :ok }
        end 
     else
        respond_to do |format|
          format.html {render :inline => params[:original_value]}
          format.xml  { head :ok }
        end  
     end 

  end      
  
  
end  