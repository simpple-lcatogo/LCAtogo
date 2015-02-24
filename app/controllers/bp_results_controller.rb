class BpResultsController < ApplicationController
  require 'csv'
  include ApplicationHelper
  include ActionView::Helpers::TextHelper  
   
  TRUNCATE = 30  
  
  # GET /product_results
  # GET /product_results.xml
  def index
    @product_results = ProductResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_results }
    end
  end

  # GET /product_results/1
  # GET /product_results/1.xml
  def show
    @bp_product = BpProduct.find(params[:id])
    @product = @bp_product.product

    if !@bp_product.bp_product_result
      @bp_product.bp_product_result = BpProductResult.new
      @bp_product.bp_product_result.save
    end            
    
    @step = 1
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @bp_product.product.name, edit_product_url(@bp_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, bp_production_init_path(@bp_product)
    add_breadcrumb _("Detailed results").html_safe, bp_result_url(@product.bp_product)
    
    
    @bp_product_result = @bp_product.bp_product_result
    results_created = false
    results_to_delete = BpResult.find(:all, :conditions => ["bp_product_result_id = ?" , @bp_product_result.id])        
    results_to_delete.each do |result|
       result_values_to_delete = BpResultValue.find(:all, :conditions => ["bp_result_id = ?" , result.id])
       BpResultValue.delete(result_values_to_delete)
       result.delete
    end    

    if !results_created
       logger.info "Generating bp results"

       root_result = BpResult.new(:bp_product_result_id => @bp_product_result.id, :name_en => "Total", :name_ca => "Total", :name_es => "Total", :parent_id => -1)
       root_result.save   
       
       ## MATERIALS
       materials_result = BpResult.new(:bp_product_result_id => @bp_product_result.id, :name_en => "MATERIALS", :name_ca => "MATERIALS", :name_es => "MATERIALS", :parent_id => root_result.id, :check_graphic => true)
       materials_result.save

       material_materials_result = BpResult.new(:bp_product_result_id => @bp_product_result.id, :name_en => "Raw materials", :name_ca => "Raw materials", :name_es => "Raw materials", :parent_id => materials_result.id, :check_graphic => true)
       material_materials_result.save

       compounding_materials_result = BpResult.new(:bp_product_result_id => @bp_product_result.id, :name_en => "Compounding", :name_ca => "Compounding", :name_es => "Compounding", :parent_id => materials_result.id, :check_graphic => true)
       compounding_materials_result.save
       
       ## TRANSPORT
       transport_result = BpResult.new(:bp_product_result_id => @bp_product_result.id, :name_en => "TRANSPORT", :name_ca => "TRANSPORT", :name_es => "TRANSPORT", :parent_id => root_result.id, :check_graphic => true)
       transport_result.save
       
       ## PROCESSING
       processing_result = BpResult.new(:bp_product_result_id => @bp_product_result.id, :name_en => "PROCESSING", :name_ca => "PROCESSING", :name_es => "PROCESSING", :parent_id => root_result.id, :check_graphic => true)
       processing_result.save

       processes_result = BpResult.new(:bp_product_result_id => @bp_product_result.id, :name_en => "Processes", :name_ca => "Processes", :name_es => "Processes", :parent_id => processing_result.id, :check_graphic => true)
       processes_result.save

       processing_transport_result = BpResult.new(:bp_product_result_id => @bp_product_result.id, :name_en => "Transport", :name_ca => "Transport", :name_es => "Transport", :parent_id => processing_result.id, :check_graphic => true)
       processing_transport_result.save
       
       ## DISTRIBUTION

       distribution_result = BpResult.new(:bp_product_result_id => @bp_product_result.id, :name_en => "DISTRIBUTION", :name_ca => "DISTRIBUTION", :name_es => "DISTRIBUTION", :parent_id => root_result.id, :check_graphic => true)
       distribution_result.save

       packaging_result = BpResult.new(:bp_product_result_id => @bp_product_result.id, :name_en => "Packaging", :name_ca => "Packaging", :name_es => "Packaging", :parent_id => distribution_result.id, :check_graphic => true)
       packaging_result.save

       distribution_transport_result = BpResult.new(:bp_product_result_id => @bp_product_result.id, :name_en => "Transport", :name_ca => "Transport", :name_es => "Transport", :parent_id => distribution_result.id, :check_graphic => true)
       distribution_transport_result.save
      
       
       ## END_OF_LIFE

       endoflife_result = BpResult.new(:bp_product_result_id => @bp_product_result.id, :name_en => "END-OF-LIFE", :name_ca => "END-OF-LIFE", :name_es => "END-OF-LIFE", :parent_id => root_result.id, :check_graphic => true)
       endoflife_result.save

       landfill_result = BpResult.new(:bp_product_result_id => @bp_product_result.id, :name_en => "Landfill", :name_ca => "Landfill", :name_es => "Landfill", :parent_id => endoflife_result.id, :check_graphic => true)
       landfill_result.save

       incineration_result = BpResult.new(:bp_product_result_id => @bp_product_result.id, :name_en => "Incineration", :name_ca => "Incineration", :name_es => "Incineration", :parent_id => endoflife_result.id, :check_graphic => true)
       incineration_result.save
  
       composting_result = BpResult.new(:bp_product_result_id => @bp_product_result.id, :name_en => "Composting", :name_ca => "Composting", :name_es => "Composting", :parent_id => endoflife_result.id, :check_graphic => true)
       composting_result.save
       
       recycling_result = BpResult.new(:bp_product_result_id => @bp_product_result.id, :name_en => "Recycling", :name_ca => "Recycling", :name_es => "Recycling", :parent_id => endoflife_result.id, :check_graphic => true)
       recycling_result.save
       
       endoflife_transport_result = BpResult.new(:bp_product_result_id => @bp_product_result.id, :name_en => "Transport", :name_ca => "Transport", :name_es => "Transport", :parent_id => endoflife_result.id, :check_graphic => true)
       endoflife_transport_result.save

       @product.indicators.each do |indicator|
            total = 0
            materials = 0
            material_materials = 0
            compounding_materials = 0
            transport = 0
            processing = 0
            processes = 0
            processing_transport = 0
            distribution = 0
            packaging = 0
            distribution_transport = 0
            endoflife = 0
            landfill = 0
            incineration = 0
            composting = 0
            recycling = 0
            endoflife_transport = 0
            
            # Raw Materials
            @bp_product.bp_material_datas.each do |bp_material_data|
               if bp_material_data.bp_material
                  material_materials += bp_material_data.quantity * get_bp_excel_value(indicator, bp_material_data.bp_material.name, "RAW MATERIALS", "MATERIALS")
               end    
            end

            # Compounding Materials
            @bp_product.bp_compound_material_datas.each do |bp_compound_data|
               if bp_compound_data.bp_compound_material                 
                  compounding_materials += bp_compound_data.amount * get_bp_excel_value(indicator, bp_compound_data.bp_compound_material.name, "COMPOUNDING MATERIALS", "MATERIALS")
               end   
            end
            
            # Materials
            materials = material_materials + compounding_materials
            
            # Transport            
            @bp_product.bp_transport_to_converter_datas.each do |transport_to_converter|
              if transport_to_converter.bp_vehicle
                 transport += transport_to_converter.distance * (transport_to_converter.amount / 1000) * get_bp_excel_value(indicator, transport_to_converter.bp_vehicle.name, "RAW MATERIALS", "TRANSPORT")
              end   
            end
            
            bp_manufacturing_process_variable_values = BpManufacturingProcessVariableValue.all
            bp_manufacturing_process_user_variables = BpManufacturingProcessUserVariable.all
            # Processes 
            @bp_product.bp_manufacturing_datas.each do |bp_manufacturing_data|
              if bp_manufacturing_data.bp_manufacturing_process
               process_name = bp_manufacturing_data.bp_manufacturing_process.name  
               if process_name != 'Drying of pellets'
                  var_value = 0
                  bp_manufacturing_data.bp_manufacturing_process.bp_manufacturing_process_variables.each do |var|
                     bp_manufacturing_process_variable_values.each do |var_val|
                       if var_val.bp_material_id == bp_manufacturing_data.bp_material_id && var_val.bp_manufacturing_process_id == bp_manufacturing_data.bp_manufacturing_process_id && var_val.bp_manufacturing_process_variable_id == var.id
                            var_value = var_val.value
                       end
                     end
                     bp_manufacturing_process_user_variables.each do |user_var|
                       if user_var.bp_manufacturing_data && user_var.bp_manufacturing_data.bp_material_id == bp_manufacturing_data.bp_material_id && user_var.bp_manufacturing_data.bp_manufacturing_process_id == bp_manufacturing_data.bp_manufacturing_process_id && user_var.bp_manufacturing_process_variable_id == var.id
                            var_value =  user_var.value
                       end
                     end
                     
                     logger.info "** Processes **"
                     logger.info "quantity --> " + bp_manufacturing_data.quantity.to_s
                     logger.info "var_value --> " + var_value.to_s
                     logger.info "var_name --> " + var.name.to_s

                     if var.name == 'Lubricating oil'
                        if process_name == 'Injection stretch blow moulding' || process_name == 'Injection moulding'
                           # Low
                           processes += var_value * bp_manufacturing_data.quantity * get_bp_excel_value(indicator, "Lubricating oil, with lower density", "MANUFACTURING", "RESOURCES")
                        else
                           # High
                           processes += var_value * bp_manufacturing_data.quantity * get_bp_excel_value(indicator, "Lubricating oil, with higher density", "MANUFACTURING", "RESOURCES")                          
                        end
                     else                                             
                       if var.name == 'Electricity use'       
                          country_selected = "Europe"
                          if bp_manufacturing_data.bp_country_info
                             country_selected = bp_manufacturing_data.bp_country_info.name
                          end
                          logger.info "add_value --> " + (var_value * bp_manufacturing_data.quantity * get_bp_excel_value(indicator, "Electricity mix in " + country_selected + ", at grid", "MANUFACTURING", "ENERGY")).to_s
                          processes += var_value * bp_manufacturing_data.quantity * get_bp_excel_value(indicator, "Electricity mix in " + country_selected + ", at grid", "MANUFACTURING", "ENERGY")
                       else
                          logger.info "add_value --> " + (var_value * bp_manufacturing_data.quantity * get_bp_excel_value(indicator, var.name, "MANUFACTURING", "RESOURCES")).to_s
                          processes += var_value * bp_manufacturing_data.quantity * get_bp_excel_value(indicator, var.name, "MANUFACTURING", "RESOURCES")
                       end
                     end 
                     logger.info "** End processes **"
                  end
               else
                  # with user values
                  return_value = calculate_default_pellets(bp_manufacturing_data, false)
                  if return_value == 0
                     # with default values
                     return_value = calculate_default_pellets(bp_manufacturing_data, true)
                  end
                  country_selected = "Europe"
                  if bp_manufacturing_data.bp_country_info
                     country_selected = bp_manufacturing_data.bp_country_info.name
                  end
                  excel_value = get_bp_excel_value(indicator, "Electricity mix in " + country_selected + ", at grid", "MANUFACTURING", "ENERGY")
                  processes += (return_value * excel_value)
               end
            end
          end
            
          # Processing transport
          @bp_product.bp_manufacturing_transport_datas.each do |manufacturing_transport|
            if manufacturing_transport.bp_vehicle
               processing_transport += manufacturing_transport.distance * (manufacturing_transport.amount / 1000) * get_bp_excel_value(indicator, manufacturing_transport.bp_vehicle.name, "MANUFACTURING", "TRANSPORT")
            end
          end
          processing = processing_transport + processes
            
            
            
          @bp_product.bp_packaging_datas.each do |bp_packaging_data|
             packaging += bp_packaging_data.amount * get_bp_excel_value(indicator, bp_packaging_data.bp_distribution_default_value.name, "DISTRIBUTION", "RESOURCES")
          end



          # Distribution transport
          @bp_product.bp_transport_to_customer_datas.each do |bp_distribution_transport|
             if bp_distribution_transport.bp_vehicle
                distribution_transport += bp_distribution_transport.distance * (bp_distribution_transport.amount / 1000) * get_bp_excel_value(indicator, bp_distribution_transport.bp_vehicle.name, "DISTRIBUTION", "TRANSPORT")
             end
          end
            
          # Distribution
          distribution = packaging + distribution_transport
            
            
          landfill_perc = 0
          incineration_perc = 0
          composting_perc = 0
          recycling_perc = 0
          if @bp_product.bp_end_of_life_data && @bp_product.bp_end_of_life_data.bp_end_of_life_default_scenario
             if @bp_product.bp_end_of_life_data.bp_end_of_life_default_scenario.name == 'Predefined scenario 1 (waste treatment 100% to composting)'
                composting_perc = 100 / 100
             end
             if @bp_product.bp_end_of_life_data.bp_end_of_life_default_scenario.name == 'Predefined scenario 2 (waste treatment shared between 43.5% of incineration and 56.5% of landfill)'
                incineration_perc = 43.5 / 100
                landfill_perc = 56.5 / 100
             end
             if @bp_product.bp_end_of_life_data.bp_end_of_life_default_scenario.name == 'Predefined scenario 3 (waste treatment shared between 30.7% of incineration, 20% composting and 49.3% of landfill)'
                incineration_perc = 30.7 / 100
                composting_perc = 20 / 100
                landfill_perc = 49.3 / 100
             end
             if @bp_product.bp_end_of_life_data.bp_end_of_life_default_scenario.name == 'Predefined scenario 4 (waste treatment 33.3% of recycling, 29% of incineration, 37.7% of landfill)'
                recycling_perc = 33.3 / 100
                incineration_perc = 29.0 / 100
                landfill_perc = 37.3 / 100
             end

             if @bp_product.bp_end_of_life_data.bp_end_of_life_default_scenario.name == 'Predefined scenario 5 (waste treatment 29.4% of recycling, 27.1% of incineration, 43.5% of landfill)'
               recycling_perc = 29.4 / 100
               incineration_perc = 27.1 / 100
               landfill_perc = 43.5 / 100
            end
            
            if @bp_product.bp_end_of_life_data.bp_end_of_life_default_scenario.name == 'Predefined scenario 6 (waste treatment 25.1% of recycling, 34.1% of incineration, 40.9% of landfill)'
               recycling_perc = 25.1 / 100
               incineration_perc = 34.1 / 100
               landfill_perc = 40.9 / 100
            end
            
            if @bp_product.bp_end_of_life_data.bp_end_of_life_default_scenario.name == 'If required, add your customized scenario:'
               incineration_perc = @bp_product.bp_end_of_life_data.custom_incineration.to_f / 100
               landfill_perc = @bp_product.bp_end_of_life_data.custom_landfill.to_f / 100
               composting_perc = @bp_product.bp_end_of_life_data.custom_composting.to_f / 100
               recycling_perc = @bp_product.bp_end_of_life_data.custom_recycling.to_f / 100       
            end
            packaging_to_endoflife = 0

            landfill = 0
            incineration = 0
            composting = 0
            recycling = 0
            
            if landfill_perc.blank?
               landfill_perc = 0
            end
            if incineration_perc.blank?
               incineration_perc = 0
            end
            if composting_perc.blank?
               composting_perc = 0
            end
            if recycling_perc.blank?
               recycling_perc = 0
            end
            
            
            @bp_product.bp_material_datas.each do |bp_material_data|
              landfill += bp_material_data.quantity * (landfill_perc / 1) * get_bp_excel_value_by_family(indicator, bp_material_data.bp_material.name, "END-OF-LIFE", "WASTE TREATMENT", "Landfill")
              incineration += bp_material_data.quantity * (incineration_perc / 1) * get_bp_excel_value_by_family(indicator, bp_material_data.bp_material.name, "END-OF-LIFE", "WASTE TREATMENT", "Incineration")
              composting += bp_material_data.quantity * (composting_perc / 1) * get_bp_excel_value_by_family(indicator, bp_material_data.bp_material.name, "END-OF-LIFE", "WASTE TREATMENT", "Composting")
              recycling += bp_material_data.quantity * (recycling_perc / 1) * get_bp_excel_value_by_family(indicator, bp_material_data.bp_material.name, "END-OF-LIFE", "WASTE TREATMENT", "Recycling")
              packaging_to_endoflife += bp_material_data.quantity
            end
 
            logger.info "Packaging to endoflife --> " + packaging_to_endoflife.to_s

            # End of life transport
            if @bp_product.bp_end_of_life_data.custom_transport_distance
               endoflife_transport = packaging_to_endoflife * (@bp_product.bp_end_of_life_data.custom_transport_distance / 1000) * get_bp_excel_value_by_family(indicator, "Waste collection lorry", "END-OF-LIFE", "TRANSPORT", "Road")
            else   
               endoflife_transport = packaging_to_endoflife * (@bp_product.bp_end_of_life_data.default_transport_distance / 1000) * get_bp_excel_value_by_family(indicator, "Waste collection lorry", "END-OF-LIFE", "TRANSPORT", "Road")
            end
        end

        # End of life
        endoflife = landfill + incineration + composting + recycling + endoflife_transport


        total = materials + transport + processing + distribution + endoflife

        BpResultValue.create(:bp_result_id => root_result.id, :indicator_id => indicator.id, :value => total, :percentage => (total != 0)?((total / total) * 100):0)
        BpResultValue.create(:bp_result_id => materials_result.id, :indicator_id => indicator.id, :value => materials, :percentage => (total != 0)?((materials / total) * 100):0)
        BpResultValue.create(:bp_result_id => material_materials_result.id, :indicator_id => indicator.id, :value => material_materials, :percentage => (total != 0)?((material_materials / total) * 100):0)
        BpResultValue.create(:bp_result_id => compounding_materials_result.id, :indicator_id => indicator.id, :value => compounding_materials, :percentage => (total != 0)?((compounding_materials / total) * 100):0)
        BpResultValue.create(:bp_result_id => transport_result.id, :indicator_id => indicator.id, :value => transport, :percentage => (total != 0)?((transport / total) * 100):0)
        BpResultValue.create(:bp_result_id => processing_result.id, :indicator_id => indicator.id, :value => processing, :percentage => (total != 0)?((processing / total) * 100):0)
        BpResultValue.create(:bp_result_id => processes_result.id, :indicator_id => indicator.id, :value => processes, :percentage => (total != 0)?((processes / total) * 100):0)
        BpResultValue.create(:bp_result_id => processing_transport_result.id, :indicator_id => indicator.id, :value => processing_transport, :percentage => (total != 0)?((processing_transport / total) * 100):0)
        BpResultValue.create(:bp_result_id => distribution_result.id, :indicator_id => indicator.id, :value => distribution, :percentage => (total != 0)?((distribution / total) * 100):0)
        BpResultValue.create(:bp_result_id => packaging_result.id, :indicator_id => indicator.id, :value => packaging, :percentage => (total != 0)?((packaging / total) * 100):0)
        BpResultValue.create(:bp_result_id => distribution_transport_result.id, :indicator_id => indicator.id, :value => distribution_transport, :percentage => (total != 0)?((distribution_transport / total) * 100):0)
        BpResultValue.create(:bp_result_id => endoflife_result.id, :indicator_id => indicator.id, :value => endoflife, :percentage => (total != 0)?((endoflife / total) * 100):0)
        BpResultValue.create(:bp_result_id => landfill_result.id, :indicator_id => indicator.id, :value => landfill, :percentage => (total != 0)?((landfill / total) * 100):0)
        BpResultValue.create(:bp_result_id => incineration_result.id, :indicator_id => indicator.id, :value => incineration, :percentage => (total != 0)?((incineration / total) * 100):0)
        BpResultValue.create(:bp_result_id => composting_result.id, :indicator_id => indicator.id, :value => composting, :percentage => (total != 0)?((composting / total) * 100):0)
        BpResultValue.create(:bp_result_id => recycling_result.id, :indicator_id => indicator.id, :value => recycling, :percentage => (total != 0)?((recycling / total) * 100):0)
        BpResultValue.create(:bp_result_id => endoflife_transport_result.id, :indicator_id => indicator.id, :value => endoflife_transport, :percentage => (total != 0)?((endoflife_transport / total) * 100):0)
            
       @main_result = root_result
       
        @max = total    
        @limit1 = @max * 0.25
        @limit2 = @max * 0.50
        @limit3 = @max * 0.75                 
       end
       
      
       
    end      

    
  end   

  def get_bp_excel_value indicator, local_name, life_cycle_phase, category
    # TODO -> en excel no espacio
    local_name = local_name.gsub('<', '&lt;')
    local_name = local_name.gsub('>', '&gt;')
     bp_excel_value = BpExcelValue.find(:first, :conditions => ["local_name = ? and life_cycle_phase = ? and indicator_id = ? and category = ?", local_name, life_cycle_phase, indicator.id, category])
     if bp_excel_value
       return bp_excel_value.value
     end
     0
  end

  def get_bp_excel_value_by_family indicator, local_name, life_cycle_phase, category, family
     bp_excel_value = BpExcelValue.find(:first, :conditions => ["local_name = ? and life_cycle_phase = ? and indicator_id = ? and category = ? and family = ?", local_name, life_cycle_phase, indicator.id, category, family])
     if bp_excel_value
       return bp_excel_value.value
     end
     0
  end

  def generate_graphic
    @values_co2_to_array = @ph_result.cabling.to_s + "," + @ph_result.module.to_s + "," + @ph_result.framing.to_s + "," + @ph_result.mounting.to_s + "," + @ph_result.inverter.to_s + "," + @ph_result.batteries.to_s + "," + @ph_result.maintenance.to_s
    @values_pe_to_array = (@ph_embedded_result.pe_pv_cabling / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_pv_module  / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_pv_framing  / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_pv_mounting / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_inverter  / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_batteries / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_maintenance / @ph_embedded_result.averaged_consumption).to_s    
    @labels_size = 7
    @ticks_to_array = "|" + _('Maintenance').html_safe + "|" + _('Batteries').html_safe + "|" + _('Inverter').html_safe + "|" + _('Mounting').html_safe + "|" + _('Framing/Panel').html_safe + "|" + _('Module/Laminate').html_safe + "|" + _('Cabling').html_safe
    
    sort_array = Array.new
    sort_array << @ph_result.cabling
    sort_array << @ph_result.module
    sort_array << @ph_result.framing    
    sort_array << @ph_result.mounting
    sort_array << @ph_result.inverter
    sort_array << @ph_result.batteries    
    sort_array << @ph_result.maintenance
    
    @min = sort_array.sort[0]
    @max = sort_array.sort.reverse[0]
    
    
    ## Grafic 2 Carbon footprint
    @electricity_comparative_ticks = ""
    @electricity_comparative_values = "" 
    @electricity_comparative_series_colors = ""

    @value_electricity = @ph_result.co2_total * 1000 / @ph_embedded_result.lifetime_production
    @ph_embedded_result.lifetime_production
    value_included = false
    if @value_electricity > 818.5
       @electricity_comparative_ticks += _('Electricity from Projected System').html_safe + "|"
       @electricity_comparative_values += @value_electricity.to_s + ","
       @electricity_comparative_series_colors += "990099|"
       value_included = true
    end
    @electricity_comparative_ticks += _('Electricity from Lignite').html_safe + "|"
    @electricity_comparative_values += "818.5,"
    @electricity_comparative_series_colors += "3366CC|"

    if @value_electricity > 774 && !value_included
       @electricity_comparative_ticks += _('Electricity from Projected System').html_safe + "|"
       @electricity_comparative_values += @value_electricity.to_s + ","
       @electricity_comparative_series_colors += "990099|"       
       value_included = true
    end
    @electricity_comparative_ticks += _('Electricity from Hard Coal').html_safe + "|"
    @electricity_comparative_values += "774,"
    @electricity_comparative_series_colors += "DC3912|"    
    
    if @value_electricity > 377 && !value_included
       @electricity_comparative_ticks += _('Electricity from Projected System').html_safe + "|"
       @electricity_comparative_values += @value_electricity.to_s + ","
       @electricity_comparative_series_colors += "990099|"       
       value_included = true
    end
    @electricity_comparative_ticks += _('Electricity from Natural Gas CCP').html_safe + "|"
    @electricity_comparative_values += "377,"
    @electricity_comparative_series_colors += "109618|"
    
    if @value_electricity > 16.65 && !value_included
       @electricity_comparative_ticks += _('Electricity from Projected System').html_safe + "|"
       @electricity_comparative_values += @value_electricity.to_s + ","
       @electricity_comparative_series_colors += "990099|"       
       value_included = true
    end
    @electricity_comparative_ticks += _('Electricity from Offshore Wind Power').html_safe
    @electricity_comparative_values += "16.65"
    @electricity_comparative_series_colors += "FF9900"
    
    if !value_included 
       @electricity_comparative_ticks += "|" + _('Electricity from Projected System').html_safe
       @electricity_comparative_values += "," + @value_electricity.to_s
       @electricity_comparative_series_colors += "|990099"       
    end
    @electricity_comparative_labels_size = 5

    ## Grafic 3 Carbon footprint
    @electricity_country_ticks = "|" + _('Grid Electricity') + "|" + _('PV System')
    @electricity_country_values = @ph_product.ph_basic_information.co2_factor.to_s + ","  + @value_electricity.to_s
    @electricity_country_series_colors = "FF9900|109618"
    @electricity_comparative_labels_size = 2

    ## Grafic 2 Energy
    @energy_yield_ticks = "" + _('Avoided Consumption') + "|" + _('Embodied Energy')
    d30 = @ph_embedded_result.system_emb
    d31 = @ph_embedded_result.averaged_consumption * @ph_product.ph_specified.lifetime
    @energy_yield_values =  (d31.to_f/d30.to_f).to_s + "," + (d30.to_f/d30.to_f).to_s 
    @energy_yield_series_colors = "DC3912|3366CC"
    @energy_yield_labels_size = 2    
  end
    
  def graphic

    @bp_product = BpProduct.find(params[:bp_result_id])
    @product = @bp_product.product
    @step = 2
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @bp_product.product.name, edit_product_url(@bp_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, bp_production_init_path(@bp_product)
    add_breadcrumb _("Graphic results").html_safe, bp_result_graphic_path(@product.bp_product)
    
    @datas = Array.new
    @datas_absolute = Array.new
    
    @labels = Array.new
    @labels_absolute = Array.new      
    
    @colors = Array.new
    @colors_absolute = Array.new    
    @bp_product_result = @bp_product.bp_product_result
    coder = HTMLEntities.new
    
    @indicators_checked = Array.new
    @product.indicators.each do |indicator|
      @indicators_checked << indicator
    end
    
    
    @product.indicators.each do |indicator|
           data = Array.new
           data_absolute = Array.new
           
           result_total = BpResult.find(:all, :conditions => ["name_en=? and bp_product_result_id=?", 'Total', @bp_product.bp_product_result.id]).first
           result_total_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result_total.id]).first
           total = result_total_value.value    
           
           data << 100
           data_absolute << total
           @labels << _('TOTAL')
           @labels_absolute << _('TOTAL')
           @colors << TOTAL_COLOR
           @colors_absolute  << TOTAL_COLOR
           
           
           logger.info "Total --> " + total.to_s
           result_total.children.each do |result| 
             if result.check_graphic 
                result_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result.id]).first            
                if !result_value || total == 0
                   value = 0
                   value_absolute = 0
                else
                   value = ((result_value.value / total) * 100).to_i
                   value_absolute = result_value.value
                end
                logger.info "Result value --> " + value.to_s
                data << value
                data_absolute << value_absolute
                @labels <<  coder.decode(truncate(result.name_ca.html_safe, :length => TRUNCATE))
                @labels_absolute <<  coder.decode(truncate(result.name_ca.html_safe, :length => TRUNCATE))
                @colors << get_color(result.name_en, result.parent.name_en)            
                @colors_absolute << get_color(result.name_ca, result.parent.name_en)
              
               result.children.each do |result| 
                  if result.check_graphic              
                    result_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result.id]).first            
                    if !result_value || total == 0
                       value = 0
                       value_absolute = 0
                    else
                       value = ((result_value.value / total) * 100).to_i
                       value_absolute = result_value.value
                    end

                    data << value
                    data_absolute << value_absolute
                    @labels <<  coder.decode(truncate(result.name_ca.html_safe.gsub('&', '%26'), :length => TRUNCATE))
                    @labels_absolute <<  coder.decode(truncate(result.name_ca.html_safe.gsub('&', '%26'), :length => TRUNCATE))
                    @colors << get_color(result.name_en, result.parent.name_en)
                    @colors_absolute << get_color(result.name_en, result.parent.name_en)
                 end
               end  

                
                
             end   
           end
           if data.size > 0
              @datas << data           
           end
           if data_absolute.size > 0
              @datas_absolute << data_absolute           
           end              
       end
         
       @combineds = Array.new 
       @datas.each do |data|
          one_item = Array.new
          data.each_with_index do |item, index|
            temp = Array.new
            temp << item
            temp << @labels[index].to_s
            temp << @colors[index].to_s
            one_item << temp
          end
          @combineds << one_item
       end
       
       @combineds_absolute = Array.new 
       @datas_absolute.each do |data|
          one_item = Array.new
          data.each_with_index do |item, index|
            temp = Array.new
            temp << item
            temp << @labels_absolute[index].to_s
            temp << @colors_absolute[index].to_s
            one_item << temp
          end
          @combineds_absolute << one_item
       end
       
       @sort = 'no'
  end

  def generate_optimisation
    power_efficiency_projected = @ph_product.ph_specified.efficiency
    power_insolation_projected = @ph_product.ph_basic_information.radiation    
    power_performance_projected = @ph_product.ph_basic_information.performance_ratio
    power_lifetime_projected = @ph_product.ph_specified.lifetime
    if @ph_product.ph_specified.bench_efficiency == 'yes'
        power_efficiency_optimization = @ph_product.ph_specified.ph_module_type.records
    else 
        power_efficiency_optimization = power_efficiency_projected
    end  
    if @ph_product.ph_specified.bench_insolation == 'yes'    
       power_insolation_optimization = 1800
    else
       power_insolation_optimization = power_insolation_projected
    end  
    if @ph_product.ph_specified.bench_performance == 'yes'    
       power_performance_optimization = 0.8
    else
       power_performance_optimization = power_performance_projected
    end 
    if @ph_product.ph_specified.bench_lifetime == 'yes'        
       power_lifetime_optimization = 30
    else
       power_lifetime_optimization = power_lifetime_projected
    end  
    power_efficiency_kwh = @ph_result.lifetime * power_efficiency_optimization / power_efficiency_projected
    power_insolation_kwh = power_efficiency_kwh * power_insolation_optimization / power_insolation_projected
    power_performance_kwh = power_insolation_kwh * power_performance_optimization / power_performance_projected
    @power_lifetime_kwh = power_performance_kwh * power_lifetime_optimization / power_lifetime_projected
    
    @power_efficiency_improvement = (power_efficiency_kwh - @ph_result.lifetime) * 100 / @ph_result.lifetime
    @power_insolation_improvement = (power_insolation_kwh - power_efficiency_kwh) * 100  / @ph_result.lifetime
    @power_performance_improvement = (power_performance_kwh - power_insolation_kwh) * 100  / @ph_result.lifetime
    @power_lifetime_improvement = (@power_lifetime_kwh - power_performance_kwh) * 100  / @ph_result.lifetime
    @power_projected_improvement = @ph_result.lifetime * 100 / @power_lifetime_kwh
    
    @power_efficiency_graph = (power_efficiency_kwh - @ph_result.lifetime) * 100 / @power_lifetime_kwh
    @power_insolation_graph = (power_insolation_kwh - power_efficiency_kwh) * 100 / @power_lifetime_kwh
    @power_performance_graph = (power_performance_kwh - power_insolation_kwh) * 100 / @power_lifetime_kwh
    @power_lifetime_graph = (@power_lifetime_kwh - power_performance_kwh) * 100 / @power_lifetime_kwh
    
    @total_power_improvement = @power_efficiency_improvement + @power_insolation_improvement + @power_performance_improvement + @power_lifetime_improvement  

    @power_optimisation_ticks = _('Projected System') + "|" + _('Efficiency') + "|" + _('Insolation') + "|" + _('Performance Ratio') + "|" + _('Lifetime')     
    @power_optimisation_values = @power_projected_improvement.to_s + "|"  + @power_efficiency_graph.to_s + "|"  + @power_insolation_graph.to_s + "|"  + @power_performance_graph.to_s + "|"  + @power_lifetime_graph.to_s    

    @power_optimisation_series_colors = "3366CC,DC3912,109618,990099,FF9900"
    @power_optimisation_labels_size = 5
    
    
    area_efficiency_projected = @ph_product.ph_specified.efficiency
    area_insolation_projected = @ph_product.ph_basic_information.radiation    
    area_performance_projected = @ph_product.ph_basic_information.performance_ratio
    if @ph_product.ph_specified.bench_efficiency == 'yes'
        area_efficiency_optimization = @ph_product.ph_specified.ph_module_type.records
    else 
        area_efficiency_optimization = area_efficiency_projected
    end  
    if @ph_product.ph_specified.bench_insolation == 'yes'    
       area_insolation_optimization = 1800
    else
       area_insolation_optimization = area_insolation_projected
    end  
    if @ph_product.ph_specified.bench_performance == 'yes'    
       area_performance_optimization = 0.8
    else
       area_performance_optimization = area_performance_projected
    end 

    @area = @ph_product.ph_intermediate_result.module_area
    area_efficiency_m2=  @area * area_efficiency_projected / area_efficiency_optimization
    area_insolation_m2 = area_efficiency_m2 * area_insolation_projected / area_insolation_optimization
    area_performance_m2 = area_insolation_m2 * area_performance_projected / area_performance_optimization
    @area_projected_m2 = area_performance_m2
    
    @area_efficiency_improvement = (area_efficiency_m2 - @area) * 100 * -1 / @area
    @area_insolation_improvement = (area_insolation_m2 - area_efficiency_m2) * 100 * -1 / @area
    @area_performance_improvement = (area_performance_m2 - area_insolation_m2) * 100 * -1 / @area
    @area_projected_improvement = @area_efficiency_improvement + @area_insolation_improvement + @area_performance_improvement 
    
    
    @area_optimisation_ticks = _('Optimized System') + "|" + _('Efficiency') + "|" + _('Insolation') + "|" + _('Performance Ratio')
    @area_optimisation_values = (100 - @area_projected_improvement).to_s + "|"  + @area_efficiency_improvement.to_s + "|"  + @area_insolation_improvement.to_s + "|"  + @area_performance_improvement.to_s    
    @area_optimisation_series_colors = "3366CC,DC3912,109618,990099"
    @area_optimisation_labels_size = 4
    
    
    logger.info '** Summary results **'
    logger.info 'area_efficiency_projected  --> ' +  area_efficiency_projected.to_s
    logger.info 'area_insolation_projected  --> ' +  area_insolation_projected.to_s
    logger.info 'area_performance_projected  --> ' +  area_performance_projected.to_s
    logger.info 'area_efficiency_optimization  --> ' +  area_efficiency_optimization.to_s
    logger.info 'bench_insolation  --> ' +  @ph_product.ph_specified.bench_insolation.to_s
    logger.info 'area_insolation_optimization  --> ' +  area_insolation_optimization.to_s
    logger.info 'area_performance_optimization  --> ' +  area_performance_optimization.to_s
    logger.info 'area_efficiency_improvement  --> ' +  @area_efficiency_improvement.to_s
    logger.info 'area_insolation_improvement  --> ' +  @area_insolation_improvement.to_s
    logger.info 'area_performance_improvement  --> ' +  @area_performance_improvement.to_s
    logger.info 'area_projected_improvement  --> ' +  @area_projected_improvement.to_s
    logger.info '******************'
    
  end

  def optimisation

    @ph_product = PhProduct.find(params[:ph_result_id])
    @ph_result = @ph_product.ph_result
    @ph_maintenance_result  = @ph_product.ph_maintenance_result 
    @ph_embedded_result  = @ph_product.ph_embedded_result 
    @product = @ph_product.product
    @ph_database_materials = PhDatabaseMaterial.all
    @ph_database_material_values = PhDatabaseMaterialValue.find(:all, :conditions => ["ph_product_id = ?", @ph_product.id])
    @step = 4
    
    generate_optimisation
    
  end


  def pdf
   
    @bp_product = BpProduct.find(params[:bp_result_id])
    @product = @bp_product.product

    @datas = Array.new
    @datas_absolute = Array.new
    
    @labels = Array.new
    @labels_absolute = Array.new      
    
    @colors = Array.new
    @colors_absolute = Array.new    
    @bp_product_result = @bp_product.bp_product_result
    coder = HTMLEntities.new
    
    @indicators_checked = Array.new
    @product.indicators.each do |indicator|
       @indicators_checked << indicator
    end
    
    
    @product.indicators.each do |indicator|
         data = Array.new
         data_absolute = Array.new

         result_total = BpResult.find(:all, :conditions => ["name_en=? and bp_product_result_id=?", 'Total', @bp_product.bp_product_result.id]).first
         result_total_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result_total.id]).first
         total = result_total_value.value

         data << 100
         data_absolute << total
         @labels << _('TOTAL')
         @labels_absolute << _('TOTAL')
         @colors << TOTAL_COLOR
         @colors_absolute  << TOTAL_COLOR


         logger.info "TOTAL --> " + total.to_s
         result_total.children.each do |result|
           if result.check_graphic
              result_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result.id]).first
              if !result_value || total == 0
                 value = 0
                 value_absolute = 0
              else
                 value = ((result_value.value / total) * 100).to_i
                 value_absolute = result_value.value
              end
              logger.info "RESULT VALUE --> " + value.to_s
              data << value
              data_absolute << value_absolute
              @labels <<  coder.decode(truncate(result.name_ca.html_safe, :length => TRUNCATE))
              @labels_absolute <<  coder.decode(truncate(result.name_ca.html_safe, :length => TRUNCATE))
              @colors << get_color(result.name_en, result.parent.name_en)
              @colors_absolute << get_color(result.name_ca, result.parent.name_en)

             result.children.each do |result|
                if result.check_graphic
                  result_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result.id]).first
                  if !result_value || total == 0
                     value = 0
                     value_absolute = 0
                  else
                     value = ((result_value.value / total) * 100).to_i
                     value_absolute = result_value.value
                  end

                  data << value
                  data_absolute << value_absolute
                  @labels <<  coder.decode(truncate(result.name_ca.html_safe.gsub('&', '%26'), :length => TRUNCATE))
                  @labels_absolute <<  coder.decode(truncate(result.name_ca.html_safe.gsub('&', '%26'), :length => TRUNCATE))
                  @colors << get_color(result.name_en, result.parent.name_en)
                  @colors_absolute << get_color(result.name_en, result.parent.name_en)
               end
             end



           end
         end
         if data.size > 0
            @datas << data
         end
         if data_absolute.size > 0
            @datas_absolute << data_absolute
         end
     end

     @combineds = Array.new
     @datas.each do |data|
        one_item = Array.new
        data.each_with_index do |item, index|
          temp = Array.new
          temp << item
          temp << @labels[index].to_s
          temp << @colors[index].to_s
          one_item << temp
        end
        @combineds << one_item
     end

     @combineds_absolute = Array.new
     @datas_absolute.each do |data|
        one_item = Array.new
        data.each_with_index do |item, index|
          temp = Array.new
          temp << item
          temp << @labels_absolute[index].to_s
          temp << @colors_absolute[index].to_s
          one_item << temp
        end
        @combineds_absolute << one_item
     end

     @sort = 'no'

    save_path = Rails.root.join('pdfs','bp_report_' + @bp_product.id.to_s + '.pdf')    
    if File.exists?(save_path)
       File.delete(save_path)
    end

    pdf_test = false
    if pdf_test
       render :layout => false
    else
       pdf = WickedPdf.new.pdf_from_string(render_to_string(:template => '/bp_results/pdf.html.erb', :layout => false))
       File.open(save_path, 'wb') do |file|
         file << pdf
       end
    
       # then save to a file
       send_file save_path
    end

  end

  # GET /product_results/1
  # GET /product_results/1.xml
  def summary
   
   @ph_product = PhProduct.find(params[:ph_result_id])
   @product = @ph_product.product
   @step = 1   
   if @ph_product.ph_intermediate_result    
    if !@ph_product.ph_result
        ph_result = PhResult.new 
        ph_result.ph_product_id = @ph_product.id
        ph_result.save
        @ph_product.ph_result = ph_result
    end
    @ph_result = @ph_product.ph_result
    if !@ph_product.ph_maintenance_result 
        ph_maintenance_result  = PhMaintenanceResult.new 
        ph_maintenance_result.ph_product_id = @ph_product.id
        ph_maintenance_result.save
        @ph_product.ph_maintenance_result  = ph_maintenance_result 
    end
    @ph_maintenance_result  = @ph_product.ph_maintenance_result 
    if !@ph_product.ph_embedded_result 
        ph_embedded_result  = PhEmbeddedResult.new 
        ph_embedded_result.ph_product_id = @ph_product.id
        ph_embedded_result.save
        @ph_product.ph_embedded_result  = ph_embedded_result 
    end
    @ph_embedded_result  = @ph_product.ph_embedded_result 
    

    @ph_embedded_result.temperature_induced = 0
    temp = 0
    if @ph_product.ph_specified.ph_module_type.name == 'amorphous Silicon'
        temp = -0.13
    end
    if @ph_product.ph_specified.ph_module_type.name == 'polycrystalline Silicon'
        temp = -0.4465
    end
    if @ph_product.ph_specified.ph_module_type.name == 'monocrystalline Silicon'
        temp = -0.402545
    end
    if @ph_product.ph_specified.ph_module_type.name == 'CdTe Thinfilm'
        temp = -0.25
    end
    if @ph_product.ph_specified.ph_module_type.name == 'CIS/CIGS Thinfilm'
        temp = -0.43666
    end
    
    @ph_embedded_result.temperature_induced = temp * (@ph_product.ph_basic_information.temperature - 25)     
    calcul_efficiency = @ph_product.ph_specified.efficiency * (1 + (@ph_embedded_result.temperature_induced / 100))
    
    ph_database_material_values = PhDatabaseMaterialValue.find(:all, :conditions => ["ph_product_id = ?", @ph_product.id])
    ph_database_material_values.each do |ph_database_material_value|
      ph_database_material_value.delete
    end  
    

    @ph_database_materials = PhDatabaseMaterial.all             
    @ph_database_materials.each do |ph_database_material|
       if ph_database_material.default_value_co2 == 0
          calculate_co2 ph_database_material, @ph_product
      end
      if ph_database_material.default_value_pe == 0
          calculate_pe ph_database_material, @ph_product
      end          
    end
    @ph_database_material_values = PhDatabaseMaterialValue.find(:all, :conditions => ["ph_product_id = ?", @ph_product.id])
    
    n49 = 0
    if @ph_product.ph_specified.area_unit
       n49 = @ph_product.ph_specified.area * @ph_product.ph_specified.area_unit.conversion_factor
    end   
    # ph_result lifetime
    
    if @ph_product.ph_basic_information.known == 'both' || @ph_product.ph_basic_information.known == 'power_demand'
       #Menues!N56*Assumptions!F39
       @ph_result.lifetime = 0
       n56 = 0

       if @ph_product.ph_specified.ph_module_type.name != 'Not specified'
          if @ph_product.ph_specified.power_unit.conversion_factor == -1 
              # Peak Power [kWp]
              conversion_factor = @ph_product.ph_basic_information.radiation * @ph_product.ph_basic_information.performance_ratio
              n56 = @ph_product.ph_specified.power * conversion_factor
          else 
              n56 = @ph_product.ph_specified.power * @ph_product.ph_specified.power_unit.conversion_factor
          end  
          @ph_result.lifetime = n56 * @ph_product.ph_specified.lifetime
       end
    else
        @ph_result.lifetime = n49 * (calcul_efficiency  / 100) * @ph_product.ph_basic_information.performance_ratio * @ph_product.ph_basic_information.radiation * @ph_product.ph_specified.lifetime
    end

    @ph_result.cabling = 0
    temp = 0
    if @ph_product.ph_basic_information.ph_mounting_type.name == 'On Roof - Mounted' || @ph_product.ph_basic_information.ph_mounting_type.name == 'On Roof - Integrated'
        temp = get_database_material_result_co2 'Electrical Cabling', 'Roof Mounted System', @ph_product        
    end
    if @ph_product.ph_basic_information.ph_mounting_type.name == 'Facade - Integrated' || @ph_product.ph_basic_information.ph_mounting_type.name == 'Facade - Mounted'
        temp = get_database_material_result_co2 'Electrical Cabling', 'Facade Mounted System', @ph_product
    end
    if @ph_product.ph_basic_information.ph_mounting_type.name == 'Open Ground'
        temp = get_database_material_result_co2 'Electrical Cabling', 'Ground Mounted System', @ph_product
    end

    logger.info 'temp --> ' + temp.to_s
    logger.info 'n49 --> ' + n49.to_s

  
    @ph_result.cabling = temp * @ph_product.ph_intermediate_result.module_area


    @ph_result.module = 0
    if @ph_product.ph_specified.ph_module_type.name == 'amorphous Silicon'
       # B17
       temp = get_database_material_result_co2 'a-Si', 'Module Laminate', @ph_product
    end
    if @ph_product.ph_specified.ph_module_type.name == 'polycrystalline Silicon'
       # B15
       temp = get_database_material_result_co2 'p-Si', 'Total Module Laminate', @ph_product   
    end
    if @ph_product.ph_specified.ph_module_type.name == 'monocrystalline Silicon'
       # B8
       temp = get_database_material_result_co2 'm-Si', 'Total Module Laminate', @ph_product      
    end
    if @ph_product.ph_specified.ph_module_type.name == 'CdTe Thinfilm'
       # B2
       temp = get_database_material_result_co2 'CdTe', 'Thinfilm', @ph_product   
    end
    if @ph_product.ph_specified.ph_module_type.name == 'CIS/CIGS Thinfilm'
       # B19
       temp = get_database_material_result_co2 'CIS/CIGS', 'Module Laminate', @ph_product      
    end
    @ph_result.module = temp * @ph_product.ph_intermediate_result.module_area

    @ph_result.framing = 0
    if @ph_product.ph_basic_information.framed == 'yes'
     if @ph_product.ph_specified.ph_module_type.name == 'amorphous Silicon'
         # B18 - B17
         temp = (get_database_material_result_co2 'a-Si', 'Module Framed Panel', @ph_product) - (get_database_material_result_co2 'a-Si', 'Module Laminate', @ph_product)
     end
     if @ph_product.ph_specified.ph_module_type.name == 'polycrystalline Silicon'
         # B14
        temp = get_database_material_result_co2 'p-Si', 'Module/Framed Panel', @ph_product   
     end
     if @ph_product.ph_specified.ph_module_type.name == 'monocrystalline Silicon'
         # B7
         temp = get_database_material_result_co2 'm-Si', 'Module/Framed Panel', @ph_product      
     end
     if @ph_product.ph_specified.ph_module_type.name == 'CIS/CIGS Thinfilm'
         # B20 - B19
         temp = (get_database_material_result_co2 'CIS/CIGS', 'Module Framed Panel', @ph_product) - (get_database_material_result_co2 'CIS/CIGS', 'Module Laminate', @ph_product)      
     end    
     if @ph_product.ph_specified.ph_module_type.name == 'CdTe Thinfilm'
         # B2
         temp = 0   
     end     
     @ph_result.framing = temp * @ph_product.ph_intermediate_result.module_area
   end
   
   # ph_result mounting
   @ph_result.mounting = 0      
   if @ph_product.ph_basic_information.ph_mounting_type.name == 'On Roof - Mounted'
       #B24
       temp = get_database_material_result_co2 'Mounting', 'Roof Mounted Structures', @ph_product
   end
   if @ph_product.ph_basic_information.ph_mounting_type.name == 'On Roof - Integrated'
       #B25
       temp = get_database_material_result_co2 'Mounting', 'Roof Integrated Structures', @ph_product
   end
   if @ph_product.ph_basic_information.ph_mounting_type.name == 'Facade - Mounted'
       #B27
       temp = get_database_material_result_co2 'Mounting', 'Facade Mounted Structures', @ph_product       
   end
   if @ph_product.ph_basic_information.ph_mounting_type.name == 'Facade - Integrated'
       #B28
       temp = get_database_material_result_co2 'Mounting', 'Facade Integrated Structures', @ph_product
   end
   if @ph_product.ph_basic_information.ph_mounting_type.name == 'Open Ground'
       #B26
       temp = get_database_material_result_co2 'Mounting', 'Open Ground Structures', @ph_product
   end   
   @ph_result.mounting = temp * @ph_product.ph_intermediate_result.module_area
   
   
   # ph_result inverter
   @ph_result.inverter = 0      
   if @ph_product.ph_electric_component.quantity_1 != 0
      temp = get_database_material_result_co2 'Electrics', '1x Inverter Type 1', @ph_product
      @ph_result.inverter += temp * @ph_product.ph_electric_component.quantity_1
   end
   if @ph_product.ph_electric_component.quantity_2 != 0
      temp = get_database_material_result_co2 'Electrics', '1x Inverter Type 2', @ph_product
      @ph_result.inverter += temp * @ph_product.ph_electric_component.quantity_2
   end
   
   
  # ph_result batteries
   @ph_result.batteries = 0      
   pes_1 = get_database_material_result_co2 'Electrics Battery', 'Lead Acid [kg / pc.]', @ph_product
   pes_2 = get_database_material_result_co2 'Electrics Battery', 'Lead Acid [per kg]', @ph_product
   @ph_result.batteries = @ph_product.ph_electric_component.separated_battery * pes_1 * pes_2
   
  # ph_result maintenance
   @ph_result.maintenance = 0       
   
   
   @ph_result.co2_total = @ph_result.cabling + @ph_result.module + @ph_result.framing + @ph_result.mounting + @ph_result.inverter + @ph_result.batteries

   ###########
   ### MAINTENANCE
   #########
   
   @ph_maintenance_result.years_included = 0
   if @ph_product.ph_maintenance.maintenance_needs == 'yes_5'
       @ph_maintenance_result.years_included = 5
   end
   if @ph_product.ph_maintenance.maintenance_needs == 'yes_10'
       @ph_maintenance_result.years_included = 10
   end
   if @ph_product.ph_maintenance.maintenance_needs == 'yes_15'
       @ph_maintenance_result.years_included = 15
   end
   if @ph_product.ph_maintenance.maintenance_needs == 'yes_20'
       @ph_maintenance_result.years_included = 20
   end
   
   # boolean
   @ph_maintenance_result.inverter_replacement = 0
   if @ph_maintenance_result.years_included != 0
      if @ph_product.ph_maintenance.replacement_inverters == 'yes'
         @ph_maintenance_result.inverter_replacement = 1        
      end  
   end

   # boolean
   @ph_maintenance_result.batteries_replacement = 0
    if @ph_product.ph_maintenance.replacement_batteries == 'yes'
       @ph_maintenance_result.batteries_replacement = 1        
    end  
       
    @ph_maintenance_result.tap_water_l = 0
    if @ph_product.ph_maintenance.cleaning_modules == 'yes'
      @ph_maintenance_result.tap_water_l = 3.25
    end
    
    @ph_maintenance_result.tap_water_co2 = 0
    #b38
    temp =  get_database_material_result_co2 'Maintenance', 'Tap Water', @ph_product
    @ph_maintenance_result.tap_water_co2 = temp * @ph_maintenance_result.tap_water_l
    
    @ph_maintenance_result.tap_water_pe = 0
    #c38
    temp =  get_database_material_result_pe 'Maintenance', 'Tap Water', @ph_product
    @ph_maintenance_result.tap_water_pe = temp * @ph_maintenance_result.tap_water_l
    
    
    @ph_maintenance_result.needed_cycles_1 = 0
    if @ph_product.ph_electric_component.inverter_size_1 != 0 && @ph_product.ph_electric_component.quantity_1 != 0  
      if @ph_maintenance_result.inverter_replacement == 1  
         @ph_maintenance_result.needed_cycles_1 = (@ph_maintenance_result.years_included / @ph_product.ph_electric_component.lifetime_1) - 1
         if @ph_maintenance_result.needed_cycles_1 < 0
           @ph_maintenance_result.needed_cycles_1 = 0
         else  
           @ph_maintenance_result.needed_cycles_1 = @ph_maintenance_result.needed_cycles_1.ceil           
         end
      end
    end
    @ph_maintenance_result.needed_replacements_1 = @ph_maintenance_result.needed_cycles_1 * @ph_product.ph_electric_component.quantity_1
    
    @ph_maintenance_result.embodied_co2_1 = 0
    # B29
    temp = get_database_material_result_co2 'Electrics', '1x Inverter Type 1', @ph_product
    @ph_maintenance_result.embodied_co2_1 = temp * @ph_maintenance_result.needed_replacements_1   
    @ph_maintenance_result.embodied_pe_1 = 0
    # C29
    temp = get_database_material_result_pe 'Electrics', '1x Inverter Type 1', @ph_product
    @ph_maintenance_result.embodied_pe_1 = temp * @ph_maintenance_result.needed_replacements_1

    
    @ph_maintenance_result.needed_cycles_2 = 0
    if @ph_product.ph_electric_component.inverter_size_2 != 0 && @ph_product.ph_electric_component.quantity_2 != 0      
      if @ph_maintenance_result.inverter_replacement == 1  
         @ph_maintenance_result.needed_cycles_2 = (@ph_maintenance_result.years_included / @ph_product.ph_electric_component.lifetime_2) - 1
         if @ph_maintenance_result.needed_cycles_2 < 0
           @ph_maintenance_result.needed_cycles_2 = 0
         else  
           @ph_maintenance_result.needed_cycles_2 = @ph_maintenance_result.needed_cycles_2.ceil
         end         
      end
    end
    @ph_maintenance_result.needed_replacements_2 = @ph_maintenance_result.needed_cycles_2 * @ph_product.ph_electric_component.quantity_2
    
    @ph_maintenance_result.embodied_co2_2 = 0
    # B29
    temp = get_database_material_result_co2 'Electrics', '1x Inverter Type 2', @ph_product
    @ph_maintenance_result.embodied_co2_2 = temp * @ph_maintenance_result.needed_replacements_2
    
    @ph_maintenance_result.embodied_pe_2 = 0
    # C29
    temp = get_database_material_result_pe 'Electrics', '1x Inverter Type 2', @ph_product
    @ph_maintenance_result.embodied_pe_2 = temp * @ph_maintenance_result.needed_replacements_2
    
    
    
    @ph_maintenance_result.driven_maintenance = 2 * @ph_product.ph_maintenance.distance
    @ph_maintenance_result.driven_year = @ph_maintenance_result.driven_maintenance * @ph_product.ph_maintenance.yearly_frequency
    @ph_maintenance_result.driven_contract = @ph_maintenance_result.driven_year * @ph_maintenance_result.years_included
    
    @ph_maintenance_result.embodied_co2_transport = 0 
    #B35
    temp = get_database_material_result_co2 'Maintenance', 'Average Car Driving', @ph_product
    @ph_maintenance_result.embodied_co2_transport = @ph_maintenance_result.driven_contract * temp
    
    @ph_maintenance_result.embodied_pe_transport = 0
    #C35
    temp = get_database_material_result_pe 'Maintenance', 'Average Car Driving', @ph_product
    @ph_maintenance_result.embodied_pe_transport = @ph_maintenance_result.driven_contract * temp
    
    @ph_maintenance_result.embodied_co2_cleaning = @ph_product.ph_intermediate_result.module_area * @ph_maintenance_result.tap_water_co2
    @ph_maintenance_result.embodied_pe_cleaning = @ph_product.ph_intermediate_result.module_area * @ph_maintenance_result.tap_water_pe
    @ph_maintenance_result.total_embodied_co2_cleaning = @ph_maintenance_result.embodied_co2_cleaning * @ph_maintenance_result.years_included * @ph_product.ph_maintenance.yearly_frequency
    @ph_maintenance_result.total_embodied_pe_cleaning = @ph_maintenance_result.embodied_pe_cleaning * @ph_maintenance_result.years_included * @ph_product.ph_maintenance.yearly_frequency
    
    @ph_maintenance_result.needed_cycles_batteries = 0
    if @ph_maintenance_result.batteries_replacement == 1
      @ph_maintenance_result.needed_cycles_batteries = (@ph_maintenance_result.years_included / @ph_product.ph_electric_component.battery_lifetime) - 1
       if @ph_maintenance_result.needed_cycles_batteries < 0
         @ph_maintenance_result.needed_cycles_batteries = 0
       else  
         @ph_maintenance_result.needed_cycles_batteries = @ph_maintenance_result.needed_cycles_batteries.ceil
       end               
    end
    
    @ph_maintenance_result.needed_replacements_batteries = @ph_maintenance_result.needed_cycles_batteries * @ph_product.ph_electric_component.separated_battery
    
    @ph_maintenance_result.embodied_co2_batteries = 0
    #B31
    temp = get_database_material_result_co2 'Electrics Battery', 'Lead Acid [kg / pc.]', @ph_product
    #B32    
    temp_2 = get_database_material_result_co2 'Electrics Battery', 'Lead Acid [per kg]', @ph_product
    @ph_maintenance_result.embodied_co2_batteries = @ph_maintenance_result.needed_replacements_batteries * temp * temp_2
    
    @ph_maintenance_result.embodied_pe_batteries = 0  
    #B31
    temp = get_database_material_result_co2 'Electrics Battery', 'Lead Acid [kg / pc.]', @ph_product
    #C32    
    temp_2 = get_database_material_result_pe 'Electrics Battery', 'Lead Acid [per kg]', @ph_product
    @ph_maintenance_result.embodied_pe_batteries = @ph_maintenance_result.needed_replacements_batteries * temp * temp_2
    
    @ph_maintenance_result.embodied_carbon_dioxide = 0
    @ph_maintenance_result.embodied_primary_energy = 0
    if @ph_product.ph_maintenance.maintenance_needs != 'no'
      @ph_maintenance_result.embodied_carbon_dioxide = @ph_maintenance_result.embodied_co2_1 + @ph_maintenance_result.embodied_co2_2 + @ph_maintenance_result.embodied_co2_transport + @ph_maintenance_result.total_embodied_co2_cleaning + @ph_maintenance_result.embodied_co2_batteries
      @ph_maintenance_result.embodied_primary_energy = @ph_maintenance_result.embodied_pe_1 + @ph_maintenance_result.embodied_pe_2 + @ph_maintenance_result.embodied_pe_transport + @ph_maintenance_result.total_embodied_pe_cleaning + @ph_maintenance_result.embodied_pe_batteries      
    end
    @ph_result.maintenance = @ph_maintenance_result.embodied_carbon_dioxide
    @ph_embedded_result.pe_maintenance = @ph_maintenance_result.embodied_primary_energy
    ##########
    ### EMBEDDED
    ##########

    @ph_embedded_result.lifetime_saved = @ph_result.lifetime * 3.6 / @ph_product.ph_basic_information.conversion_factor
   
    @ph_embedded_result.pe_pv_cabling = 0
    temp = 0
    if @ph_product.ph_basic_information.ph_mounting_type.name == 'On Roof - Mounted' || @ph_product.ph_basic_information.ph_mounting_type.name == 'On Roof - Integrated'
         #C22
         temp = get_database_material_result_pe 'Electrical Cabling', 'Roof Mounted System', @ph_product        
    end 
    if @ph_product.ph_basic_information.ph_mounting_type.name == 'Facade - Integrated' || @ph_product.ph_basic_information.ph_mounting_type.name == 'Facade - Mounted'
         #C21
         temp = get_database_material_result_pe 'Electrical Cabling', 'Facade Mounted System', @ph_product
    end 
    if @ph_product.ph_basic_information.ph_mounting_type.name == 'Open Ground'
         #C23
         temp = get_database_material_result_pe 'Electrical Cabling', 'Ground Mounted System', @ph_product
    end 
    @ph_embedded_result.pe_pv_cabling = temp * @ph_product.ph_intermediate_result.module_area
    
    
    @ph_embedded_result.pe_pv_module  = 0
    if @ph_product.ph_specified.ph_module_type.name == 'amorphous Silicon'
        # B17
        temp = get_database_material_result_pe 'a-Si', 'Module Laminate', @ph_product
    end
    if @ph_product.ph_specified.ph_module_type.name == 'polycrystalline Silicon'
        # B15
        temp = get_database_material_result_pe 'p-Si', 'Total Module Laminate', @ph_product   
    end
    if @ph_product.ph_specified.ph_module_type.name == 'monocrystalline Silicon'
        # B8
        temp = get_database_material_result_pe 'm-Si', 'Total Module Laminate', @ph_product      
    end
    if @ph_product.ph_specified.ph_module_type.name == 'CdTe Thinfilm'
        # B2
        temp = get_database_material_result_pe 'CdTe', 'Thinfilm', @ph_product   
    end
    if @ph_product.ph_specified.ph_module_type.name == 'CIS/CIGS Thinfilm'
        # B19
        temp = get_database_material_result_pe 'CIS/CIGS', 'Module Laminate', @ph_product      
    end
    @ph_embedded_result.pe_pv_module = temp * @ph_product.ph_intermediate_result.module_area    
    
    @ph_embedded_result.pe_pv_framing  = 0
    if @ph_product.ph_basic_information.framed == 'yes'
      if @ph_product.ph_specified.ph_module_type.name == 'amorphous Silicon'
          # B18 - B17
          temp = (get_database_material_result_pe 'a-Si', 'Module Framed Panel', @ph_product) - (get_database_material_result_pe 'a-Si', 'Module Laminate', @ph_product)
      end
      if @ph_product.ph_specified.ph_module_type.name == 'polycrystalline Silicon'
          # B14
         temp = get_database_material_result_pe 'p-Si', 'Module/Framed Panel', @ph_product   
      end
      if @ph_product.ph_specified.ph_module_type.name == 'monocrystalline Silicon'
          # B7
          temp = get_database_material_result_pe 'm-Si', 'Module/Framed Panel', @ph_product      
      end
      if @ph_product.ph_specified.ph_module_type.name == 'CIS/CIGS Thinfilm'
          # B20 - B19
          temp = (get_database_material_result_pe 'CIS/CIGS', 'Module Framed Panel', @ph_product) - (get_database_material_result_pe 'CIS/CIGS', 'Module Laminate', @ph_product)      
      end   
      if @ph_product.ph_specified.ph_module_type.name == 'CdTe Thinfilm'
          # B2
          temp = 0   
      end       
      @ph_embedded_result.pe_pv_framing = temp * @ph_product.ph_intermediate_result.module_area
    end
    
    @ph_embedded_result.pe_pv_mounting = 0
    if @ph_product.ph_basic_information.ph_mounting_type.name == 'On Roof - Mounted'
        #B24
        temp = get_database_material_result_pe 'Mounting', 'Roof Mounted Structures', @ph_product
    end
    if @ph_product.ph_basic_information.ph_mounting_type.name == 'On Roof - Integrated'
        #B25
        temp = get_database_material_result_pe 'Mounting', 'Roof Integrated Structures', @ph_product
    end
    if @ph_product.ph_basic_information.ph_mounting_type.name == 'Facade - Mounted'
        #B27
        temp = get_database_material_result_pe 'Mounting', 'Facade Mounted Structures', @ph_product       
    end
    if @ph_product.ph_basic_information.ph_mounting_type.name == 'Facade - Integrated'
        #B28
        temp = get_database_material_result_pe 'Mounting', 'Facade Integrated Structures', @ph_product
    end
    if @ph_product.ph_basic_information.ph_mounting_type.name == 'Open Ground'
        #B26
        temp = get_database_material_result_pe 'Mounting', 'Open Ground Structures', @ph_product
    end   
    @ph_embedded_result.pe_pv_mounting = temp * @ph_product.ph_intermediate_result.module_area
    
    @ph_embedded_result.pe_inverter = 0
    if @ph_product.ph_electric_component.quantity_1 != 0
       temp = get_database_material_result_pe 'Electrics', '1x Inverter Type 1', @ph_product
       @ph_embedded_result.pe_inverter += temp * @ph_product.ph_electric_component.quantity_1
    end
    if @ph_product.ph_electric_component.quantity_2 != 0
       temp = get_database_material_result_pe 'Electrics', '1x Inverter Type 2', @ph_product
       @ph_embedded_result.pe_inverter += temp * @ph_product.ph_electric_component.quantity_2
    end
    
    
    @ph_embedded_result.pe_batteries = 0
    pes_1 = get_database_material_result_co2 'Electrics Battery', 'Lead Acid [kg / pc.]', @ph_product
    pes_2 = get_database_material_result_pe 'Electrics Battery', 'Lead Acid [per kg]', @ph_product
    @ph_embedded_result.pe_batteries = @ph_product.ph_electric_component.separated_battery * pes_1 * pes_2
    @ph_embedded_result.embedded_energy_total = @ph_embedded_result.pe_pv_cabling + @ph_embedded_result.pe_pv_module + @ph_embedded_result.pe_pv_framing + @ph_embedded_result.pe_pv_mounting + @ph_embedded_result.pe_inverter + @ph_embedded_result.pe_batteries + @ph_embedded_result.pe_maintenance
    @ph_embedded_result.peak_power = @ph_product.ph_intermediate_result.module_area * calcul_efficiency / 100
    @ph_embedded_result.lifetime_production = @ph_result.lifetime
    @ph_embedded_result.averaged_power = @ph_embedded_result.lifetime_production / @ph_product.ph_specified.lifetime
    @ph_embedded_result.averaged_consumption  = @ph_embedded_result.averaged_power * 3.6 / @ph_product.ph_basic_information.conversion_factor  
    @ph_embedded_result.system_emb = @ph_embedded_result.embedded_energy_total
    @ph_embedded_result.energy_payback = @ph_embedded_result.embedded_energy_total / @ph_embedded_result.averaged_consumption
    @ph_embedded_result.energy_yield = @ph_embedded_result.lifetime_saved / @ph_embedded_result.embedded_energy_total
    @ph_embedded_result.emb_co2 = @ph_result.cabling + @ph_result.inverter + @ph_result.batteries

    @ph_result.co2_total += @ph_result.maintenance
    @ph_embedded_result.estim_co2 = 1000 * @ph_result.co2_total / @ph_result.lifetime
    @ph_embedded_result.net_saved_co2 = @ph_embedded_result.lifetime_production * (@ph_product.ph_basic_information.co2_factor - @ph_embedded_result.estim_co2) / 1000   
    
    @ph_product.ph_result.save
    @ph_product.ph_embedded_result.save
    @ph_product.ph_maintenance_result.save
   end    
   respond_to do |format|
     format.html # show.html.erb
     format.xml
   end
  end
  
  
  def get_database_material_result_co2 (module_text, target_text, ph_product)
     ph_database_material = PhDatabaseMaterial.find(:first, :conditions => ["module = ? and target = ?", module_text, target_text])
     ph_database_material_value = PhDatabaseMaterialValue.find(:first, :conditions => ["ph_product_id = ? and ph_database_material_id = ?", ph_product.id, ph_database_material.id])
     if ph_database_material_value
        return ph_database_material_value.co2_value
     end
     return ph_database_material.default_value_co2 
  end

  def get_database_material_result_pe (module_text, target_text, ph_product)
     ph_database_material = PhDatabaseMaterial.find(:first, :conditions => ["module = ? and target = ?", module_text, target_text])
     ph_database_material_value = PhDatabaseMaterialValue.find(:first, :conditions => ["ph_product_id = ? and ph_database_material_id = ?", ph_product.id, ph_database_material.id])
     if ph_database_material_value
        return ph_database_material_value.pe_value
     end
     return ph_database_material.default_value_pe 
  end
  
  
  
  def calculate_co2(ph_database_material, ph_product)
    @b7 = 13.71
    @b14 = 13.705
    assumptions_i71 = ph_product.ph_intermediate_result.wafers_co2    
    assumptions_i72 = ph_product.ph_intermediate_result.cells_co2
    assumptions_i73 = ph_product.ph_intermediate_result.modules_co2    
    assumptions_i74 = ph_product.ph_intermediate_result.cadmium_co2
    assumptions_i75 = ph_product.ph_intermediate_result.cis_co2    
    assumptions_i76 = ph_product.ph_intermediate_result.amorphous_co2
    assumptions_i22 = ph_product.ph_basic_information.co2_factor
    
    assumptions_f85 = ph_product.ph_electric_component.inverter_size_1
    assumptions_f87 = ph_product.ph_electric_component.quantity_1
    assumptions_i85 = ph_product.ph_electric_component.inverter_size_2
    assumptions_i87 = ph_product.ph_electric_component.quantity_2
    
    assumptions_i93 = ph_product.ph_electric_component.capacity_battery
    
    value = 0.0
    if ph_database_material.module == 'CdTe' && ph_database_material.target == 'Thinfilm'
      sum = (27.8 + (35.075 * (assumptions_i74 / 1000))).to_f
      sum += 76.58
      value = (sum / 2).to_f      
    end
    if ph_database_material.module == 'm-Si' && ph_database_material.target == 'Si Feedstock' 
      sum = (20.62 + (55.83 * (assumptions_i22 / 1000))).to_f
      sum += 39.74
      value = (sum / 2).to_f      
      @b3 = value
    # =AVERAGE(20,62+55,83*$Assumptions.I22/1000;39,74)
    end
    if ph_database_material.module == 'm-Si' && ph_database_material.target == 'Wafer'    
      sum = (33.74 + (91.878 * (assumptions_i71 / 1000))).to_f
      sum += 88.0436
      value = (sum / 2).to_f
      @b4 = value
    # =AVERAGE(33,74+91,878*$Assumptions.I71/1000;88,0436)
    end
    if ph_database_material.module == 'm-Si' && ph_database_material.target == 'Cell'
      sum = (12.71 + (30.22 * (assumptions_i72 / 1000))).to_f
      sum += 25.06
      value = (sum / 2).to_f
      @b5 = value
    # =AVERAGE(12,71+30,22*$Assumptions.I72/1000;25,06)
    end    
    if ph_database_material.module == 'm-Si' && ph_database_material.target == 'Module/Laminate'
      sum = (24.94 + (5.7 * (assumptions_i73 / 1000))).to_f
      sum += 31.42
      value = (sum / 2).to_f
      @b6 = value      
    # =AVERAGE(24,94+5,7*$Assumptions.I73/1000;31,42)
    end      
    if ph_database_material.module == 'm-Si' && ph_database_material.target == 'Total Module Laminate'
       value = (@b6 + 0.9314 * (@b5 + 1.06 * (@b4 + 1.0485 * @b3))).to_f
       @b8 = value
        #=B6+0,9314*(B5+1,06*(B4+1,0485*B3))
    end      
    if ph_database_material.module == 'm-Si' && ph_database_material.target == 'Total Module Framed Panel'
       value = @b7 + @b8
        # =B8+B7)
    end      
    if ph_database_material.module == 'p-Si' && ph_database_material.target == 'Si Feedstock' 
      sum = (20.62 + (55.83 * (assumptions_i22 / 1000))).to_f
      sum += 39.74
      value = (sum / 2).to_f      
      @b10 = value
    # =AVERAGE(20,62+55,83*$Assumptions.I22/1000;39,74)
    end
    if ph_database_material.module == 'p-Si' && ph_database_material.target == 'Wafer'    
      sum = (29.76 + (27.99 * (assumptions_i71 / 1000))).to_f
      sum += 43.1
      value = (sum / 2).to_f
      @b11 = value
    # =AVERAGE(29,76+27,99*$Assumptions.I71/1000;43,1)
    end
    if ph_database_material.module == 'p-Si' && ph_database_material.target == 'Cell'
      sum = (12.71 + (30.22 * (assumptions_i72 / 1000))).to_f
      sum += 25.1
      value = (sum / 2).to_f
      @b12 = value
    # =AVERAGE(12,71+30,22*$Assumptions.I72/1000;25,1)
    end    
    if ph_database_material.module == 'p-Si' && ph_database_material.target == 'Module/Laminate'
      sum = (24.94 + (5.7 * (assumptions_i73 / 1000))).to_f
      sum += 31.43
      value = (sum / 2).to_f
      @b13 = value      
    # =AVERAGE(24,94+5,7*$Assumptions.I73/1000;31,42)
    end      
    if ph_database_material.module == 'p-Si' && ph_database_material.target == 'Total Module Laminate'
       value = (@b13 + 0.931 * (@b12 + 1.06 * (@b11 + 1.181 * @b10))).to_f
       @b15 = value
        #==B13+0,931*(B12+1,06*(B11+1,181*B10))
    end      
    if ph_database_material.module == 'p-Si' && ph_database_material.target == 'Total Module Framed Panel'
        value = @b15 + @b14
        # =B15+B14)
    end      
    if ph_database_material.module == 'a-Si' && ph_database_material.target == 'Module Laminate'
      sum = (10.94 + (48.2 * (assumptions_i76 / 1000))).to_f
      sum += 49.3
      value = (sum / 2).to_f
      @b17 = value           
        #=AVERAGE(10,94+48,2*$Assumptions.I76/1000;49,3)
    end      
    if ph_database_material.module == 'a-Si' && ph_database_material.target == 'Module Framed Panel'
        value = @b17 + 24.3
    end      
    if ph_database_material.module == 'CIS/CIGS' && ph_database_material.target == 'Module Laminate'
      sum = (30.11 + (122 * (assumptions_i75 / 1000))).to_f
      sum += 112.26
      value = (sum / 2).to_f
      @b19 = value           
        #=AVERAGE(30,11+122*$Assumptions.I75/1000;112,26)
    end      
    if ph_database_material.module == 'CIS/CIGS' && ph_database_material.target == 'Module Framed Panel'
        value = @b19 + 10.66
    end      
    if ph_database_material.module == 'Electrics' && ph_database_material.target == '1x Inverter Type 1'
       if ((assumptions_f85 != 0) && (assumptions_f87 != 0))
          value = assumptions_f85 * (0.0734 * (assumptions_f85 / 1000) ** -0.171)
       end  
       #=IF(OR($Assumptions.I85=0;$Assumptions.I87=0);0;(($Assumptions.I85)*((0,0734*($Assumptions.I85/1000)^(-0,171)))))
    end     
    if ph_database_material.module == 'Electrics' && ph_database_material.target == '1x Inverter Type 2'
       if ((assumptions_i85 != 0) && (assumptions_i87 != 0))
          value = assumptions_i85 * (0.0734 * (assumptions_i85 / 1000) ** -0.171)
       end  
    end     

    if ph_database_material.module == 'Electrics Battery' && ph_database_material.target == 'Lead Acid [kg / pc.]'
       if ph_product.ph_electric_component.include_batteries == 'yes' && ph_product.ph_electric_component.ph_battery_type.name == 'Lead Acid'
          value = assumptions_i93 * (0.1294 * (assumptions_i93 ** -0.081))
       end
     #  if ((assumptions_i85 != 0) && (assumptions_i87 != 0))
      #    =IF(AND($Assumptions.F91=$Menues.K106;$Menues.K85=$Assumptions.I91);$Assumptions.I93*(0,1294*($Assumptions.I93^(-0,081)));0)
    end
      
    if ph_database_material.module == 'Electrics Battery' && ph_database_material.target == 'Lead Acid [per kg]'
        value = 0.99 + 0.6 * assumptions_i22 / 1000
        # =0,99+0,6*$Assumptions.I22/1000
    end     
    
    
    
    ph_database_material_value = PhDatabaseMaterialValue.find(:first, :conditions => ["ph_product_id = ? and ph_database_material_id = ?", ph_product.id, ph_database_material.id])
    if ph_database_material_value
      ph_database_material_value.co2_value = value
      ph_database_material_value.save
    else  
      PhDatabaseMaterialValue.create(:ph_product_id => ph_product.id, :ph_database_material_id => ph_database_material.id, :co2_value => value)
    end
  end


  ## CALCULATE_PE

  def calculate_pe(ph_database_material, ph_product)
    value = 1.0
    @c7 = 138
    @c14 = 133
    assumptions_i24 = ph_product.ph_basic_information.conversion_factor
    assumptions_f85 = ph_product.ph_electric_component.inverter_size_1
    assumptions_f87 = ph_product.ph_electric_component.quantity_1
    assumptions_i85 = ph_product.ph_electric_component.inverter_size_2
    assumptions_i87 = ph_product.ph_electric_component.quantity_2    
    
    if ph_database_material.module == 'CdTe' && ph_database_material.target == 'Thinfilm'
      #=AVERAGE(873,7;349+35,075*3,6/$Assumptions.I24;1120;918;1399,7)
      sum = 873.7
      sum += (349 + (35.075 * (3.6 / assumptions_i24 ))).to_f
      sum += 1120      
      sum += 918
      sum += 1399.7     
      value = (sum / 5).to_f
    end
    if ph_database_material.module == 'm-Si' && ph_database_material.target == 'Si Feedstock' 
      # =AVERAGE(298+55,83/$Assumptions.I24;582)
       sum = (298 + (55.83 / assumptions_i24)).to_f
       sum += 582
       value = (sum / 2).to_f      
       @c3 = value
    end
    if ph_database_material.module == 'm-Si' && ph_database_material.target == 'Wafer'   
      # =AVERAGE(665+91,878/$Assumptions.I24;1609,79)
       sum = (665 + (91.878 / assumptions_i24)).to_f
       sum += 1609.79
       value = (sum / 2).to_f      
       @c4 = value       
    end
    if ph_database_material.module == 'm-Si' && ph_database_material.target == 'Cell'
      # =AVERAGE(142+30,22/$Assumptions.I24;386,8)
       sum = (142 + (30.22 / assumptions_i24)).to_f
       sum += 386.8
       value = (sum / 2).to_f
       @c5 = value       
    end    
    if ph_database_material.module == 'm-Si' && ph_database_material.target == 'Module/Laminate'
      #=AVERAGE(368+5,7/$Assumptions.I24;437,89)
       sum = (368 + (5.7 / assumptions_i24)).to_f
       sum += 437.89
       value = (sum / 2).to_f
       @c6 = value       
    end      
    if ph_database_material.module == 'm-Si' && ph_database_material.target == 'Total Module Laminate'
       value = (@c6 + 0.9314 * (@c5 + 1.06 * (@c4 + 1.0485 * @c3))).to_f
       @c8 = value
        #=C6+0,9314*(C5+1,06*(C4+1,0485*C3))         
    end      
    if ph_database_material.module == 'm-Si' && ph_database_material.target == 'Total Module Framed Panel'
       value = @c7 + @c8
        # =C8+C7)
    end      
    if ph_database_material.module == 'p-Si' && ph_database_material.target == 'Si Feedstock' 
      # =AVERAGE(298+55,83/$Assumptions.I24;582)
       sum = (298 + (55.83 / assumptions_i24)).to_f
       sum += 582
       value = (sum / 2).to_f      
       @c10 = value
    end
    if ph_database_material.module == 'p-Si' && ph_database_material.target == 'Wafer'   
      # =AVERAGE(624+27,99/$Assumptions.I24;773,24)
       sum = (624 + (27.99 / assumptions_i24)).to_f
       sum += 773.24
       value = (sum / 2).to_f      
       @c11 = value       
    end
    if ph_database_material.module == 'p-Si' && ph_database_material.target == 'Cell'
      # =AVERAGE(142+30,22/$Assumptions.I24;382,4)
       sum = (142 + (30.22 / assumptions_i24)).to_f
       sum += 382.4
       value = (sum / 2).to_f
       @c12 = value       
    end    
    if ph_database_material.module == 'p-Si' && ph_database_material.target == 'Module/Laminate'
       # =AVERAGE(368+5,7/$Assumptions.I24;443,17)
       sum = (368 + (5.7 / assumptions_i24)).to_f
       sum += 443.17
       value = (sum / 2).to_f
       @c13 = value       
    end      
    if ph_database_material.module == 'p-Si' && ph_database_material.target == 'Total Module Laminate'
       value = (@c13 + 0.931 * (@c12 + 1.06 * (@c11 + 1.181 * @c10))).to_f
       @c15 = value
        #=C13+0,931*(C12+1,06*(C11+1,181*C10))         
    end      
    if ph_database_material.module == 'p-Si' && ph_database_material.target == 'Total Module Framed Panel'
       value = @c14 + @c15
        # =C8+C7)
    end      
    if ph_database_material.module == 'a-Si' && ph_database_material.target == 'Module Laminate'
      sum = (204 + (48.2 / assumptions_i24)).to_f
      sum += 791
      sum += 950
      sum += 850      
      value = (sum / 4).to_f
      @c17 = value           
        #=AVERAGE(850;950;791;204+48,2/$Assumptions.I24)
    end      
    if ph_database_material.module == 'a-Si' && ph_database_material.target == 'Module Framed Panel'
        value = @c17 + 285.8
    end      
    if ph_database_material.module == 'CIS/CIGS' && ph_database_material.target == 'Module Laminate'
      sum = (908 + (122 / assumptions_i24)).to_f
      sum += 1730
      value = (sum / 2).to_f
      @c19 = value           
        #=AVERAGE(908+122/$Assumptions.I24;1730)
    end      
    if ph_database_material.module == 'CIS/CIGS' && ph_database_material.target == 'Module Framed Panel'
        value = @c19 + 102.5
    end         
    if ph_database_material.module == 'Electrics' && ph_database_material.target == '1x Inverter Type 1'
       if ((assumptions_f85 != 0) && (assumptions_f87 != 0))
          value = assumptions_f85 * (1.1107 * Math.exp(-0.002 * (assumptions_f85) / 1000))
       end  
       #=($Assumptions.F85)*(1,1107*EXP(-0,002*($Assumptions.F85)/1000))))
    end     
    if ph_database_material.module == 'Electrics' && ph_database_material.target == '1x Inverter Type 2'
       if ((assumptions_i85 != 0) && (assumptions_i87 != 0))
          value = assumptions_i85 * (1.1107 * Math.exp(-0.002 * (assumptions_i85) / 1000))
       end  
    end        
    if ph_database_material.module == 'Electrics Battery' && ph_database_material.target == 'Lead Acid [per kg]'
        value = 25 + 0.6 / assumptions_i24
        # ==25+0,6/$Assumptions.I24
    end    
    
    ph_database_material_value = PhDatabaseMaterialValue.find(:first, :conditions => ["ph_product_id = ? and ph_database_material_id = ?", ph_product.id, ph_database_material.id])
    if ph_database_material_value
      ph_database_material_value.pe_value = value
      ph_database_material_value.save
    else  
      PhDatabaseMaterialValue.create(:ph_product_id => ph_product.id, :ph_database_material_id => ph_database_material.id, :pe_value => value)
    end 
  end


  # GET /product_results/new
  # GET /product_results/new.xml
  def new
    @product_result = ProductResult.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_result }
    end
  end

  # GET /product_results/1/edit
  def edit
    @product_result = ProductResult.find(params[:id])
  end

  # POST /product_results
  # POST /product_results.xml
  def create
    @product_result = ProductResult.new(params[:product_result])

    respond_to do |format|
      if @product_result.save
        format.html { redirect_to(@product_result, :notice => 'Product result was successfully created.') }
        format.xml  { render :xml => @product_result, :status => :created, :location => @product_result }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_results/1
  # PUT /product_results/1.xml
  def update
    @product_result = ProductResult.find(params[:id])

    respond_to do |format|
      if @product_result.update_attributes(params[:product_result])
        format.html { redirect_to(@product_result, :notice => 'Product result was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_results/1
  # DELETE /product_results/1.xml
  def destroy
    @product_result = ProductResult.find(params[:id])
    @product_result.destroy

    respond_to do |format|
      format.html { redirect_to(product_results_url) }
      format.xml  { head :ok }
    end
  end
  
  def next_step
     @product = Product.find(params[:product_id].to_i)
    # do_results_production @product
    
     respond_to do |format|
        format.html { redirect_to bp_result_graphic_path(@product.bp_product)}
     end   
  end


  def generate_csv_economic
    product = get_product(params[:product_id])
    if product
      coder = HTMLEntities.new

      save_path = Rails.root.join('xls','excel_economic_' + product.id.to_s + '.xls')
      if File.exists?(save_path)
        File.delete(save_path)
      end

      workbook = WriteExcel.new(save_path.to_s)
      # green
      workbook.set_custom_color(17, 185, 196, 91)
      # Add worksheet(s)
      worksheet  = workbook.add_worksheet


      worksheet.set_column('A:A', 25) # Column  A   width set to 25
      worksheet.set_column('B:B', 25)
      worksheet.set_column('C:C', 25)
      worksheet.set_column('D:D', 25)
      worksheet.set_column('E:E', 25)



      format_bold = workbook.add_format
      format_bold.set_bold
      format_bold.set_color('black')
      format_bold.set_align('center')
      format_bold.set_bg_color('green')
      format_bold.set_border(2)
      format_bold.set_border_color('white')

      format_no_bold = workbook.add_format
      format_no_bold.set_color('black')
      format_no_bold.set_align('center')
      format_no_bold.set_border(2)
      format_no_bold.set_border_color('white')


      title = _('Life Cycle Phase')
      title_2 = _('Family')
      title_3 = _('Flow')
      title_4 = _('Quantity')
      title_5 = _('Unit')
      worksheet.write(0, 0, title, format_bold)
      worksheet.write(0, 1, title_2, format_bold)
      worksheet.write(0, 2, title_3, format_bold)
      worksheet.write(0, 3, title_4, format_bold)
      worksheet.write(0, 4, title_5, format_bold)

      product.bp_product.bp_economic.bp_electronic_economics.each_with_index do |bp_electronic_economic, index|
        worksheet.write(index + 1, 0, bp_electronic_economic.bp_economical_phase.name, format_no_bold)
        worksheet.write(index + 1, 1, bp_electronic_economic.bp_economical_family.name, format_no_bold)
        flow_name = ''
        if bp_electronic_economic.bp_material
          flow_name = bp_electronic_economic.bp_material.name.html_safe
        end
        if bp_electronic_economic.bp_compound_material
          flow_name = bp_electronic_economic.bp_compound_material.name.html_safe
        end
        if bp_electronic_economic.bp_vehicle
          flow_name = bp_electronic_economic.bp_vehicle.name.html_safe
        end
        if bp_electronic_economic.bp_manufacturing_process
          flow_name = bp_electronic_economic.bp_manufacturing_process.name.html_safe
        end
        if bp_electronic_economic.bp_distribution_default_value
          flow_name = bp_electronic_economic.bp_distribution_default_value.name.html_safe
        end


        worksheet.write(index + 1, 2, flow_name, format_no_bold)
        worksheet.write_number(index + 1, 3, bp_electronic_economic.quantity, format_no_bold)
        worksheet.write(index + 1, 4, "euro/kg".html_safe, format_no_bold)
      end



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
    
    
        #workbook = WriteExcel.new(coder.decode(product.name) + '.xls')
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
        
        worksheet.set_column('A:A', 25) # Column  A   width set to 25
        worksheet.set_column('B:B', 25)
        worksheet.set_column('C:C', 25)
        worksheet.set_column('D:D', 25)
        worksheet.set_column('E:E', 25)
        worksheet.set_column('F:F', 25)
        worksheet.set_column('G:G', 25)
        worksheet.set_column('H:H', 25)
        worksheet.set_column('I:I', 25)
        worksheet.set_column('J:J', 25)
        
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
        worksheet.write(0, 0, title, format_bold_right)
        worksheet.write(1, 0, title_2, format_bold_right)       
        product.indicators.each_with_index do |indicator, index|
          worksheet.write(0, index + 1, coder.decode(indicator.name), format_bold)  # cell B2   
          worksheet.write(1, index + 1, coder.decode(indicator.unit.gsub('<sub>','').gsub('</sub>','').gsub('<sup>','^').gsub('</sup>','')), format_bold)  # cell B2
        end
           
        first_node = BpResult.find(:all, :conditions => ["name_en=? and bp_product_result_id = ?", 'Total', product.bp_product.bp_product_result.id]).first
        
        worksheet.write(2, 0, coder.decode("TOTAL"), format_bold_left)
        product.indicators.each_with_index do |indicator, index| 
          result_value = BpResultValue.find(:all, :conditions => ["bp_result_id=? and indicator_id=?", first_node.id, indicator.id]).first
          if result_value 
             worksheet.write_number(2, index + 1, result_value.value, format_color_1)  # cell B2
          end
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
       indicators.each_with_index do |indicator, index| 
         result_value = BpResultValue.find(:all, :conditions => ["bp_result_id=? and indicator_id=?", child.id, indicator.id]).first
         if result_value
           if result_value.percentage.round < limit1.to_i
              worksheet.write_number(col, index + 1, result_value.value, format_color_4)  # cell B2
           end
           if result_value.percentage.round >= limit1.to_i && result_value.percentage.round < limit2.to_i
              worksheet.write_number(col, index + 1, result_value.value, format_color_3)  # cell B2
           end
           if result_value.percentage.round >= limit2.to_i && result_value.percentage.round < limit3.to_i
              worksheet.write_number(col, index + 1, result_value.value, format_color_2)  # cell B2
           end         
           if result_value.percentage.round >= limit3.to_i
              worksheet.write_number(col, index + 1, result_value.value, format_color_1)  # cell B2
          end
        else
          worksheet.write_number(col, index + 1, 0, format_color_4)  # cell B2
        end
       end
       col = generate_worksheet first_node,child, product, worksheet, col, indicators, format_bold, format_bold_left, format_bold_right, format_color_1, format_color_2, format_color_3, format_color_4, limit1, limit2, limit3
     end
     return col
  end    
  
  
  
  
   def compare
    
     @bp_product = BpProduct.find(params[:bp_product_id])
     @product = @bp_product.product

     add_breadcrumb _("My products").html_safe, :products_url
     add_breadcrumb @bp_product.product.name, edit_product_url(@bp_product.product)
     add_breadcrumb _("Environmental Assessment").html_safe, bp_production_init_path(@bp_product)
     add_breadcrumb _("Comparison").html_safe, bp_comparison_url(@product.bp_product)

     begin
        @product_to_compare = BpProduct.find(params[:compareTo])
     rescue
     end
     do_comparison
   end
   
   def pdf_compare
     @bp_product = BpProduct.find(params[:bp_product_id])
     @product = @bp_product.product

     begin
        @product_to_compare = BpProduct.find(params[:bp_product_to_compare_id])
     rescue
     end
     do_comparison    
     
     
     save_path = Rails.root.join('pdfs','bp_comparison_' + @bp_product.id.to_s + '.pdf')
     if File.exists?(save_path)
       File.delete(save_path)
     end

     pdf_test = false
     if pdf_test
       render :layout => false
     else
       pdf = WickedPdf.new.pdf_from_string(render_to_string(:template => '/bp_results/pdf_compare.html.erb', :layout => false))
       File.open(save_path, 'wb') do |file|
        file << pdf
       end
       send_file save_path
     end
     
   end
   
   def do_comparison
     if @bp_product     
       @step = 3
       @line_charts = Array.new
       @datas = Array.new
       @datas_absolute = Array.new       
       @datas_production = Array.new
       @datas_use = Array.new
       
       @labels = Array.new
       @labels_absolute = Array.new       
       @labels_production = Array.new
       @labels_use = Array.new       
       
       @colors = Array.new
       @colors_absolute = Array.new
       @colors_production = Array.new
       @colors_use = Array.new       
       coder = HTMLEntities.new
       
       @indicators_checked = Array.new
       @product.indicators.each do |indicator|
       #  @indicators_checked << indicator 
       end


      @compare_values_1 = Array.new
      @compare_values_2 = Array.new
      @compare_titles = Array.new
      @compare_max = 0
      @compare_min = 0    

      @compare_arrays_1 = Array.new
      @compare_arrays_2 = Array.new

      @compare_titles = Array.new
      @compare_products = @product.name
      @products_checked = Array.new
      colors = ["0033FF","00CCFF","336600","663300","CC6600","FF3300","FFCC00","FFFF00"]

      params.each do |key, value|
         if key.match(/^compare_product_/)
           bp_product_id = key[16..key.length]
           bp_product = BpProduct.find(bp_product_id)
           @products_checked << bp_product
           @compare_products += "|" + bp_product.product.name
         end
      end


      @phases_selected = 0
      if params[:total]
         @compare_titles << "TOTAL"
         @total_check = true
         @total_array = Array.new
         @phases_selected += 1
      end

      if params[:materials]
         @compare_titles << "MATERIALS"
         @materials_check = true
         @materials_array = Array.new
         @phases_selected += 1
      end

      if params[:transport]
         @compare_titles << "TRANSPORT"
         @transport_check = true
         @transport_array = Array.new
         @phases_selected += 1
      end

      if params[:processing]
         @compare_titles << "PROCESSING"
         @processing_check = true
         @processing_array = Array.new
         @phases_selected += 1
      end

      if params[:distribution]
         @compare_titles << "DISTRIBUTION"
         @distribution_check = true
         @distribution_array = Array.new
         @phases_selected += 1
      end

      if params[:end_of_life]
         @compare_titles << "END-OF-LIFE"
         @end_of_life_check = true
         @end_of_life_array = Array.new
         @phases_selected += 1
      end

      @compare_titles_to_array = '|'
      @compare_titles.reverse.each_with_index do |compare_title, index|
        @compare_titles_to_array += compare_title
        if index != @compare_titles.size
           @compare_titles_to_array += '|'
        end
      end

      @colors_array = colors[0]
      @products_checked.reverse.each_with_index do |product, index|
        @colors_array += ',' + colors[index + 1]
      end

      @values_array = Array.new
      @product.indicators.sort_by{ |k| k['id'] }.each do |indicator|
         indicator_ok = false
         params.each do |key, value|
            if key == 'indicator_' + indicator.id.to_s
              indicator_ok = true
              @indicators_checked << indicator
            #  @compare_values_1 = Array.new
             # @compare_values_2 = Array.new
            end  
         end
       if indicator_ok
         @total_array = Array.new
         @materials_array = Array.new
         @transport_array = Array.new
         @processing_array = Array.new
         @distribution_array = Array.new
         @end_of_life_array = Array.new

         if @total_check
           result_total = BpResult.find(:all, :conditions => ["name_en=? and bp_product_result_id=?", 'Total', @bp_product.bp_product_result.id]).first
           if result_total
             result_total_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result_total.id]).first
             if result_total_value
               @total_array << result_total_value.value
             else
               @total_array << 0
             end
           else
             @total_array << 0
           end

           @products_checked.each_with_index do |product_to_compare, index|
             if product_to_compare.bp_product_result
               result_total_compare = BpResult.find(:all, :conditions => ["name_en=? and bp_product_result_id=?", 'Total', product_to_compare.bp_product_result.id]).first
               if result_total_compare
                 result_total_compare_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result_total_compare.id]).first
                 @total_array << (result_total_compare_value ? result_total_compare_value.value : 0)
               else
                 @total_array << 0
               end
             end
           end
         end



         if @materials_check
           result_total = BpResult.find(:all, :conditions => ["name_en=? and bp_product_result_id=?", 'MATERIALS', @bp_product.bp_product_result.id]).first
           if result_total
             result_total_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result_total.id]).first
             if result_total_value
               @materials_array << result_total_value.value
             else
               @materials_array << 0
             end
           else
             @materials_array << 0
           end

           @products_checked.each_with_index do |product_to_compare, index|
             if  product_to_compare.bp_product_result
               result_total_compare = BpResult.find(:all, :conditions => ["name_en=? and bp_product_result_id=?", 'MATERIALS', product_to_compare.bp_product_result.id]).first
               if result_total_compare
                 result_total_compare_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result_total_compare.id]).first
                 @materials_array << (result_total_compare_value ? result_total_compare_value.value : 0)
               else
                 @materials_array << 0
               end
             end
           end
         end



         if @transport_check
           result_total = BpResult.find(:all, :conditions => ["name_en=? and bp_product_result_id=?", 'TRANSPORT', @bp_product.bp_product_result.id]).first
           if result_total
             result_total_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result_total.id]).first
             if result_total_value
               @transport_array << result_total_value.value
             else
               @transport_array << 0
             end
           else
             @transport_array << 0
           end

           @products_checked.each_with_index do |product_to_compare, index|
             if product_to_compare.bp_product_result
               result_total_compare = BpResult.find(:all, :conditions => ["name_en=? and bp_product_result_id=?", 'TRANSPORT', product_to_compare.bp_product_result.id]).first
               if result_total_compare
                 result_total_compare_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result_total_compare.id]).first
                 @transport_array << (result_total_compare_value ? result_total_compare_value.value : 0)
               else
                 @transport_array << 0
               end
             end
           end
         end



         if @processing_check
           result_total = BpResult.find(:all, :conditions => ["name_en=? and bp_product_result_id=?", 'PROCESSING', @bp_product.bp_product_result.id]).first
           if result_total
             result_total_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result_total.id]).first
             if result_total_value
               @processing_array << result_total_value.value
             else
               @processing_array << 0
             end
           else
             @processing_array << 0
           end

           @products_checked.each_with_index do |product_to_compare, index|
             if product_to_compare.bp_product_result
               result_total_compare = BpResult.find(:all, :conditions => ["name_en=? and bp_product_result_id=?", 'PROCESSING', product_to_compare.bp_product_result.id]).first
               if result_total_compare
                 result_total_compare_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result_total_compare.id]).first
                 @processing_array << (result_total_compare_value ? result_total_compare_value.value : 0)
               else
                 @processing_array << 0
               end
             end
           end
         end


         if @distribution_check
           result_total = BpResult.find(:all, :conditions => ["name_en=? and bp_product_result_id=?", 'DISTRIBUTION', @bp_product.bp_product_result.id]).first
           if result_total
             result_total_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result_total.id]).first
             if result_total_value
               @distribution_array << result_total_value.value
             else
               @distribution_array << 0
             end
           else
             @distribution_array << 0
           end

           @products_checked.each_with_index do |product_to_compare, index|
             if product_to_compare.bp_product_result
               result_total_compare = BpResult.find(:all, :conditions => ["name_en=? and bp_product_result_id=?", 'DISTRIBUTION', product_to_compare.bp_product_result.id]).first
               if result_total_compare
                 result_total_compare_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result_total_compare.id]).first
                 @distribution_array << (result_total_compare_value ? result_total_compare_value.value : 0)
               else
                 @distribution_array << 0
               end
             end
           end
         end


         if @end_of_life_check
           result_total = BpResult.find(:all, :conditions => ["name_en=? and bp_product_result_id=?", 'END-OF-LIFE', @bp_product.bp_product_result.id]).first
           if result_total
             result_total_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result_total.id]).first
             if result_total_value
               @end_of_life_array << result_total_value.value
             else
               @end_of_life_array << 0
             end
           else
             @end_of_life_array << 0
           end

           @products_checked.each_with_index do |product_to_compare, index|
             if product_to_compare.bp_product_result
               result_total_compare = BpResult.find(:all, :conditions => ["name_en=? and bp_product_result_id=?", 'END-OF-LIFE', product_to_compare.bp_product_result.id]).first
               if result_total_compare
                 result_total_compare_value = BpResultValue.find(:all, :conditions => ["indicator_id = ? AND bp_result_id = ?", indicator.id, result_total_compare.id]).first
                 @end_of_life_array << (result_total_compare_value ? result_total_compare_value.value : 0)
               else
                 @end_of_life_array << 0
               end
             end
           end
         end


         # END INDICATOR
         values_string_all_products = ''
         values_string = ''
         if @total_check
           if values_string != ''
             values_string += ','
           end
           values_string += @total_array[0].to_s
         end
         if @materials_check
           if values_string != ''
             values_string += ','
           end
           values_string += @materials_array[0].to_s
         end
         if @transport_check
           if values_string != ''
             values_string += ','
           end
           values_string += @transport_array[0].to_s
         end
         if @processing_check
           if values_string != ''
             values_string += ','
           end
           values_string += @processing_array[0].to_s
         end
         if @distribution_check
           if values_string != ''
             values_string += ','
           end
           values_string += @distribution_array[0].to_s
         end
         if @end_of_life_check
           if values_string != ''
             values_string += ','
           end
           values_string += @end_of_life_array[0].to_s
         end
         values_string += '|'
         values_string_all_products += values_string


         @products_checked.each_with_index do |product_to_compare, index|
           values_string = ''

           if @total_check
             if values_string != ''
               values_string += ','
             end
             values_string += @total_array[index + 1].to_s
           end
           if @materials_check
             if values_string != ''
               values_string += ','
             end
             values_string += @materials_array[index + 1].to_s
           end
           if @transport_check
             if values_string != ''
               values_string += ','
             end
             values_string += @transport_array[index + 1].to_s
           end
           if @processing_check
             if values_string != ''
               values_string += ','
             end
             values_string += @processing_array[index + 1].to_s
           end
           if @distribution_check
             if values_string != ''
               values_string += ','
             end
             values_string += @distribution_array[index + 1].to_s
           end
           if @end_of_life_check
             if values_string != ''
               values_string += ','
             end
             values_string += @end_of_life_array[index + 1].to_s
           end

           if index != @products_checked.size - 1
             values_string += '|'
           end
           values_string_all_products += values_string
         end

         @values_array << values_string_all_products


        end
      end
     else
       respond_to do |format|
         format.html { redirect_to(products_url) }
         format.xml { head :ok }
       end
     end
   end
  
  
end
