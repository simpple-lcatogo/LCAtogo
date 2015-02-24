class StResultsController < ApplicationController
   include ApplicationHelper  
  # GET /st_uses
  # GET /st_uses.xml
  def index
    @st_uses = StUse.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @st_uses }
    end
  end


  def do_results(st_product)
      @tmp = 0
      if st_product.st_use && st_product.st_use.lifetime
         @tmp = st_product.st_use.lifetime
      end   
      if st_product.st_end_of_life && st_product.st_end_of_life.repair == 'yes' && st_product.st_end_of_life.lifetime
         @tmp += st_product.st_end_of_life.lifetime
      end   
      if @tmp == 0
        @tmp = 0.000000000000000000001
      end
      @auxiliary = (1.to_f/@tmp.to_f).to_f
      total_materials_kg = 0
            
      @colors = ["0033FF","00CCFF","336600","663300","CC6600","FF3300","FFCC00","FFFF00", "008B8B"] 
      @colors_bar = ["696969","9933FF","1E90FF","8B0000","006400"]
      
      results_created = false
      results_to_delete = StResult.find_all_by_st_product_id(st_product.id)        
      results_to_delete.each do |result|
         result_values_to_delete = StResultValue.find(:all, :conditions => ["st_result_id = ?" , result.id])
         StResultValue.delete(result_values_to_delete)
         if !result.has_checkbox
            result.delete
         end   
         results_created = true
      end
      

    if !results_created          
       root_result = StResult.new(:st_product_id => st_product.id, :name_en => "Total", :name_ca => "Total", :name_es => "Total", :parent_id => -1, :has_checkbox => true)
       root_result.save   
       
       ## MATERIALS
       materials_result = StResult.new(:st_product_id => st_product.id, :name_en => "MATERIALS", :name_ca => "MATERIALS", :name_es => "MATERIALS", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
       materials_result.save

       materials_materials_result = StResult.new(:st_product_id => st_product.id, :name_en => "Materials", :name_ca => "Materials", :name_es => "Materials", :parent_id => materials_result.id, :check_graphic => true, :has_checkbox => true)
       materials_materials_result.save
       
       ## MANUFACTURING
       manufacturing_result = StResult.new(:st_product_id => st_product.id, :name_en => "MANUFACTURING", :name_ca => "MANUFACTURING", :name_es => "MANUFACTURING", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
       manufacturing_result.save

       energy_result = StResult.new(:st_product_id => st_product.id, :name_en => "Energy", :name_ca => "Energy", :name_es => "Energy", :parent_id => manufacturing_result.id, :check_graphic => true, :has_checkbox => true)
       energy_result.save
              
       processes_result = StResult.new(:st_product_id => st_product.id, :name_en => "Processes", :name_ca => "Processes", :name_es => "Processes", :parent_id => manufacturing_result.id, :check_graphic => true, :has_checkbox => true)
       processes_result.save

              
              
       ## DISTRIBUTION
       distribution_result = StResult.new(:st_product_id => st_product.id, :name_en => "DISTRIBUTION", :name_ca => "DISTRIBUTION", :name_es => "DISTRIBUTION", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
       distribution_result.save

       packaging_result = StResult.new(:st_product_id => st_product.id, :name_en => "Packaging", :name_ca => "Packaging", :name_es => "Packaging", :parent_id => distribution_result.id, :check_graphic => true, :has_checkbox => true)
       packaging_result.save

       transport_result = StResult.new(:st_product_id => st_product.id, :name_en => "Transport", :name_ca => "Transport", :name_es => "Transport", :parent_id => distribution_result.id, :check_graphic => true, :has_checkbox => true)
       transport_result.save


       ## USE
       use_result = StResult.new(:st_product_id => st_product.id, :name_en => "USE", :name_ca => "USE", :name_es => "USE", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
       use_result.save
           
       consumptions_result = StResult.new(:st_product_id => st_product.id, :name_en => "Energy consumption", :name_ca => "Energy consumption", :name_es => "Energy consumption", :parent_id => use_result.id, :check_graphic => true, :has_checkbox => true)
       consumptions_result.save

       consumables_result = StResult.new(:st_product_id => st_product.id, :name_en => "Consumables", :name_ca => "Consumables", :name_es => "Consumables", :parent_id => use_result.id, :check_graphic => true, :has_checkbox => true)
       consumables_result.save
           
       ## END_OF_LIFE

       end_of_life_result = StResult.new(:st_product_id => st_product.id, :name_en => "END-OF-LIFE", :name_ca => "END-OF-LIFE", :name_es => "END-OF-LIFE", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
       end_of_life_result.save
       
       end_of_life_child_result = StResult.new(:st_product_id => st_product.id, :name_en => "Recycling", :name_ca => "Recycling", :name_es => "Recycling", :parent_id => end_of_life_result.id, :check_graphic => true, :has_checkbox => true)
       end_of_life_child_result.save
    else
       root_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(st_product.id, "Total", -1)

       ## MATERIALS
       materials_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(st_product.id, "MATERIALS", root_result.id)
       materials_materials_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(st_product.id, "Materials", materials_result.id)

       ## MANUFACTURING
       manufacturing_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(st_product.id, "MANUFACTURING", root_result.id)
       energy_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(st_product.id, "Energy", manufacturing_result.id)
       processes_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(st_product.id, "Processes", manufacturing_result.id)

       ## DISTRIBUTION
       distribution_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(st_product.id, "DISTRIBUTION", root_result.id)
       packaging_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(st_product.id, "Packaging", distribution_result.id)
       transport_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(st_product.id, "Transport", distribution_result.id)

       ## USE
       use_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(st_product.id, "USE", root_result.id)
       consumptions_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(st_product.id, "Energy consumption", use_result.id)
       consumables_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(st_product.id, "Consumables", use_result.id)

       ## END_OF_LIFE
       end_of_life_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(st_product.id, "END-OF-LIFE", root_result.id)
       end_of_life_child_result = StResult.find_by_st_product_id_and_parent_id(st_product.id , end_of_life_result.id)
    end  
      
      
      ###########################
      # MATERIALS
      ###########################
      
      
      
      @materials_ticks = ''
      @materials_values = ''      
      @materials_colors = ''
      
      @materials = 0
      materials_total = 0
      materials_percentage = 0
      index = 0
      
      st_product.st_material_datas.each_with_index do |st_material_data, index|

        if st_material_data.quantity
          if st_material_data.eco_cost
             materials_total += st_material_data.quantity * st_material_data.eco_cost
          else
             if st_material_data.user_eco_costs
                materials_total += st_material_data.quantity * st_material_data.user_eco_costs
             end
          end
        end
      end


      st_product.st_material_datas.each do |st_material_data|
        eco_cost_value = st_material_data.eco_cost
        if !eco_cost_value
           eco_cost_value = st_material_data.user_eco_costs
        end
        material_name = ''
        if st_material_data.st_material
          material_name = st_material_data.st_material.name
        else  
          material_name = st_material_data.user_material_name
        end
        if eco_cost_value && st_material_data.quantity
           value = st_material_data.quantity * eco_cost_value
           @materials += value
           percentage = ((value/materials_total).to_f * 100).round(2)
           ## MATERIALS
           tmp_result = StResult.new(:st_product_id => st_product.id, :name_en => material_name, :name_ca => material_name, :name_es => material_name, :parent_id => materials_materials_result.id, :check_graphic => true)
           tmp_result.save
           StResultValue.create(:st_result_id => tmp_result.id, :value => value, :value_year => value * @auxiliary)
                               
           if percentage >= 1
             if index > 0
                @materials_ticks += "|"
                @materials_values += ","
                @materials_colors += "|"
             end           
             @materials_ticks += material_name + "(" + percentage.to_s + " %)"
             @materials_values += value.to_s
             @materials_colors += @colors[index].to_s
             index = index + 1
           else
             materials_percentage += ((value/materials_total).to_f * 100)
           end  
        end
        if st_material_data.st_material && st_material_data.quantity && st_material_data.st_material.unit == 'kg'
           total_materials_kg += st_material_data.quantity
        end
        
      end
      
      if materials_percentage > 0
         @materials_ticks += "|Others(" + materials_percentage.round(2).to_s + "%)"
         @materials_values += "," + materials_percentage.to_s
         @materials_colors += "|" + @colors[index].to_s
      end
      


      ###########################
      # MANUFACTURING
      ###########################
            
      @manufacturing = 0  
      
      @manufacturing_ticks = ''
      @manufacturing_values = ''      
      @manufacturing_colors = ''
      manufacturing_total = 0 
      manufacturing_percentage = 0
      index = 0
      energy = 0
      processes = 0
      
      st_product.st_energy_datas.each do |st_energy_data|
        if st_energy_data.eco_cost && st_energy_data.quantity
           manufacturing_total += st_energy_data.quantity * st_energy_data.eco_cost
        end
      end
      st_product.st_process_datas.each do |st_process_data|
        if st_process_data.quantity
          if st_process_data.eco_cost
             manufacturing_total += st_process_data.quantity * st_process_data.eco_cost
          else
            if st_process_data.user_eco_costs
               manufacturing_total += st_process_data.quantity * st_process_data.user_eco_costs
            end
          end
        end
      end      
      
      
      st_product.st_energy_datas.each do |st_energy_data|
        if st_energy_data.eco_cost && st_energy_data.quantity
           value = st_energy_data.quantity * st_energy_data.eco_cost
           percentage = ((value / manufacturing_total).to_f * 100).round(2)           
           @manufacturing += value
           energy += value
           tmp_result = StResult.new(:st_product_id => st_product.id, :name_en => st_energy_data.st_energy_source.name, :name_ca => st_energy_data.st_energy_source.name, :name_es => st_energy_data.st_energy_source.name, :parent_id => energy_result.id, :check_graphic => true)
           tmp_result.save
           StResultValue.create(:st_result_id => tmp_result.id, :value => value, :value_year => value * @auxiliary)
           
           if percentage >= 1           
             if index > 0
                @manufacturing_ticks += "|"
                @manufacturing_values += ","
                @manufacturing_colors += "|"
             end
  
             @manufacturing_ticks += st_energy_data.st_energy_source.name + "(" + percentage.to_s + " %)"
             @manufacturing_values += value.to_s
             @manufacturing_colors += @colors[index].to_s        
             index = index + 1
          else
             manufacturing_percentage += ((value / manufacturing_total).to_f * 100)
          end
        end
      end
      
      
      st_product.st_process_datas.each do |st_process_data|
        eco_cost_value = st_process_data.eco_cost
        if !eco_cost_value
           eco_cost_value = st_process_data.user_eco_costs
        end
        process_name = ''
        if st_process_data.st_process
          process_name = st_process_data.st_process.name
        else  
          process_name = st_process_data.user_process_name
        end        
        
        if eco_cost_value && st_process_data.quantity
           value = st_process_data.quantity * eco_cost_value
           percentage = ((value / manufacturing_total).to_f * 100).round(2)   
           tmp_result = StResult.new(:st_product_id => st_product.id, :name_en => process_name, :name_ca => process_name, :name_es => process_name, :parent_id => processes_result.id, :check_graphic => true)
           tmp_result.save
           StResultValue.create(:st_result_id => tmp_result.id, :value => value, :value_year => value * @auxiliary)
           
           @manufacturing += value
           processes += value
           if percentage >= 1    
             if index > 0
                @manufacturing_ticks += "|"
                @manufacturing_values += ","
                @manufacturing_colors += "|"
             end
  
             @manufacturing_ticks += process_name + "(" + percentage.to_s + " %)"
             @manufacturing_values += value.to_s
             @manufacturing_colors += @colors[index].to_s                      
             index = index + 1
           else
             manufacturing_percentage += ((value / manufacturing_total).to_f * 100)
           end
        end
      end

      if manufacturing_percentage > 0
         @manufacturing_ticks += "|Others(" + manufacturing_percentage.round(2).to_s + "%)"
         @manufacturing_values += "," + manufacturing_percentage.to_s
         @manufacturing_colors += "|" + @colors[index].to_s
      end 

      ###########################
      # DISTRIBUTION
      ###########################

      @distribution = 0
      @distribution_ticks = ''
      @distribution_values = ''      
      @distribution_colors = ''
      distribution_total = 0
      distribution_percentage = 0      
      
      packaging = 0
      transport = 0
      
      st_product.st_packaging_datas.each do |st_packaging_data|
        if st_packaging_data.eco_cost && st_packaging_data.quantity
           distribution_total += st_packaging_data.quantity * st_packaging_data.eco_cost
        end
      end
      st_product.st_transport_datas.each do |st_transport_data|
        if st_transport_data.eco_cost && st_transport_data.quantity && st_transport_data.distance
           distribution_total += st_transport_data.quantity * st_transport_data.distance * st_transport_data.eco_cost
        end
      end


      index = 0
      st_product.st_packaging_datas.each do |st_packaging_data|
        if st_packaging_data.eco_cost && st_packaging_data.quantity
           value = st_packaging_data.quantity * st_packaging_data.eco_cost
           if distribution_total != 0
              percentage = ((value / distribution_total).to_f * 100).round(2)
           else 
              percentage = 0
           end
           tmp_result = StResult.new(:st_product_id => st_product.id, :name_en => st_packaging_data.st_packaging_type.name, :name_ca => st_packaging_data.st_packaging_type.name, :name_es => st_packaging_data.st_packaging_type.name, :parent_id => packaging_result.id, :check_graphic => true)
           tmp_result.save
           StResultValue.create(:st_result_id => tmp_result.id, :value => value, :value_year => value * @auxiliary)
            
           @distribution += value
           packaging += value
           if percentage >= 1            
             if index > 0
                @distribution_ticks += "|"
                @distribution_values += ","
                @distribution_colors += "|"
             end
  
             @distribution_ticks += st_packaging_data.st_packaging_type.name + "(" + percentage.to_s + " %)"
             @distribution_values += value.to_s
             @distribution_colors += @colors[index].to_s        
             index = index + 1
           else
             if distribution_total != 0
                distribution_percentage += ((value / distribution_total).to_f * 100)
             else
                distribution_percentage = 0
             end 
           end
        end
      end
      st_product.st_transport_datas.each do |st_transport_data|
        if st_transport_data.eco_cost && st_transport_data.quantity && st_transport_data.distance
           value = st_transport_data.quantity * st_transport_data.distance * st_transport_data.eco_cost
           if distribution_total != 0
              percentage = ((value / distribution_total).to_f * 100).round(2)
           else 
              percentage = 0
           end  
           tmp_result = StResult.new(:st_product_id => st_product.id, :name_en => st_transport_data.st_transport.name, :name_ca => st_transport_data.st_transport.name, :name_es => st_transport_data.st_transport.name, :parent_id => transport_result.id, :check_graphic => true)
           tmp_result.save
           StResultValue.create(:st_result_id => tmp_result.id, :value => value, :value_year => value * @auxiliary)
           
           @distribution += value
           transport += value
           if percentage >= 1    
             if index > 0
                @distribution_ticks += "|"
                @distribution_values += ","
                @distribution_colors += "|"
             end
  
             @distribution_ticks += st_transport_data.st_transport.name + "(" + percentage.to_s + " %)"
             @distribution_values += value.to_s
             @distribution_colors += @colors[index].to_s        
             index = index + 1      
           else
             if distribution_total != 0
                distribution_percentage += ((value / distribution_total).to_f * 100)
             else
                distribution_percentage = 0
             end 
           end
        end
      end

      if distribution_percentage > 0
         @distribution_ticks += "|Others(" + distribution_percentage.round(2).to_s + "%)"
         @distribution_values += "," + distribution_percentage.to_s
         @distribution_colors += "|" + @colors[index].to_s
      end 

      ###########################
      # USE
      ###########################

      @use = 0
      @use_year = 0
      @use_ticks = ''
      @use_values = ''      
      @use_colors = ''
      use_total = 0       
      use_percentage = 0    
      consumptions = 0
      consumables = 0      
      index = 0
      
      
      st_product.st_consumption_datas.each_with_index do |st_consumption_data|
        if st_consumption_data.eco_cost && st_consumption_data.quantity
           value = st_consumption_data.quantity * st_consumption_data.eco_cost
           use_total += value * @tmp
        end        
      end
      st_product.st_consumable_datas.each do |st_consumable_data|
        if st_consumable_data.eco_cost && st_consumable_data.quantity
           value = st_consumable_data.quantity * st_consumable_data.eco_cost
           use_total += value * @tmp           
        end              
      end      
      
      st_product.st_consumption_datas.each_with_index do |st_consumption_data|
        if st_consumption_data.eco_cost && st_consumption_data.quantity
           value = st_consumption_data.quantity * st_consumption_data.eco_cost
           @use += value * @tmp
           @use_year += value
           consumptions += value * @tmp
           tmp_result = StResult.new(:st_product_id => st_product.id, :name_en => st_consumption_data.st_energy_source.name, :name_ca => st_consumption_data.st_energy_source.name, :name_es => st_consumption_data.st_energy_source.name, :parent_id => consumptions_result.id, :check_graphic => true)
           tmp_result.save
           StResultValue.create(:st_result_id => tmp_result.id, :value => value * @tmp, :value_year => value * @tmp * @auxiliary)
           
           percentage = ((value * @tmp / use_total).to_f * 100).round(2)
           if percentage >= 1            
             if index > 0
                @use_ticks += "|"
                @use_values += ","
                @use_colors += "|"
             end
  
             @use_ticks += st_consumption_data.st_energy_source.name + "(" + percentage.to_s + " %)"
             @use_values += (value * @tmp).to_s
             @use_colors += @colors[index].to_s        
             index = index + 1
           else
             use_percentage += ((value * @tmp/ use_total).to_f * 100)
           end
        end        
      end
      st_product.st_consumable_datas.each do |st_consumable_data|
        if st_consumable_data.eco_cost && st_consumable_data.quantity
           value = st_consumable_data.quantity * st_consumable_data.eco_cost
           @use += value * @tmp
           @use_year += value
           consumables += value * @tmp
           
           tmp_result = StResult.new(:st_product_id => st_product.id, :name_en => st_consumable_data.st_material.name, :name_ca => st_consumable_data.st_material.name, :name_es => st_consumable_data.st_material.name, :parent_id => consumables_result.id, :check_graphic => true)
           tmp_result.save
           StResultValue.create(:st_result_id => tmp_result.id, :value => value * @tmp, :value_year => value * @tmp * @auxiliary)
           
           percentage = ((value * @tmp / use_total).to_f * 100).round(2)
           if percentage >= 1           
             if index > 0
                @use_ticks += "|"
                @use_values += ","
                @use_colors += "|"
             end
  
             @use_ticks += st_consumable_data.st_material.name + "(" + percentage.to_s + " %)"
             @use_values += (value * @tmp).to_s
             @use_colors += @colors[index].to_s        
             index = index + 1
           else
             use_percentage += ((value * @tmp/ use_total).to_f * 100)             
           end
        end              
      end
      
      if use_percentage > 0
         @use_ticks += "|Others (" + use_percentage.round(2).to_s + "%)"
         @use_values += "," + use_percentage.to_s
         @use_colors += "|" + @colors[index].to_s
      end       
      
      excel_209 = 0.0025612273
      excel_210 = 0.40196901
      excel_211 = 0.038422594     
      excel_212 = 0.8804381
      excel_213 = 0.3    
      excel_214 = 0.1288
      excel_215 = 0.30758305          
      
      @recycling_processes = 0
      if @st_product.st_material_detail.product_weight
        @recycling_processes += excel_209 * @st_product.st_material_detail.product_weight
        if @st_product.st_material_detail.textile_weight
           @recycling_processes += excel_211 * @st_product.st_material_detail.product_weight * (@st_product.st_material_detail.textile_weight / 100)
        end   
        if @st_product.st_material_detail.electronic_weight
           @recycling_processes += excel_210 * @st_product.st_material_detail.product_weight * (@st_product.st_material_detail.electronic_weight / 100)
        end   
      end 
       
      @incineration_processes = 0
      if @st_product.st_material_detail.product_weight
        @incineration_processes += excel_209 * @st_product.st_material_detail.product_weight
        if @st_product.st_material_detail.textile_weight
           @incineration_processes += excel_213 * @st_product.st_material_detail.product_weight * (@st_product.st_material_detail.textile_weight / 100)
        end   
        if @st_product.st_material_detail.electronic_weight
           @incineration_processes += excel_212 * @st_product.st_material_detail.product_weight * (@st_product.st_material_detail.electronic_weight / 100)
        end   
      end      
      
      @landfill_ewaste = 0
      @landfill_other = 0
      if @st_product.st_material_detail.product_weight && @st_product.st_material_detail.electronic_weight
         @landfill_ewaste = excel_215 * @st_product.st_material_detail.product_weight * (@st_product.st_material_detail.electronic_weight / 100)  
         @landfill_other = excel_214 * @st_product.st_material_detail.product_weight * ((100 - @st_product.st_material_detail.electronic_weight) / 100)      
     end
     @end_of_life = 0
if st_product.st_end_of_life

  temp_recycling = 0
  temp_incineration = 0
  st_product.st_material_datas.each do |st_material_data|
    st_end_of_life_data = StEndOfLifeData.find_by_st_material_data_id(st_material_data.id)
    if st_end_of_life_data
      temp_recycling += st_end_of_life_data.eco_cost_recycling
      temp_incineration += st_end_of_life_data.eco_cost_incineration
    end
  end

  st_product.st_packaging_datas.each do |st_packaging_data|
    st_end_of_life_data = StEndOfLifeData.find_by_st_packaging_data_id(st_packaging_data.id)
    if st_end_of_life_data
      if st_packaging_data.st_packaging_type
        temp_recycling += st_end_of_life_data.eco_cost_recycling
        temp_incineration += st_end_of_life_data.eco_cost_incineration
      end
    end
  end

  st_product.st_consumable_datas.each do |st_consumable_data|
    st_end_of_life_data = StEndOfLifeData.find_by_st_consumable_data_id(st_consumable_data.id)
    if st_end_of_life_data
      if st_consumable_data.st_material
        temp_recycling += st_end_of_life_data.eco_cost_recycling
        temp_incineration += st_end_of_life_data.eco_cost_incineration
      end
    end
  end





      if st_product.st_end_of_life.selected == 'recycling'
         @end_of_life = @recycling_processes + temp_recycling
         end_of_life_child_result.name_en = 'Recycling'
         end_of_life_child_result.name_ca = 'Recycling'
         end_of_life_child_result.name_es = 'Recycling'  
         end_of_life_child_result.save
         StResultValue.create(:st_result_id => end_of_life_child_result.id, :value => @end_of_life, :value_year => @end_of_life * @auxiliary)        
      end
      if st_product.st_end_of_life.selected == 'incineration'
         @end_of_life = @incineration_processes + temp_incineration
         end_of_life_child_result.name_en = 'Incineration'
         end_of_life_child_result.name_ca = 'Incineration'
         end_of_life_child_result.name_es = 'Incineration'  
         end_of_life_child_result.save        
         StResultValue.create(:st_result_id => end_of_life_child_result.id, :value => @end_of_life, :value_year => @end_of_life * @auxiliary)                 
      end
      if st_product.st_end_of_life.selected == 'landfilling'
         @end_of_life = @landfill_ewaste + @landfill_other
         @end_of_life = @incineration_processes
         end_of_life_child_result.name_en = 'Landfilling'
         end_of_life_child_result.name_ca = 'Landfilling'
         end_of_life_child_result.name_es = 'Landfilling'  
         end_of_life_child_result.save            
         StResultValue.create(:st_result_id => end_of_life_child_result.id, :value => @end_of_life, :value_year => @end_of_life * @auxiliary)                 
        
      end
 end     
      @total = @materials + @manufacturing + @distribution + @use + @end_of_life
      
      @total_year = ((@materials + @manufacturing + @distribution + @end_of_life) * @auxiliary) + @use_year

      
      if @total == 0         
        @total_year = 0
        @auxiliary = 0
      end  

      
      st_results = StResult.find(:all, :conditions => ["st_product_id = ?", st_product.id])
      st_results.each do |st_result|
        st_result_value = StResultValue.find_by_st_result_id(st_result.id)
        if st_result_value
           st_result_value.percentage = (st_result_value.value / @total) * 100
           st_result_value.save           
        end
      end
      
      StResultValue.create(:st_result_id => root_result.id, :value => @total, :value_year => @total_year, :percentage => (@total != 0)?((@total / @total) * 100):0)

      StResultValue.create(:st_result_id => materials_result.id, :value => @materials, :value_year => @materials * @auxiliary, :percentage => (@total != 0)?((@materials / @total) * 100):0)
      StResultValue.create(:st_result_id => materials_materials_result.id, :value => @materials, :value_year => @materials * @auxiliary, :percentage => (@total != 0)?((@materials / @total) * 100):0)      

      StResultValue.create(:st_result_id => manufacturing_result.id, :value => @manufacturing, :value_year => @manufacturing * @auxiliary, :percentage => (@total != 0)?((@manufacturing / @total) * 100):0)
      StResultValue.create(:st_result_id => energy_result.id, :value => energy, :value_year => energy * @auxiliary, :percentage => (@total != 0)?((energy / @total) * 100):0)      
      StResultValue.create(:st_result_id => processes_result.id, :value => processes, :value_year => processes * @auxiliary, :percentage => (@total != 0)?((processes / @total) * 100):0)      

      StResultValue.create(:st_result_id => distribution_result.id, :value => @distribution, :value_year => @distribution * @auxiliary, :percentage => (@total != 0)?((@distribution / @total) * 100):0)
      StResultValue.create(:st_result_id => packaging_result.id, :value => packaging, :value_year => packaging * @auxiliary, :percentage => (@total != 0)?((packaging / @total) * 100):0)
      StResultValue.create(:st_result_id => transport_result.id, :value => transport, :value_year => transport * @auxiliary, :percentage => (@total != 0)?((transport / @total) * 100):0)      

      StResultValue.create(:st_result_id => use_result.id, :value => @use, :value_year => @use * @auxiliary, :percentage => (@total != 0)?((@use / @total) * 100):0)      
      StResultValue.create(:st_result_id => consumptions_result.id, :value => consumptions, :value_year => consumptions * @auxiliary, :percentage => (@total != 0)?((consumptions / @total) * 100):0)
      StResultValue.create(:st_result_id => consumables_result.id, :value => consumables, :value_year => consumables * @auxiliary, :percentage => (@total != 0)?((consumables / @total) * 100):0)      

      StResultValue.create(:st_result_id => end_of_life_result.id, :value => @end_of_life, :value_year => @end_of_life * @auxiliary, :percentage => (@total != 0)?((@end_of_life / @total) * 100):0)      
      
      @main_result = root_result
      
       @max = @total    
        @limit1 = @max * 0.25
        @limit2 = @max * 0.50
        @limit3 = @max * 0.75         
      

      root_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(@st_product.id, "Total", -1)

      ## MATERIALS
      materials_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(@st_product.id, "MATERIALS", root_result.id)
      @show_materials = materials_result.check_graphic
      
      ## MANUFACTURING
      manufacturing_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(@st_product.id, "MANUFACTURING", root_result.id)
      @show_manufacturing = manufacturing_result.check_graphic
      
      ## DISTRIBUTION
      distribution_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(@st_product.id, "DISTRIBUTION", root_result.id)
      @show_distribution = distribution_result.check_graphic
      
      ## USE
      use_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(@st_product.id, "USE", root_result.id)
      @show_use = use_result.check_graphic
      
      ## END_OF_LIFE
      end_of_life_result = StResult.find_by_st_product_id_and_name_en_and_parent_id(@st_product.id, "END-OF-LIFE", root_result.id)
      @show_end_of_life = end_of_life_result.check_graphic   

      numeric_array = Array.new
      percentage_array = Array.new
      colors_array = Array.new 
      color_main = @colors[2]
      color_child = @colors[8]      
      index = 0
      @total_ticks = ''
      if @show_end_of_life
         end_of_life_result.children.each do |end_of_life_child|
           if end_of_life_child.check_graphic
             @total_ticks += "|" + end_of_life_child.name_en.html_safe
             result_value = StResultValue.find_by_st_result_id(end_of_life_child.id)  
             if result_value 
                numeric_array << result_value.value
                percentage_array << (result_value.value / @total) * 100
             else
                numeric_array << 0
                percentage_array << 0
             end  
             colors_array << color_child
             index = index + 1
           end  
         end        
         @total_ticks += "|" + _('END-OF-LIFE').html_safe
         numeric_array << @end_of_life
         if @total == 0
            percentage_array << 0
         else
            percentage_array << (@end_of_life / @total) * 100
         end
         colors_array << color_main
         index = index + 1
      end
      if @show_use
         use_result.children.each do |use_child|
           if use_child.check_graphic
             @total_ticks += "|" + use_child.name_en.html_safe
             result_value = StResultValue.find_by_st_result_id(use_child.id)                     
              if result_value 
                numeric_array << result_value.value
                percentage_array << (result_value.value / @total) * 100
             else
                numeric_array << 0
                percentage_array << 0
             end  
             index = index + 1
             colors_array << color_child
           end  
         end              
         @total_ticks += "|" + _('USE').html_safe
         numeric_array << @use  
         percentage_array << (@use / @total) * 100         
         colors_array << color_main
         index = index + 1
      end
      if @show_distribution
         distribution_result.children.each do |distribution_child|
           if distribution_child.check_graphic
             @total_ticks += "|" + distribution_child.name_en.html_safe
             result_value = StResultValue.find_by_st_result_id(distribution_child.id)                     
              if result_value 
                numeric_array << result_value.value
                percentage_array << (result_value.value / @total) * 100
             else
                numeric_array << 0
                percentage_array << 0
             end  
             index = index + 1
             colors_array << color_child
           end  
         end              
        
         @total_ticks += "|" + _('DISTRIBUTION').html_safe
         numeric_array << @distribution  
         percentage_array << (@distribution / @total) * 100         
         colors_array << color_main
         index = index + 1         
      end
      if @show_manufacturing
         manufacturing_result.children.each do |manufacturing_child|
           if manufacturing_child.check_graphic
             @total_ticks += "|" + manufacturing_child.name_en.html_safe
             result_value = StResultValue.find_by_st_result_id(manufacturing_child.id)                     
              if result_value 
                numeric_array << result_value.value
                percentage_array << (result_value.value / @total) * 100
             else
                numeric_array << 0
                percentage_array << 0
             end  
             index = index + 1
             colors_array << color_child
           end  
         end              
        
         @total_ticks += "|" + _('MANUFACTURING').html_safe
         numeric_array << @manufacturing   
         percentage_array << (@manufacturing / @total) * 100         
         index = index + 1     
         colors_array << color_main
      end
      if @show_materials
         materials_result.children.each do |materials_child|
           if materials_child.check_graphic
             @total_ticks += "|" + materials_child.name_en.html_safe
             result_value = StResultValue.find_by_st_result_id(materials_child.id)                     
              if result_value 
                numeric_array << result_value.value
                percentage_array << (result_value.value / @total) * 100
             else
                numeric_array << 0
                percentage_array << 0
             end  
             index = index + 1
             colors_array << color_child
           end  
         end              
        
         @total_ticks += "|" + _('MATERIALS').html_safe
         numeric_array << @materials  
         percentage_array << (@materials / @total) * 100         
         index = index + 1     
         colors_array << color_main
      end
      
      @total_ticks += "|" + _('TOTAL').html_safe
      numeric_array << @total  
      percentage_array << 100
      colors_array << color_main
      
      @total_values = ''
      @percentage_values = ''      
      @total_colors = ''
      numeric_array = numeric_array.reverse
      percentage_array = percentage_array.reverse      
      colors_array = colors_array.reverse      
      numeric_array.each_with_index do |numeric_item, index|
         @total_values += numeric_item.to_s
         @percentage_values += percentage_array[index].to_s         
         @total_colors += colors_array[index]
         if index != (numeric_array.size - 1)
            @total_values += ','
            @percentage_values += ','            
            @total_colors += '|'
         end   
      end  
       
      @labels_size = numeric_array.size       
  end

  # GET /st_uses/1
  # GET /st_uses/1.xml
  def show
    @st_product = StProduct.find(params[:id])
    @product = @st_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @st_product.product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, st_production_init_path(@st_product)
    add_breadcrumb _("Results").html_safe, st_result_url(@st_product)

    if @st_product
      @step = 1

      do_results(@st_product)
      
      respond_to do |format|
        format.html # show.html.erb
        #format.xml  { render :xml => @se_use_consumption }
      end
    end

   end


 def compare
    puts params.inspect
    @st_product = StProduct.find(params[:st_product_id])
    @st_product_2 = StProduct.find(params[:compareTo])
    #@st_product_2 = StProduct.find(params[:st_product_id])
    
    @product = @st_product.product
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @st_product.product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, st_production_init_path(@st_product)
    add_breadcrumb _("Results").html_safe, st_results_path(@st_product)
    
   
    @product_2 = @st_product_2.product
    @step = 3
    
    
    @labels_size = 0
    if params[:total]
       total = true
       @labels_size += 1
    end
    if params[:materials]
       materials = true
       @labels_size += 1
    end
    if params[:manufacturing]
       manufacturing = true      
       @labels_size += 1
    end
    if params[:distribution]
       distribution = true      
       @labels_size += 1
    end
    if params[:use]
       use = true      
       @labels_size += 1
    end
    if params[:end_of_life]
       end_of_life = true
       @labels_size += 1
    end
    
    labels_size_pre = @labels_size
    @values_to_array = ""
    do_results(@st_product)
    values = ""
    if total 
      values += @total.to_s
    end
    if materials
      if values != ""
         values += ","
      end
      values += @materials.to_s
    end
    if manufacturing
      if values != ""
         values += ","
      end
      values += @manufacturing.to_s
    end
    if distribution
      if values != ""
         values += ","
      end
      values += @distribution.to_s
    end
    if use
      if values != ""
         values += ","
      end
      values += @use.to_s
    end
    if end_of_life
      if values != ""
         values += ","
      end
      values += @end_of_life.to_s
    end
           
    do_results(@st_product_2)
    @values_to_array += values + "|"
    values = ""
    if total 
      values += @total.to_s
    end
    if materials
      if values != ""
         values += ","
      end
      values += @materials.to_s
    end
    if manufacturing
      if values != ""
         values += ","
      end
      values += @manufacturing.to_s
    end
    if distribution
      if values != ""
         values += ","
      end
      values += @distribution.to_s
    end
    if use
      if values != ""
         values += ","
      end
      values += @use.to_s
    end
    if end_of_life
      if values != ""
         values += ","
      end
      values += @end_of_life.to_s
    end      
    @values_to_array += values
    
    
    
    
    @ticks_to_array = ""
    if end_of_life       
       @ticks_to_array += "|" + _('End-of-life').html_safe 
    end
    if use
       @ticks_to_array += "|" + _('Use').html_safe 
    end
    if distribution
       @ticks_to_array += "|" + _('Distribution').html_safe 
    end
    if manufacturing
       @ticks_to_array += "|" + _('Manufacturing').html_safe 
    end
    if materials
       @ticks_to_array += "|" + _('Materials').html_safe 
    end
    if total
       @ticks_to_array += "|" + _('Total').html_safe 
    end

    
    
    @legend = @product.name + "|" + @product_2.name 
    @seriesColors_to_array = "999999,0000FF"    
    @labels_size = labels_size_pre
  end   


  def graphic
    @st_product = StProduct.find(params[:st_result_id])
    @product = @st_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @st_product.product.name, edit_product_url(@product)
    add_breadcrumb _("LCA - based module").html_safe, st_production_init_path(@st_product)
    add_breadcrumb _("Results").html_safe, st_result_url(@st_product)

    if @st_product
      @step = 2

      do_results(@st_product)
      
   
      
      
      respond_to do |format|
        format.html # show.html.erb
        #format.xml  { render :xml => @se_use_consumption }
      end
    end

  end


  # GET /st_uses/new
  # GET /st_uses/new.xml
  def new
    @st_use = StUse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @st_use }
    end
  end

  # GET /st_uses/1/edit
  def edit
    @st_use = StUse.find(params[:id])
  end

  # POST /st_uses
  # POST /st_uses.xml
  def create
    @st_use = StUse.new(params[:st_use])

    respond_to do |format|
      if @st_use.save
        format.html { redirect_to(@st_use) }
        format.xml  { render :xml => @st_use, :status => :created, :location => @st_use }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @st_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /st_uses/1
  # PUT /st_uses/1.xml
  def update
    @st_use = StUse.find(params[:id])
    return_url = ''
    if params[:arrow]
       if params[:arrow] == 'next'
          return_url = st_end_of_life_path(@st_use.st_product)     
       end
       if params[:arrow] == 'previous'
          return_url = st_distribution_path(@st_use.st_product)
       end      
    end
    respond_to do |format|
      if @st_use.update_attributes(params[:st_use])
        format.html { redirect_to(return_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @st_use.errors, :status => :unprocessable_entity }
      end
    end
  end


 def generate_csv
    product = get_product(params[:product_id])
    limit1 = params[:limit1_csv]
    limit2 = params[:limit2_csv]
    limit3 = params[:limit3_csv]  
    if product
        coder = HTMLEntities.new
    
        save_path = Rails.root.join('xls','excel_' + product.id.to_s + '.xls')    
        if File.exists?(save_path)
           File.delete(save_path)
        end     
    
        #workbook = WriteExcel.new(Rails.root.join('xls',coder.decode(product.name) + '.xls'))
        workbook = WriteExcel.new(save_path.to_s)
        # green
        workbook.set_custom_color(17, 185, 196, 91)
        # http://writeexcel.web.fc2.com/en/doc_en.html#set_custom_color
        # 20   =>   purple
        # 22   =>   silver
        # 23   =>   gray
        # 33   =>   pink
        workbook.set_custom_color(20, 223, 140, 0)        
        workbook.set_custom_color(22, 255, 185, 0)
        workbook.set_custom_color(23, 255, 226, 111)
        workbook.set_custom_color(33, 255, 242, 191)        

        # Add worksheet(s)
        worksheet  = workbook.add_worksheet
        
        
        format_color_1_title = workbook.add_format
        format_color_1_title.set_color('black')
        format_color_1_title.set_align('center')
        format_color_1_title.set_bg_color('purple')
        format_color_1_title.set_border(2)
        format_color_1_title.set_border_color('purple')
        
        
        format_color_2_title = workbook.add_format
        format_color_2_title.set_color('black')
        format_color_2_title.set_align('center')
        format_color_2_title.set_bg_color('silver')
        format_color_2_title.set_border(2)
        format_color_2_title.set_border_color('silver')
        format_color_2_title.set_right_color('black')
        
        format_color_3_title = workbook.add_format
        format_color_3_title.set_color('black')
        format_color_3_title.set_align('center')
        format_color_3_title.set_bg_color('gray')
        format_color_3_title.set_border(2)
        format_color_3_title.set_border_color('gray')
        format_color_3_title.set_right_color('black')
        
        format_color_4_title = workbook.add_format
        format_color_4_title.set_color('black')
        format_color_4_title.set_align('center')
        format_color_4_title.set_bg_color('pink')
        format_color_4_title.set_border(2)
        format_color_4_title.set_border_color('pink')
        format_color_4_title.set_right_color('black')
        
        
        format_color_1 = workbook.add_format
        format_color_1.set_color('black')
        format_color_1.set_align('center')
        format_color_1.set_bg_color('purple')
        format_color_1.set_border(2)
        format_color_1.set_border_color('white')
        format_color_1.set_num_format(0x01)
        
        format_color_2 = workbook.add_format
        format_color_2.set_color('black')
        format_color_2.set_align('center')
        format_color_2.set_bg_color('silver')
        format_color_2.set_border(2)
        format_color_2.set_border_color('white')
        format_color_2.set_num_format(0x01)        
        
        format_color_3 = workbook.add_format
        format_color_3.set_color('black')
        format_color_3.set_align('center')
        format_color_3.set_bg_color('gray')
        format_color_3.set_border(2)
        format_color_3.set_border_color('white')
        format_color_3.set_num_format(0x01)        
        
        format_color_4 = workbook.add_format
        format_color_4.set_color('black')
        format_color_4.set_align('center')
        format_color_4.set_bg_color('pink')
        format_color_4.set_border(2)
        format_color_4.set_border_color('white')
        format_color_4.set_num_format(0x01)        
        
        worksheet.set_column('A:A', 25) # Column  A   width set to 20
        worksheet.set_column('B:B', 25) # Column  A   width set to 20
        worksheet.set_column('C:C', 25) # Column  A   width set to 20
        worksheet.set_column('D:D', 25) # Column  A   width set to 20
        worksheet.set_column('E:E', 25) # Column  A   width set to 20        
        worksheet.set_column('F:F', 25) # Column  A   width set to 20        
        worksheet.set_column('G:G', 25) # Column  A   width set to 20
        worksheet.set_column('H:H', 25) # Column  A   width set to 20        
        worksheet.set_column('I:I', 25) # Column  A   width set to 20
        worksheet.set_column('J:J', 25) # Column  A   width set to 20        
        
        # Add and define a format
        format_bold = workbook.add_format
        format_bold.set_bold
        format_bold.set_color('black')
        format_bold.set_align('center')
        format_bold.set_bg_color('green')
        format_bold.set_border(2)
        format_bold.set_border_color('white')
        
        format_bold_left = workbook.add_format
        format_bold_left.set_bold
        format_bold_left.set_color('black')
        format_bold_left.set_align('left')
        format_bold_left.set_bg_color('green')
        format_bold_left.set_border(2)
        format_bold_left.set_border_color('white')

        format_bold_right = workbook.add_format
        format_bold_right.set_bold
        format_bold_right.set_color('black')
        format_bold_right.set_align('right')
        format_bold_right.set_bg_color('green')
        format_bold_right.set_border(2)
        format_bold_right.set_border_color('white')

        format_bold_left_no_bg = workbook.add_format
        format_bold_left_no_bg.set_bold
        format_bold_left_no_bg.set_color('black')
        format_bold_left_no_bg.set_align('left')
        
        
        format = workbook.add_format
        format.set_color('black')
        format.set_align('right')
        
        format_num = workbook.add_format
        format_num.set_color('black')
        format_num.set_align('center')
        format_num.set_border(1)
        format_num.set_border_color('white')
       # format_num.set_num_format('0.00E+00')
        format_num.set_num_format('0.00')
        
        title = _('INDICATOR')
        title_2 = _('UNITS')

        worksheet.write(1, 1, _('Euro total life-time'), format_bold)  # cell B2
        worksheet.write(1, 2, _('Euro per year'), format_bold)  # cell B2

        first_node = StResult.find(:all, :conditions => ["name_en=? and st_product_id = ?", 'Total', product.st_product.id]).first
        
        worksheet.write(2, 0, coder.decode("TOTAL"), format_bold_left)

        result_value = StResultValue.find(:all, :conditions => ["st_result_id=? ", first_node.id]).first
        if result_value
           worksheet.write_number(2, 1, result_value.value, format_color_1)  # cell B2
           worksheet.write_number(2, 2, result_value.value_year, format_color_1)  # cell B2
        end

     
        generate_worksheet first_node, first_node, product, worksheet, 2, product.indicators, format_bold, format_bold_left, format_bold_right, format_color_1, format_color_2, format_color_3, format_color_4, limit1, limit2, limit3
    
        worksheet.write(23, 3, coder.decode(_('Significance assessment')), format_bold_left_no_bg)
        worksheet.write(24, 3, "", format_color_4_title)
        worksheet.write(24, 4, "", format_color_3_title)
        worksheet.write(24, 5, "", format_color_2_title)
        worksheet.write(24, 6, "", format_color_1_title)
       
        worksheet.write(25, 3, "" + limit1 + "%", format)
        worksheet.write(25, 4, "" + limit2 + "%", format)
        worksheet.write(25, 5, "" + limit3 + "%", format)
       
        # write to file
        workbook.close
       
        # send_file "results.csv", :type => 'text/csv;charset=iso-8859-1'
        send_file save_path
     else
        respond_to do |format|
          format.html { redirect_to(product_url) }
          format.xml { head :ok }
        end
     end        
  end
  
  
  def generate_worksheet (first_node, node, product, worksheet, col, indicators, format_bold, format_bold_left, format_bold_right, format_color_1, format_color_2, format_color_3, format_color_4, limit1, limit2, limit3)
     coder = HTMLEntities.new

     node.children.each do |child|
       col = col + 1
       if I18n.locale == :en
         name = child.name_en
       end  
       if I18n.locale == :es                
         name = child.name_es
       end
       if I18n.locale == :ca                
         name = child.name_ca
       end
      # worksheet.set_column(col, col, coder.decode(name).length + 10)
       if node == first_node
          worksheet.write(col, 0, coder.decode(name), format_bold_left)
       else
          if node.parent == first_node
             worksheet.write(col, 0, "- " + coder.decode(name), format_bold_left)
          else
             worksheet.write(col, 0, coder.decode(name), format_bold_right)
          end 
       end  
#       indicators.each_with_index do |indicator, index| 
         result_value = StResultValue.find(:all, :conditions => ["st_result_id=?", child.id]).first
         if result_value
           if result_value.percentage.round < limit1.to_i
              worksheet.write_number(col, 1, result_value.value, format_color_4)  # cell B2
              worksheet.write_number(col, 2, result_value.value_year, format_color_4)  # cell B2              
           end
           if result_value.percentage.round >= limit1.to_i && result_value.percentage.round < limit2.to_i
              worksheet.write_number(col, 1, result_value.value, format_color_3)  # cell B2
              worksheet.write_number(col, 2, result_value.value_year, format_color_3)  # cell B2              
           end
           if result_value.percentage.round >= limit2.to_i && result_value.percentage.round < limit3.to_i
              worksheet.write_number(col, 1, result_value.value, format_color_2)  # cell B2
              worksheet.write_number(col, 2, result_value.value_year, format_color_2)  # cell B2              
           end         
           if result_value.percentage.round >= limit3.to_i
              worksheet.write_number(col, 1, result_value.value, format_color_1)  # cell B2
              worksheet.write_number(col, 2, result_value.value_year, format_color_1)  # cell B2              
          end
        else
          worksheet.write_number(col, 1, 0, format_color_4)  # cell B2
          worksheet.write_number(col, 2, 0, format_color_4)  # cell B2          
        end
      # end
       col = generate_worksheet first_node,child, product, worksheet, col, indicators, format_bold, format_bold_left, format_bold_right, format_color_1, format_color_2, format_color_3, format_color_4, limit1, limit2, limit3
     end
     return col
  end    


  def pdf
   
    @st_product = StProduct.find(params[:st_result_id])
    @product = @st_product.product
    
    do_results(@st_product)
    
    save_path = Rails.root.join('pdfs','st_report_' + @st_product.id.to_s + '.pdf')    
    if File.exists?(save_path)
       File.delete(save_path)
    end
    
    #render :layout => false
    # or from your controller, using views & templates and all wicked_pdf options as normal
    pdf = WickedPdf.new.pdf_from_string(render_to_string(:template => '/st_results/pdf.html.erb', :layout => false))
    # then save to a file

    File.open(save_path, 'wb') do |file|
      file << pdf
    end
    
    # then save to a file
    send_file save_path

  end

  # DELETE /st_uses/1
  # DELETE /st_uses/1.xml
  def destroy
    @st_use = StUse.find(params[:id])
    @st_use.destroy

    respond_to do |format|
      format.html { redirect_to(st_uses_url) }
      format.xml  { head :ok }
    end
  end
end
