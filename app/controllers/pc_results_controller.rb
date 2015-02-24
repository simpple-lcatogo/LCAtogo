class PcResultsController < ApplicationController
  require 'csv'
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
    @pc_product = PcProduct.find(params[:id])
    #@pc_result = @pc_product.pc_result
    @product = @pc_product.product
    @indicators_checked = Array.new 
    @indicators = Indicator.where("sector='printed'")
    Indicator.all.each do |indicator|
        if @product.indicators.include?indicator
          @indicators_checked << indicator
        end
    end
    
    @step = 1
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, pc_basic_url(@pc_product)
    add_breadcrumb _("Detailed results").html_safe, pc_result_path(@product.pc_product)
    
    
    do_results
  end
  
  def do_results
    pcb_area = @pc_product.pc_basic.pcb_area

    @sophisticated = false
    if @pc_product.pc_basic.assessment == 'sophisticated'
       @sophisticated = true
       fwc = (@pc_product.pc_basic.water.to_f / @pc_product.pc_basic.pcbs.to_f) / 1.320.to_f
       fehc = ((@pc_product.pc_basic.electric + (@pc_product.pc_basic.heat * 277.7693581).to_f)/ @pc_product.pc_basic.pcbs.to_f).to_f / 172.440.to_f
       fscw = (@pc_product.pc_basic.waste.to_f / @pc_product.pc_basic.pcbs.to_f).to_f / 4.882.to_f
       fve = (@pc_product.pc_basic.ghg.to_f / @pc_product.pc_basic.pcbs.to_f) / 0.428.to_f
       fvp = (@pc_product.pc_basic.pcbs.to_f / @pc_product.pc_basic.pcbs.to_f) / 17273.to_f
       
       logger.info "fwc --> " + fwc.to_s       
       logger.info "fehc --> " + fehc.to_s
       logger.info "fscw --> " + fscw.to_s
       logger.info "fve --> " + fve.to_s
       logger.info "fvp --> " + fvp.to_s       
    end

    

    @pc_result_values = PcResultValue.find_all_by_pc_product_id(@pc_product.id)    
    @pc_result_values.each do |pc_result_value|
       pc_result_value.delete
    end
    
    @indicators_checked.each do |indicator|
       value = 0
       pcb_number = @pc_product.pc_basic.pcb_number
       
       layers = @pc_product.pc_basic.layers    
       coating_type = ''
       if @pc_product.pc_basic.pc_coating_type       
          coating_type = @pc_product.pc_basic.pc_coating_type.name
       end   
       search_category = 'Elastic'
       if @pc_product.pc_basic.pcb_type == 'rigid'
          search_category = 'Rigid'
       end
       search_family = 'Single-sided PCB (1 layer)'
       if layers
         if layers == 2
            search_family = 'Double-sided (2 layers)'
         end
         if layers > 2
            search_family = '1-layer of PCB in multilayer PCB (>2 layers)'
         end
       end       
       
       if indicator.name == 'Water consumption'
          value_itw = get_pc_excel_value(indicator.id, "PCB", "MATERIAL", search_category, search_family)                          
          value_icw  = get_pc_excel_value(indicator.id, coating_type, "MATERIAL", "Coating", "Coating")
          value = 0
          if pcb_area && layers
              value = (pcb_area * (layers * value_itw + value_icw))                
              if @sophisticated
                value = value * fwc
              end
          end   
       end
       
       if indicator.name == 'Energy consumption'

          value_item = get_pc_excel_value(indicator.id, "PCB", "MATERIAL", search_category, search_family)    
          value_icem = get_pc_excel_value(indicator.id, coating_type, "MATERIAL", "Coating", "Coating")               
          value_itep = get_pc_excel_value(indicator.id, "PCB", "ENERGY IN PRODUCTION", "Rigid/Elastic", search_family)
          value_icep = get_pc_excel_value(indicator.id, coating_type, "ENERGY IN PRODUCTION", "Coating", "Coating")          
          value = 0
          if pcb_area && layers
              ecm = (pcb_area * (layers * value_item + value_icem))
              @ecm = ecm
              ecp = (pcb_area * (layers * value_itep + value_icep))
              if @sophisticated
                ecp =  ecp * fehc
              end
              @ecp = ecp      
              
              value = ecm + ecp
                            
          end                    
       end       
       
       if indicator.name == 'Total sludge and waste emitted'
          value_itsw = get_pc_excel_value(indicator.id, "PCB", "ENERGY IN PRODUCTION", "Rigid/Elastic", search_family)
          value_ictw = get_pc_excel_value(indicator.id, coating_type, "ENERGY IN PRODUCTION", "Coating", "Coating")          
          value = 0
          if pcb_area && layers
            value = (pcb_area * (layers * value_itsw + value_ictw))
            if @sophisticated
              value = value * fscw
            end
          end 
       end
       
       if indicator.name == 'Carbon footprint - CF'
         cf_m = 0
         cf_p = 0
         cf_ghg = 0
         cf_t = 0
         
         country = ""
         if @pc_product.pc_basic.pc_country_info            
            country = @pc_product.pc_basic.pc_country_info.name
         end   
         value_electricity = get_pc_excel_value(indicator.id, "Electricity_" + country, "PRODUCTION", "ENERGY", "Electricity")
         
         
         logger.info "country --> " + country
         logger.info "value_electricity --> " + value_electricity.to_s
         
         indicator_energy = Indicator.find_by_name("Energy consumption")
         
         value_icfmt = value_electricity * get_pc_excel_value(indicator_energy.id, "PCB", "MATERIAL", search_category, search_family)   
         value_icfmc = value_electricity * get_pc_excel_value(indicator_energy.id, coating_type, "MATERIAL", "Coating", "Coating")
         value_icfpt = value_electricity * get_pc_excel_value(indicator_energy.id, "PCB", "ENERGY IN PRODUCTION", "Rigid/Elastic", search_family)
         value_icfpc = value_electricity * get_pc_excel_value(indicator_energy.id, coating_type, "ENERGY IN PRODUCTION", "Coating", "Coating")         
         value_icfghg = get_pc_excel_value(indicator.id, "PCB", "PRODUCTION", "Rigid/Elastic", search_family)        
         
         
         
         cf_m = 0
         cf_p = 0
         cf_ghg = 0
         cf_t = 0
         if pcb_area && layers
           cf_m = (pcb_area * (layers * value_icfmt + value_icfmc))
           
           if @sophisticated
              cf_p = (pcb_area * (layers * value_icfpt * fehc + value_icfpc * fehc))
           else
              cf_p = (pcb_area * (layers * value_icfpt + value_icfpc))
           end   
              
           cf_ghg = pcb_area * layers * value_icfghg
           if @sophisticated
              cf_ghg = cf_ghg * fve
           end
         
           @pc_product.pc_transport_datas.each do |pc_transport_data|
              excel_value = get_pc_excel_value_no_family(indicator.id, pc_transport_data.pc_transport_type.name, "DISTRIBUTION", "TRANSPORT")  
              cf_t += pc_transport_data.distance * excel_value
           end         
           cf_t = cf_t * pcb_area
         end         
         logger.info "***********************************************"
         logger.info "value_icfmt --> " + value_icfmt.to_s
         logger.info "value_icfmc --> " + value_icfmc.to_s
         logger.info "value_icfpt --> " + value_icfpt.to_s
         logger.info "value_icfpc --> " + value_icfpc.to_s
         logger.info "cf_m --> " + cf_m.to_s
         logger.info "cf_p --> " + cf_p.to_s
         logger.info "cf_ghg --> " + cf_ghg.to_s
         logger.info "cf_t --> " + cf_t.to_s         
         logger.info "***********************************************"         
         
         @cf_m = cf_m
         @cf_p = cf_p
         @cf_ghg = cf_ghg
         @cf_t = cf_t
         
         value = cf_m + cf_p + cf_ghg + cf_t
         @colors = ["0033FF","00CCFF","336600","663300","CC6600","FF3300","FFCC00","FFFF00"]  
         @graphic_ticks = _('CF of transport').html_safe + '|' + _('CF of gas emissions to air').html_safe + '|' + _('CF of production processes').html_safe + '|' + _('CF of materials').html_safe + '|' + _('Total CF').html_safe
         @graphic_values = value.to_s + ',' + cf_m.to_s + ',' + cf_p.to_s + ',' + cf_ghg.to_s  + ',' + cf_t.to_s            
         @graphic_colors = @colors[0].to_s + '|' + @colors[1].to_s + '|' + @colors[1].to_s + '|' + @colors[1].to_s  + '|' + @colors[1].to_s
         
          tmp_array = Array.new
          tmp_array << cf_m
          tmp_array << cf_p
          tmp_array << cf_ghg      
          tmp_array << cf_t          
          @min_graphic = tmp_array.sort[0]
          if @min_graphic > 0 
             @min_graphic = 0
          end
          
          @max_graphic = value + 30              
       end
       
       if indicator.name == 'Cu'
          value = 0
          if layers && pcb_area
             value = layers * 0.0035 * pcb_area * 10000 * 8.96 * 0.4
          end   
       end

       if indicator.name == 'Resin'
          value = 0
          if pcb_area
            value = 1095.93 * pcb_area
          end  
       end

       if indicator.name == 'Glass'
          value = 0
          if pcb_area
             value = 1577.07 * pcb_area
          end   
       end
       
       if indicator.name == 'Au'
          value = 0
          if coating_type == 'ENIG' && pcb_area
             value = 0.46368 * pcb_area
          end   
       end       
       
       if indicator.name == 'Ni'
          value = 0
          if coating_type == 'ENIG' && pcb_area
             value = 10.68 * pcb_area
          end   
       end       

       if indicator.name == 'Ag'
          value = 0
          if coating_type == 'Ag' && pcb_area
             value = 10.68 * pcb_area
          end   
       end       

       if indicator.name == 'Sn'
          value = 0
          if pcb_area
            if coating_type == 'Sn'
               value = 1.462 * pcb_area
            end
            if coating_type == 'HASL'
               value = 14.63596 * pcb_area
            end   
          end
       end       
       
       if !pcb_number
         pcb_number = 0
       end
       PcResultValue.create(:pc_product_id => @pc_product.id, :indicator_id => indicator.id, :value_one => value, :value_n => value * pcb_number)
    end
    
    @pc_result_values = PcResultValue.find_all_by_pc_product_id(@pc_product.id)
    
  end   

  def get_pc_excel_value indicator_id, name, lifecycle, category, family    
     pc_excel_value = PcExcelValue.find_by_indicator_id_and_name_and_lifecycle_and_category_and_family(indicator_id, name, lifecycle, category, family)
     if pc_excel_value
       return pc_excel_value.value
     end
     return 0
  end

  def get_pc_excel_value_no_family indicator_id, name, lifecycle, category  
     pc_excel_value = PcExcelValue.find_by_indicator_id_and_name_and_lifecycle_and_category(indicator_id, name, lifecycle, category)
     if pc_excel_value
       return pc_excel_value.value
     end
     return 0
  end


  def compare
    @step = 2
    
    @pc_product = PcProduct.find(params[:pc_product_id])
    @product = @pc_product.product
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, pc_basic_url(@pc_product)
    add_breadcrumb _("Comparison").html_safe, pc_comparison_path(@product.pc_product)
    
    do_comparison
    
  end   
    

  def pdf_compare
    @step = 2
    
    @pc_product = PcProduct.find(params[:pc_product_id])
    @product = @pc_product.product
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, pc_basic_url(@product)
    add_breadcrumb _("Comparison").html_safe, pc_comparison_path(@product.pc_product)
    
    do_comparison
    
     save_path = Rails.root.join('pdfs','pc_comparison_' + @pc_product.id.to_s + '.pdf')
     if File.exists?(save_path)
       File.delete(save_path)
     end


     pdf_test = false
     if pdf_test
        # HTML version
        render :layout => false
     else
        pdf = WickedPdf.new.pdf_from_string(render_to_string(:template => '/pc_results/pdf_compare.html.erb', :layout => false).force_encoding("UTF-8"))
        File.open(save_path, 'wb') do |file|
          file << pdf.force_encoding("UTF-8")
        end
        send_file save_path
     end
  end   
    
    
  def do_comparison    
    @indicators_checked = Indicator.find_all_by_sector("printed")

    @cf_m_array = Array.new
    @cf_p_array = Array.new
    @cf_ghg_array = Array.new
    @cf_t_array = Array.new
    @ecm_array = Array.new
    @ecp_array = Array.new

    @pc_product_init = @pc_product
    # Results original product
    do_results
    @cf_m_array << ((@cf_m.blank?)?0:@cf_m)
    @cf_p_array << ((@cf_p.blank?)?0:@cf_p)
    @cf_ghg_array << ((@cf_ghg.blank?)?0:@cf_ghg)
    @cf_t_array << ((@cf_t.blank?)?0:@cf_t)
    @ecm_array << ((@ecm.blank?)?0:@ecm)
    @ecp_array << ((@ecp.blank?)?0:@ecp)



    @products_checked = Array.new
    @compare_products = @pc_product.product.name
    params.each do |key, value|
      if key.match(/^compare_product_/)
        pc_product_id = key[16..key.length]
        pc_product = PcProduct.find(pc_product_id)
        @products_checked << pc_product
        @compare_products += "|" + pc_product.product.name

        @pc_product = pc_product
        do_results
        @cf_m_array << ((@cf_m.blank?)?0:@cf_m)
        @cf_p_array << ((@cf_p.blank?)?0:@cf_p)
        @cf_ghg_array << ((@cf_ghg.blank?)?0:@cf_ghg)
        @cf_t_array << ((@cf_t.blank?)?0:@cf_t)
        @ecm_array << ((@ecm.blank?)?0:@ecm)
        @ecp_array << ((@ecp.blank?)?0:@ecp)

      end
    end


    

    @pc_result_values_array = Array.new
    @pc_result_values_array << PcResultValue.find_all_by_pc_product_id(@pc_product_init.id)

    @products_checked.each do |pc_product|
      @pc_result_values_array << PcResultValue.find_all_by_pc_product_id(pc_product.id)
    end

    @indicators_checked = Array.new
    

    @values_array = Array.new
    @ticks_array = Array.new
    
    colors = ["0033FF","00CCFF","336600","663300","CC6600","FF3300","FFCC00","FFFF00"]
    @seriesColors_to_array = "999999"
    @products_checked.each_with_index do |pc_product, index|
      @seriesColors_to_array += "," + colors[index]
    end

    @pc_product = @pc_product_init

    @indicators = Indicator.find_all_by_sector("printed")
    @indicators.each do |indicator|
       indicator_ok = false
       params.each do |key, value|
          if key == 'indicator_' + indicator.id.to_s
            indicator_ok = true
          end
       end
   
       if indicator_ok
           @indicators_checked << indicator
           pc_result_value = PcResultValue.find_by_indicator_id_and_pc_product_id(indicator.id, @pc_product.id)
           values_string = ((pc_result_value.blank?)?0:pc_result_value.value_one.to_s)

           @products_checked.each_with_index do |pc_product, index|
               pc_result_value = PcResultValue.find_by_indicator_id_and_pc_product_id(indicator.id, pc_product.id)
               values_string += "|" + ((pc_result_value.blank?)?0:pc_result_value.value_one.to_s)
           end
           @values_array << values_string.to_s
       end
      
       
     end
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
  #  value_electricity = 43.5
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

    @ph_product = PhProduct.find(params[:ph_result_id])
    @ph_result = @ph_product.ph_result
    @ph_maintenance_result  = @ph_product.ph_maintenance_result 
    @ph_embedded_result  = @ph_product.ph_embedded_result 
    @product = @ph_product.product
    @ph_database_materials = PhDatabaseMaterial.all
    @ph_database_material_values = PhDatabaseMaterialValue.find(:all, :conditions => ["ph_product_id = ?", @ph_product.id])
    @step = 3
    
    generate_graphic
    
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

    @power_optimisation_ticks = _('Projected System') + "|" + _('Efficiency') + "|" + _('Radiation') + "|" + _('Performance Ratio') + "|" + _('Lifetime')     
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
    
    
    @area_optimisation_ticks = _('Optimized System') + "|" + _('Efficiency') + "|" + _('Radiation') + "|" + _('Performance Ratio')
    @area_optimisation_values = (100 - @area_projected_improvement).to_s + "|"  + @area_efficiency_improvement.to_s + "|"  + @area_insolation_improvement.to_s + "|"  + @area_performance_improvement.to_s    
    @area_optimisation_series_colors = "3366CC,DC3912,109618,990099"
    @area_optimisation_labels_size = 4

    logger.info '********************'
    logger.info 'area_efficiency_projected --> ' + area_efficiency_projected.to_s
    logger.info 'area_insolation_projected --> ' + area_insolation_projected.to_s
    logger.info 'area_performance_projected --> ' + area_performance_projected.to_s
    logger.info 'area_efficiency_optimization --> ' + area_efficiency_optimization.to_s
    logger.info 'bench_insolation --> ' + @ph_product.ph_specified.bench_insolation
    logger.info 'area_insolation_optimization --> ' + area_insolation_optimization.to_s
    logger.info 'area_performance_optimization --> ' + area_performance_optimization.to_s
    logger.info 'area_efficiency_improvement --> ' + @area_efficiency_improvement.to_s
    logger.info 'area_insolation_improvement --> ' + @area_insolation_improvement.to_s
    logger.info 'area_performance_improvement --> ' + @area_performance_improvement.to_s
    logger.info 'area_projected_improvement --> ' + @area_projected_improvement.to_s
    logger.info '********************'
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
   
    @pc_product = PcProduct.find(params[:pc_result_id])
    @product = @pc_product.product

    @indicators_checked = Array.new 
    @indicators = Indicator.where("sector='printed'")
    Indicator.all.each do |indicator|
        if @product.indicators.include?indicator
          @indicators_checked << indicator
        end
    end    
    
    do_results
    
    save_path = Rails.root.join('pdfs','pc_report_' + @pc_product.id.to_s + '.pdf')    
    if File.exists?(save_path)
       File.delete(save_path)
    end

    pdf_test = false
    if pdf_test
       render :layout => false
    else
       pdf = WickedPdf.new.pdf_from_string(render_to_string(:template => '/pc_results/pdf.html.erb', :layout => false).force_encoding("UTF-8"))
       File.open(save_path, 'wb') do |file|
          file << pdf.force_encoding("UTF-8")
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
    
    # =(Assumptions!$I$11-25)*IF(Assumptions!G19=Menues!A2,Menues!A122,IF(Assumptions!G19=Menues!A3,Menues!B122,IF(Assumptions!G19=Menues!A4,Menues!C122,IF(Assumptions!G19=Menues!A5,Menues!D122,IF(Assumptions!G19=Menues!A6,Menues!E122,0)))))    
    
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
    
    if @ph_product.ph_basic_information.known == 'both' || @ph_product.ph_basic_information.known == 'power_demand'
       #Menues!N56*Assumptions!F39
       @ph_result.lifetime = 0
       n56 = 0
       #=IF($Assumptions.G19=$Menues.A7;0;
        if @ph_product.ph_specified.ph_module_type.name != 'Not specified'
          if @ph_product.ph_specified.power_unit.conversion_factor == -1 
              # Peak Power [kWp]
              conversion_factor = @ph_product.ph_basic_information.radiation * @ph_product.ph_basic_information.performance_ratio
              n56 = @ph_product.ph_specified.power * conversion_factor
          else 
              n56 = @ph_product.ph_specified.power * @ph_product.ph_specified.power_unit.conversion_factor
          end  
              @ph_result.lifetime = n56 * @ph_product.ph_specified.lifetime
            #  @ph_result.lifetime = @ph_product.ph_specified.power * @ph_product.ph_specified.power_unit.conversion_factor
        end
    else 
        #Menues!N49*(Assumptions!F38/100)*Assumptions!I15*Assumptions!I9*Assumptions!F39                       
        @ph_result.lifetime = n49 * (calcul_efficiency  / 100) * @ph_product.ph_basic_information.performance_ratio * @ph_product.ph_basic_information.radiation * @ph_product.ph_specified.lifetime
            
    end
    # New requirement
    if @ph_product.ph_basic_information.working == 'yes' && @ph_product.ph_basic_information.know_power == 'yes' 
      @ph_result.lifetime = @ph_product.ph_basic_information.user_power * @ph_product.ph_specified.lifetime
    end  

        
   #IF($Assumptions.E35=$Menues.G41;$Assumptions.D35*$Menues.E60;IF($Assumptions.E35=$Menues.G42;$Assumptions.D35;IF($Assumptions.E35=G43;$Menues.E59*$Assumptions.D35;IF($Assumptions.E35=$Menues.G44;$Menues.E58*$Assumptions.D35;IF($Assumptions.E35=$Menues.G45;$Menues.E61*$Assumptions.D35;0)))));0))

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
   @ph_result.cabling = temp * @ph_product.ph_intermediate_result.module_area

   # ph_result module
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
   
 # =(IF(Assumptions!$G$19=Menues!$A$5,'Database Materials'!B$2,IF(Assumptions!$G$19=Menues!$A$2,'Database Materials'!B$17,IF(Assumptions!$G$19=Menues!$A$3,'Database Materials'!B$15,IF(Assumptions!$G$19=Menues!$A$4,'Database Materials'!B$8,IF(Assumptions!$G$19=Menues!$A$6,'Database Materials'!B$19,0))))))*Assumptions!$I$68   

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
   if @ph_product.ph_electric_component.ph_battery_type.name == 'Lead Acid'
      pes_1 = get_database_material_result_co2 'Electrics Battery', 'Lead Acid [kg / pc.]', @ph_product
      pes_2 = get_database_material_result_co2 'Electrics Battery', 'Lead Acid [per kg]', @ph_product
   else
      pes_1 = get_database_material_result_co2 'Electrics Battery', 'Lithium Ion [kg / pc.]', @ph_product
      pes_2 = get_database_material_result_co2 'Electrics Battery', 'Lithium Ion [per kg]', @ph_product     
   end  
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
    if @ph_product.ph_electric_component.ph_battery_type.name == 'Lead Acid'
      #B31
      temp = get_database_material_result_co2 'Electrics Battery', 'Lead Acid [kg / pc.]', @ph_product
      #B32    
      temp_2 = get_database_material_result_co2 'Electrics Battery', 'Lead Acid [per kg]', @ph_product
    else
      #B33
      temp = get_database_material_result_co2 'Electrics Battery', 'Lithium Ion [kg / pc.]', @ph_product
      #B34    
      temp_2 = get_database_material_result_co2 'Electrics Battery', 'Lithium Ion [per kg]', @ph_product
    end  
    @ph_maintenance_result.embodied_co2_batteries = @ph_maintenance_result.needed_replacements_batteries * temp * temp_2
    
    @ph_maintenance_result.embodied_pe_batteries = 0  
    if @ph_product.ph_electric_component.ph_battery_type.name == 'Lead Acid'    
      #B31
      temp = get_database_material_result_co2 'Electrics Battery', 'Lead Acid [kg / pc.]', @ph_product
      #C32    
      temp_2 = get_database_material_result_pe 'Electrics Battery', 'Lead Acid [per kg]', @ph_product
    else
      #B31
      temp = get_database_material_result_co2 'Electrics Battery', 'Lithium Ion [kg / pc.]', @ph_product
      #C32    
      temp_2 = get_database_material_result_pe 'Electrics Battery', 'Lithium Ion [per kg]', @ph_product            
    end  
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
    if @ph_product.ph_electric_component.ph_battery_type.name == 'Lead Acid'    
      pes_1 = get_database_material_result_co2 'Electrics Battery', 'Lead Acid [kg / pc.]', @ph_product
      pes_2 = get_database_material_result_pe 'Electrics Battery', 'Lead Acid [per kg]', @ph_product
    else
      pes_1 = get_database_material_result_co2 'Electrics Battery', 'Lithium Ion [kg / pc.]', @ph_product
      pes_2 = get_database_material_result_pe 'Electrics Battery', 'Lithium Ion [per kg]', @ph_product      
    end  
    @ph_embedded_result.pe_batteries = @ph_product.ph_electric_component.separated_battery * pes_1 * pes_2
    
    
    
    @ph_embedded_result.embedded_energy_total = @ph_embedded_result.pe_pv_cabling + @ph_embedded_result.pe_pv_module + @ph_embedded_result.pe_pv_framing + @ph_embedded_result.pe_pv_mounting + @ph_embedded_result.pe_inverter + @ph_embedded_result.pe_batteries + @ph_embedded_result.pe_maintenance 
    
    
    @ph_embedded_result.peak_power = @ph_product.ph_intermediate_result.module_area * calcul_efficiency / 100
    @ph_embedded_result.lifetime_production = @ph_result.lifetime
    
    
    if @ph_product.ph_basic_information.working == 'yes' && @ph_product.ph_basic_information.know_power == 'yes' && @ph_product.ph_basic_information.user_power
      @ph_embedded_result.averaged_power = @ph_product.ph_basic_information.user_power
    else      
      @ph_embedded_result.averaged_power = @ph_embedded_result.lifetime_production / @ph_product.ph_specified.lifetime  
    end
    
    
    
    
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
     respond_to do |format|
        format.html { redirect_to comparison_url(@product)}
     end   
  end      
  
  
  
end
