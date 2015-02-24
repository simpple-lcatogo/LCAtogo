# encoding: UTF-8
class BpProductionController < ApplicationController
  before_filter :require_user

  def init
    @bp_product = get_bp_product(params[:bp_production_id])
    @product = @bp_product.product
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @bp_product.product.name, edit_product_url(@bp_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, bp_production_init_path(@bp_product)
  end

 
  def intro
    @step = 0
    @bp_product = get_bp_product(params[:bp_production_id])
    @product = @bp_product.product
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @bp_product.product.name, edit_product_url(@bp_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, bp_production_init_path(@bp_product)
    add_breadcrumb _("Introduction").html_safe, bp_production_intro_path(@bp_product)
  end
 
  def show

    @bp_product = get_bp_product(params[:id])

    if @bp_product      
      @step = 1
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @bp_product.product.name, edit_product_url(@bp_product.product)
      add_breadcrumb _("Environmental Assessment").html_safe, bp_production_init_path(@bp_product)
      add_breadcrumb _("Data entry").html_safe, bp_production_url(@bp_product)
      
      @product = @bp_product.product
      
      @bp_material_datas = @bp_product.bp_material_datas
      @bp_compound_material_datas = @bp_product.bp_compound_material_datas

      @bp_materials_bio_based = BpMaterial.where("based_type = ?","bio").sort_by{ |k| k['name'] }
      @bp_materials_oil_based = BpMaterial.where("based_type = ?","oil").sort_by{ |k| k['name'] }

      @bp_compound_materials = BpCompoundMaterial.all.sort_by{ |k| k['name'] }

      @bp_compound_families = BpCompoundFamily.where("name != ?","Master-batch").sort_by{ |k| k['name'] }
      @bp_compound_family_master_batch = BpCompoundFamily.find_by_name("Master-batch")

      @bp_units = BpUnit.all.sort_by{ |k| k['name'] }
      
       

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
     @bp_product = BpProduct.find(params[:bp_product_id].to_i)
     if @bp_product.product.step < 2     
       @bp_product.product.step = 1
       @bp_product.product.save
     end      
    
     respond_to do |format|
        format.html { redirect_to bp_transport_to_converter_url(@bp_product)}
     end   
  end      

  def next_intro_step
     @bp_product = BpProduct.find(params[:bp_product_id].to_i)

     respond_to do |format|
        format.html { redirect_to bp_production_url(@bp_product)}
     end   
  end      

  def update_functional_unit
     @bp_product = BpProduct.find(params[:bp_product_id].to_i)
     update_value = params[:update_value]
     @bp_product.functional_unit = update_value
     if @bp_product.save
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