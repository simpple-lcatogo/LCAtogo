module ApplicationHelper

  def current_url(locale)
    session[:locale_set] = true
    url_for request.params.merge({:locale => locale})
  end

  def absolute_image_tag(*args)
    raw(image_tag(*args).sub /src="(.*?)"/, "src=\"#{request.protocol}#{request.host_with_port}" + '\1"')
  end  
  
  def tab_link_to(name, options = {}, html_options = nil, *parameters_for_method_reference)
      html_options ||= {}
      if html_options[:index] && @step        
        if @step.to_i == html_options[:index].to_i
           if @step.to_i == 100
              html_options.merge!({:class => "results_selected"})
           else
              html_options.merge!({:class => "selected"})
           end
        end   
      end
      
      return(link_to name, options, html_options, *parameters_for_method_reference)
    end
  

    MANUFACTURING_COLOR = "#9933FF"
    MATERIALS_MATERIALS_COLOR = "#808080"
    MATERIALS_MANUFACTURING_COLOR = "#9966FF"
    MATERIALS_COLOR = "#696969"
    PRODUCTION_COLOR = "#808080"
    RAW_MATERIALS_COLOR = "#808080"
    COMPONENTS_COLOR = "#808080"
    PROCESSES_COLOR = "#9966FF"
    DISTRIBUTION_COLOR = "#1E90FF"
    PACKAGING_COLOR = "#00BFFF"
    TRANSPORT_COLOR = "#00BFFF"
    USE_COLOR = "#8B0000"
    CONSUMPTION_COLOR = "#DC143C"
    CONSUMABLES_COLOR = "#DC143C"
    REPAIR_COLOR = "#DC143C"
    ENDOFLIFE_COLOR = "#006400"
    REUSE_COLOR = "#228B22"
    RECYCLING_COLOR = "#228B22"
    DEFAULT_COLOR = "#B9C45B"
    TOTAL_COLOR = "#2B4950"
   
   def get_color(phase_name, parent_name)
     logger.info "GETTING COLOR --> " + phase_name
     if phase_name == 'Materials' && parent_name == 'MATERIALS'
       return MATERIALS_MATERIALS_COLOR
     end     
     if phase_name == 'Materials' && parent_name == 'MANUFACTURING'
       return MATERIALS_MANUFACTURING_COLOR
     end     
     
     if phase_name == 'MATERIALS'
       return MATERIALS_COLOR
     end     
     if phase_name == 'MANUFACTURING'
       return MANUFACTURING_COLOR
     end     
     
     if phase_name == 'DISTRIBUTION'
       return DISTRIBUTION_COLOR
     end
     if phase_name == 'USE'
       return USE_COLOR
     end
     if phase_name == 'END-OF-LIFE'
       return ENDOFLIFE_COLOR
     end
     if phase_name == 'Components'
       return COMPONENTS_COLOR
     end     
     if phase_name == 'Processes'
       return PROCESSES_COLOR
     end     
     
     
     
     if phase_name == 'Production'
       return PRODUCTION_COLOR
     end     
     if phase_name == 'Raw Materials'
       return RAW_MATERIALS_COLOR
     end
     if phase_name == 'Packaging'
       return PACKAGING_COLOR
     end
     if phase_name == 'Transport' && parent_name != 'Replacement'
       return TRANSPORT_COLOR
     end
     if phase_name == 'Energy Consumption'
       return CONSUMPTION_COLOR
     end
     if phase_name == 'Consumables'
       return CONSUMABLES_COLOR
     end
     if phase_name == 'Repair&Maintenance'
       return REPAIR_COLOR
     end
     if phase_name == 'Reuse'
       return REUSE_COLOR
     end
     if phase_name == 'Recycling'
       return RECYCLING_COLOR
     end

     return DEFAULT_COLOR
   end  

  
  
   def st_get_color(phase_name, parent_name)
     logger.info "GETTING COLOR --> " + phase_name
     # MATERIALS
     if phase_name == 'MATERIALS'
       return MATERIALS_COLOR
     end          
     if phase_name == 'MANUFACTURING'
       return MANUFACTURING_COLOR
     end     
     
     if phase_name == 'Materials' && parent_name == 'MATERIALS'
       return MATERIALS_MATERIALS_COLOR
     end     
     if phase_name == 'Compounding materials' && parent_name == 'MATERIALS'
       return MATERIALS_MATERIALS_COLOR
     end     

     # PROCESSING
     if phase_name == 'USE'
       return USE_COLOR
     end     
              
     if phase_name == 'Processes'
        return MATERIALS_MANUFACTURING_COLOR
     end     

     if phase_name == 'Energy'
        return MATERIALS_MANUFACTURING_COLOR
     end     
     
     
     if phase_name == 'Transport' && parent_name == 'PROCESSING'
       return CONSUMABLES_COLOR
     end     
     
     # DISTRIBUTION
     if phase_name == 'DISTRIBUTION'
       return DISTRIBUTION_COLOR
     end     

     if phase_name == 'Packaging'
       return PACKAGING_COLOR
     end     
     
     if phase_name == 'Transport' && parent_name == 'DISTRIBUTION'
       return PACKAGING_COLOR
     end     
     
     # END-OF-LIFE  
     if phase_name == 'END-OF-LIFE'
       return ENDOFLIFE_COLOR
     end
     
     if phase_name == 'Landfill'
       return REUSE_COLOR
     end     
     
     if phase_name == 'Incineration'
       return REUSE_COLOR
     end     

     if phase_name == 'Composting'
       return REUSE_COLOR
     end     

     if phase_name == 'Recycling'
       return REUSE_COLOR
     end     

     if phase_name == 'Transport' && parent_name == 'END-OF-LIFE'
       return REUSE_COLOR
     end     
     
     if phase_name == 'Energy consumption'
       return CONSUMPTION_COLOR
     end
     if phase_name == 'Consumables'
       return CONSUMABLES_COLOR
     end

     return DEFAULT_COLOR
   end  
  
  
   def bp_get_color(phase_name, parent_name)
     logger.info "GETTING COLOR --> " + phase_name
     # MATERIALS
     if phase_name == 'MATERIALS'
       return MATERIALS_COLOR
     end          
     if phase_name == 'Raw materials' && parent_name == 'MATERIALS'
       return MATERIALS_MATERIALS_COLOR
     end     
     if phase_name == 'Compounding materials' && parent_name == 'MATERIALS'
       return MATERIALS_MATERIALS_COLOR
     end     

     # TRANSPORT
     if phase_name == 'TRANSPORT'
       return MANUFACTURING_COLOR
     end     

     # PROCESSING
     if phase_name == 'PROCESSING'
       return USE_COLOR
     end     
              
     if phase_name == 'Processes'
       return CONSUMABLES_COLOR
     end     
     
     if phase_name == 'Transport' && parent_name == 'PROCESSING'
       return CONSUMABLES_COLOR
     end     
     
     # DISTRIBUTION
     if phase_name == 'DISTRIBUTION'
       return DISTRIBUTION_COLOR
     end     

     if phase_name == 'Packaging'
       return PACKAGING_COLOR
     end     
     
     if phase_name == 'Transport' && parent_name == 'DISTRIBUTION'
       return PACKAGING_COLOR
     end     
     
     # END-OF-LIFE  
     if phase_name == 'END-OF-LIFE'
       return ENDOFLIFE_COLOR
     end
     
     if phase_name == 'Landfill'
       return REUSE_COLOR
     end     
     
     if phase_name == 'Incineration'
       return REUSE_COLOR
     end     

     if phase_name == 'Composting'
       return REUSE_COLOR
     end     

     if phase_name == 'Recycling'
       return REUSE_COLOR
     end     

     if phase_name == 'Transport' && parent_name == 'END-OF-LIFE'
       return REUSE_COLOR
     end     
     

     return DEFAULT_COLOR
   end  
  

   def mt_get_color(phase_name, parent_name)
     if phase_name.blank?
        return DEFAULT_COLOR
     end
     logger.info "GETTING COLOR --> " + phase_name
     # MATERIALS
     if phase_name == 'MATERIALS'
       return MATERIALS_COLOR
     end          
     if phase_name == 'Raw materials' && parent_name == 'MATERIALS'
       return MATERIALS_MATERIALS_COLOR
     end     
     if phase_name == 'Compounding materials' && parent_name == 'MATERIALS'
       return MATERIALS_MATERIALS_COLOR
     end     

     # TRANSPORT
     if phase_name == 'MANUFACTURING'
       return MANUFACTURING_COLOR
     end     

     # PROCESSING
     if phase_name == 'USE'
       return USE_COLOR
     end     
              
     if phase_name == 'Processes'
       return CONSUMABLES_COLOR
     end     
     
     if phase_name == 'Transport' && parent_name == 'PROCESSING'
       return CONSUMABLES_COLOR
     end     
     
     # DISTRIBUTION
     if phase_name == 'DISTRIBUTION'
       return DISTRIBUTION_COLOR
     end     

     if phase_name == 'Packaging'
       return PACKAGING_COLOR
     end     
     
     if phase_name == 'Transport' && parent_name == 'DISTRIBUTION'
       return PACKAGING_COLOR
     end     
     
     # END-OF-LIFE  
     if phase_name == 'END-OF-LIFE'
       return ENDOFLIFE_COLOR
     end
     
     if phase_name == 'Landfill'
       return REUSE_COLOR
     end     
     
     if phase_name == 'Incineration'
       return REUSE_COLOR
     end     

     if phase_name == 'Composting'
       return REUSE_COLOR
     end     

     if phase_name == 'Recycling'
       return REUSE_COLOR
     end     

     if phase_name == 'Transport' && parent_name == 'END-OF-LIFE'
       return REUSE_COLOR
     end     

     return DEFAULT_COLOR
   end  


  
   def lca_format_number(number, precision)
       number_with_precision(number, :precision => precision, separator: ".", delimiter: "")
   end
   
   
   def calculate_default_pellets(bp_manufacturing_data, with_default_values = false)
     quantity = bp_manufacturing_data.quantity
     specific_heat = 0
     bp_manufacturing_process_variable_values = BpManufacturingProcessVariableValue.all
     bp_manufacturing_process_user_variables = BpManufacturingProcessUserVariable.all
     
     if bp_manufacturing_data.bp_material.name == 'Polylactic acid, corn-based'
        specific_heat = 1.8
     end
     if bp_manufacturing_data.bp_material.name == 'Polylactic acid, sugarcane-based'
        specific_heat = 1.8
     end     
     if bp_manufacturing_data.bp_material.name == 'Partially bio-based PET'
        specific_heat = 1.69
     end
     if bp_manufacturing_data.bp_material.name == 'PET'
        specific_heat = 1.69
     end
     if bp_manufacturing_data.bp_material.name == 'PET recycled'
       specific_heat = 1.69
     end

     if bp_manufacturing_data.bp_material.name == 'PHB from sugarcane'
        specific_heat = 1.5
     end
     if bp_manufacturing_data.bp_material.name == 'Partially bio-based PBS'
        specific_heat = 1.7
     end
     if bp_manufacturing_data.bp_material.name == 'TPS blend type I (for film applications)'
        specific_heat = 1.56
     end
     if bp_manufacturing_data.bp_material.name == 'TPS blend type II (for film applications)'
        specific_heat = 1.56
     end     
     if bp_manufacturing_data.bp_material.name == 'Potato starch-based plastic'
        specific_heat = 1.54
     end
     var_value = 0
     drying_time = 0
     drying_temp = 0
      bp_manufacturing_data.bp_manufacturing_process.bp_manufacturing_process_variables.each do |var|
        if with_default_values
         bp_manufacturing_process_variable_values.each do |var_val|
           if var_val.bp_material_id == bp_manufacturing_data.bp_material_id && var_val.bp_manufacturing_process_id == bp_manufacturing_data.bp_manufacturing_process_id && var_val.bp_manufacturing_process_variable_id == var.id
                var_value = var_val.value
           end
         end
        end 
         if !with_default_values
           bp_manufacturing_process_user_variables.each do |user_var|
             
            begin 
             if user_var.bp_manufacturing_data.id == bp_manufacturing_data.id &&  user_var.bp_manufacturing_data && user_var.bp_manufacturing_data.bp_material_id == bp_manufacturing_data.bp_material_id && user_var.bp_manufacturing_data.bp_manufacturing_process_id == bp_manufacturing_data.bp_manufacturing_process_id && user_var.bp_manufacturing_process_variable_id == var.id
                  var_value =  user_var.value
             end
            rescue
            end
           end                    
         end
         variable_name = var.name
          if variable_name.match(/^Drying temp/)
             drying_temp = var_value
          end
          if variable_name.match(/^Drying time/)
             drying_time = var_value             
          end
     end
    if drying_time == 0 || drying_temp == 0
     return_value = 0
    else
     temp_value = (quantity.to_f / drying_time.to_f).to_f
   #  return_value = (1.2 + specific_heat * (drying_temp - 23) * temp_value).to_f / temp_value.to_f
   #  return_value = (return_value.to_f / 3600.to_f).to_f
     return_value = (1.2 + ((specific_heat.to_f / 3600).to_f * (drying_temp.to_f - 23) * temp_value)).to_f * drying_time.to_f

    end 
     
     return return_value    
   end


  def decode_html(original)
    result = original
    result = result.gsub('&aacute;', 'á')
	    result = result.gsub('&eacute;', 'é')
	

    result = result.gsub('&iacute;', 'í')
    result = result.gsub('&oacute;', 'ó')
    result = result.gsub('&uacute;', 'ú')
    result = result.gsub('&ntilde;', 'ñ')
    result = result.gsub('&Aacute;', 'Á')  
    result = result.gsub('&Eacute;', 'É')
    result = result.gsub('&Iacute;', 'Í')
    result = result.gsub('&Oacute;', 'Ó')
    result = result.gsub('&Uacute;', 'Ú')
    result = result.gsub('&Ntilde;', 'Ñ')

    return result
  end





end
