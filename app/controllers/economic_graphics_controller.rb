class EconomicGraphicsController < ApplicationController
  before_filter :require_user
 
  def show
    @product = get_product(params[:id])
    if @product      
      @step = 2
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @product.name, product_url(@product)
      add_breadcrumb _("LCC - based module").html_safe, economic_graphic_url(@product)
      
      @materials = 0
      @manufacturing = 0
      @distribution = 0
      @use = 0
      @endoflife = 0      
      
      @product.economic.electronic_economics.each do |electronic_economic|
         if electronic_economic.economical_phase.name == 'Materials' &&
            electronic_economic.economical_family.name == 'Materials'
           sum = 0
           @product.material_datas.each do |material_data|
             if material_data.material
               if material_data.material.id == electronic_economic.material.id
                 sum = sum + material_data.quantity
               end
             end 
            end
            @materials = @materials + (electronic_economic.quantity * sum)
          end    
         if electronic_economic.economical_phase.name == 'Materials' &&
            electronic_economic.economical_family.name == 'Components'    
            sum = 0
           @product.component_datas.each do |component_data|
             if component_data.material
               if component_data.material.id == electronic_economic.material.id
                 sum = sum + 1
               end
             end
           end
           
           @materials = @materials + (electronic_economic.quantity * sum)
         end
         if electronic_economic.economical_phase.name == 'Manufacturing'
           sum = 0
           @product.manufacturing_datas.each do |manufacturing_data|
             if manufacturing_data.material
               if manufacturing_data.material.id == electronic_economic.material.id
                 sum = sum + manufacturing_data.quantity
               end
             end 
            end
            @manufacturing = @manufacturing + (electronic_economic.quantity * sum)
         end
         if electronic_economic.economical_phase.name == 'Distribution'
           @distribution = @distribution + 1
         end
         if electronic_economic.economical_phase.name == 'Use' &&
            electronic_economic.economical_family.name == 'Repair&Maintenance'    
           sum = 0
           @product.repair_uses.each do |repair_use|
            if repair_use.material
               if repair_use.material.id == electronic_economic.material.id
                 sum = sum + repair_use.quantity
               end
             end            
           end
           @use = @use + (electronic_economic.quantity * sum)
         end
         
         if electronic_economic.economical_phase.name == 'Use' &&
            electronic_economic.economical_family.name == 'Energy consumption'    
           sum = 0
           @product.consumption_uses.each do |consumption_use|
             partial_value = ((consumption_use.consumption.to_f * consumption_use.time_mode.to_f) / 100.to_f).to_f
             partial_value = partial_value * 8.760
             if @product.use.lifetime
               sum += partial_value * @product.use.lifetime
             end                        
           end
           @use = @use + (electronic_economic.quantity * sum)
         end
         
         
         if electronic_economic.economical_phase.name == 'End-of-life'
           sum = 0
           @product.reuse_end_of_lives.each do |reuse_end_of_life|
            if reuse_end_of_life.material
               if reuse_end_of_life.material.id == electronic_economic.material.id
                 sum = sum + 1
               end
             end            
           end
           @product.recycling_end_of_lives.each do |recycling_end_of_life|
            if recycling_end_of_life.material
               if recycling_end_of_life.material.id == electronic_economic.material.id
                 sum = sum + 1
               end
             end            
           end
           
           @endoflife = @endoflife + (electronic_economic.quantity * sum)
         end
  
  
  
         @total = @materials + @manufacturing + @distribution + @use + @endoflife

         @datas = Array.new
         @datas << @total
         @datas << @materials
         @datas << @manufacturing
         @datas << @distribution
         @datas << @use
         @datas << @endoflife

         @labels = Array.new
         @labels << _('TOTAL')
         @labels << _('MATERIALS')
         @labels << _('MANUFACTURING')
         @labels << _('DISTRIBUTION')
         @labels << _('USE')
         @labels << _('END-OF-LIFE')
     
  
      end
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