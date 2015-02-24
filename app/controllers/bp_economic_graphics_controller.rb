class BpEconomicGraphicsController < ApplicationController
  include ApplicationHelper
  before_filter :require_user
 
  def show
    @step = 2
    @bp_product = BpProduct.find(params[:id])
    @product = @bp_product.product
    if @bp_product           
      @step = 2
      
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @bp_product.product.name, edit_product_url(@bp_product.product)
      add_breadcrumb _("Environmental Assessment").html_safe, bp_production_init_path(@bp_product)
      add_breadcrumb _("Economic data").html_safe, bp_economic_url(@product.bp_product)

      @materials = 0
      @raw_materials = 0
      @compounding = 0
      
      @transport = 0
      
      @processing = 0
      @processes = 0
      @finishing = 0      
      @processing_transport = 0
      
      @distribution = 0
      @packaging = 0
      @distribution_transport = 0
      
      
      @endoflife = 0      
      
      landfill_perc = 0
      incineration_perc = 0
      composting_perc = 0
      recycling_perc = 0          
      packaging_to_endoflife = 0
      

      @bp_product.bp_economic.bp_electronic_economics.each do |bp_electronic_economic|
         if bp_electronic_economic.bp_economical_phase.name == 'Raw materials' &&
            bp_electronic_economic.bp_economical_family.name == 'Raw materials'
           sum = 0
           @bp_product.bp_material_datas.each do |bp_material_data|         
              if bp_material_data.bp_material
               if bp_material_data.bp_material.id == bp_electronic_economic.bp_material.id
                 sum = sum + bp_material_data.quantity
               end
             end 
            end
            @materials = @materials + (bp_electronic_economic.quantity * sum)
            @raw_materials = @raw_materials + (bp_electronic_economic.quantity * sum)
          end    
          
         if bp_electronic_economic.bp_economical_phase.name == 'Raw materials' &&
            bp_electronic_economic.bp_economical_family.name == 'Compounding materials and master-batch'    
            sum = 0
            if bp_electronic_economic.bp_compound_material.name == 'Master-batch'
              sum = sum + bp_electronic_economic.quantity
            end
           @bp_product.bp_compound_material_datas.each do |bp_compound_material_data|
              if bp_compound_material_data.bp_compound_material
               if bp_compound_material_data.bp_compound_material.id == bp_electronic_economic.bp_compound_material.id
                 sum = sum + bp_compound_material_data.amount
               end
             end
           end
           
           @materials = @materials + (bp_electronic_economic.quantity * sum)
           @compounding = @compounding + (bp_electronic_economic.quantity * sum)           
         end
         
         
         if bp_electronic_economic.bp_economical_phase.name == 'Transport'
           sum = 0
           @bp_product.bp_transport_to_converter_datas.each do |bp_transport_to_converter_data|
             if bp_transport_to_converter_data.bp_vehicle
               if bp_transport_to_converter_data.bp_vehicle.id == bp_electronic_economic.bp_vehicle.id
                 sum = sum + (bp_transport_to_converter_data.amount * bp_transport_to_converter_data.distance)
               end
             end 
            end
            @transport = @transport + (bp_electronic_economic.quantity * sum)
         end
         
         
         
         if bp_electronic_economic.bp_economical_phase.name == 'Processing' &&
            bp_electronic_economic.bp_economical_family.name == 'Processes'    
            sum = 0
           @bp_product.bp_manufacturing_datas.each do |bp_manufacturing_data|
              if bp_manufacturing_data.bp_manufacturing_process
               if bp_manufacturing_data.bp_manufacturing_process.id == bp_electronic_economic.bp_manufacturing_process.id
                 sum = sum + bp_manufacturing_data.quantity
               end
             end
           end
           
           @processing = @processing + (bp_electronic_economic.quantity * sum)
           @processes = @processes + (bp_electronic_economic.quantity * sum)
         end
         
         
         if bp_electronic_economic.bp_economical_phase.name == 'Processing' &&
            bp_electronic_economic.bp_economical_family.name == 'Transport'    
            sum = 0
           @bp_product.bp_manufacturing_transport_datas.each do |bp_manufacturing_transport_data|
              if bp_manufacturing_transport_data.bp_vehicle
               if bp_manufacturing_transport_data.bp_vehicle.id == bp_electronic_economic.bp_vehicle.id
                 sum = sum + (bp_manufacturing_transport_data.amount * bp_manufacturing_transport_data.distance)
               end
             end
           end
           
           @processing = @processing + (bp_electronic_economic.quantity * sum)
           @processing_transport = @processing_transport + (bp_electronic_economic.quantity * sum)           
         end

         if bp_electronic_economic.bp_economical_phase.name == 'Processing' &&
            bp_electronic_economic.bp_economical_family.name == 'Finishing'    
            sum = 0
           @bp_product.bp_finishing_datas.each do |bp_finishing_data|
              if bp_finishing_data.bp_manufacturing_process
               if bp_finishing_data.bp_manufacturing_process.id == bp_electronic_economic.bp_manufacturing_process.id
                 sum = sum + bp_finishing_data.quantity
               end
             end
           end

           
           @processing = @processing + (bp_electronic_economic.quantity * sum)
           @finishing = @finishing + (bp_electronic_economic.quantity * sum)           
         end





         if bp_electronic_economic.bp_economical_phase.name == 'Distribution' &&
            bp_electronic_economic.bp_economical_family.name == 'Packaging'    
            sum = 0
            @bp_product.bp_packaging_datas.each do |bp_packaging_data|
                bp_distribution_default_value = bp_packaging_data.bp_distribution_default_value
                if bp_distribution_default_value && bp_electronic_economic.bp_distribution_default_value && bp_distribution_default_value.id == bp_electronic_economic.bp_distribution_default_value.id
                 sum = sum + bp_packaging_data.amount
               end            
            end

           @distribution = @distribution + (bp_electronic_economic.quantity * sum)           
           @packaging = @packaging + (bp_electronic_economic.quantity * sum)

           
         end

          if bp_electronic_economic.bp_economical_phase.name == 'Distribution' &&
            bp_electronic_economic.bp_economical_family.name == 'Transport'    
            sum = 0
            @bp_product.bp_transport_to_customer_datas.each do |bp_transport_to_customer_data|
              if bp_transport_to_customer_data.bp_vehicle
               if bp_transport_to_customer_data.bp_vehicle.id == bp_electronic_economic.bp_vehicle.id
                 sum = sum + (bp_transport_to_customer_data.amount * bp_transport_to_customer_data.distance)                 
               end
             end
           end
           
           @distribution = @distribution + (bp_electronic_economic.quantity * sum)
           @distribution_transport = @distribution_transport + (bp_electronic_economic.quantity * sum)
       end

     end
  
     @total = @materials + @transport + @processing + @distribution + @endoflife
 
     @datas = Array.new
     @datas << @total    
     @datas << @materials
     @datas << @raw_materials
     @datas << @compounding     
     
     @datas << @transport
     
     @datas << @processing
     @datas << @processes     
     @datas << @finishing     
     @datas << @processing_transport
     
     @datas << @distribution
     @datas << @packaging
     @datas << @distribution_transport

     @labels = Array.new
     @labels << decode_html(_('TOTAL'))
     @labels << decode_html(_('RAW MATERIALS'))
     @labels << decode_html(_('Raw Materials'))
     @labels << decode_html(_('Compounding Materials'))
     @labels << decode_html(_('TRANSPORT'))
     @labels << decode_html(_('PROCESSING'))
     @labels << decode_html(_('Processes'))
     @labels << decode_html(_('Finishing'))
     @labels << decode_html(_('Transport'))
     @labels << decode_html(_('DISTRIBUTION'))
     @labels << decode_html(_('Packaging'))
     @labels << decode_html(_('Transport'))

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
     @product = Product.find(params[:product_id].to_i)
     respond_to do |format|
        format.html { redirect_to graphic_url(@product)}
     end   
  end      


end  