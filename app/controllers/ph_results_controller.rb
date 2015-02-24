class PhResultsController < ApplicationController
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
    @ph_product = PhProduct.find(params[:id])
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @ph_product.product.name, edit_product_url(@ph_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, ph_production_init_path(@ph_product)
    add_breadcrumb _("Results").html_safe, ph_result_path(@ph_product)
    
    @ph_result = @ph_product.ph_result
    @ph_maintenance_result  = @ph_product.ph_maintenance_result 
    @ph_embedded_result  = @ph_product.ph_embedded_result 
    @product = @ph_product.product
    @ph_database_materials = PhDatabaseMaterial.all
    @ph_database_material_values = PhDatabaseMaterialValue.find(:all, :conditions => ["ph_product_id = ?", @ph_product.id])
    @step = 2
    
    if @ph_product.ph_data_quality
      dqi_country = 0
      dqi_temperature = 0
      dqi_pr = 0
      dqi_production_country = 0
      dqi_module_specifications = 0      

      if @ph_product.ph_data_quality.country_use == 'robust'
          dqi_country = 1
      end
      if @ph_product.ph_data_quality.country_use == 'indicative'
          dqi_country = 2
      end
      if @ph_product.ph_data_quality.country_use == 'illustrative'
          dqi_country = 3
      end
      
      if @ph_product.ph_data_quality.module_temperature == 'robust'
          dqi_temperature = 1
      end
      if @ph_product.ph_data_quality.module_temperature == 'indicative'
          dqi_temperature = 2
      end
      if @ph_product.ph_data_quality.module_temperature == 'illustrative'
          dqi_temperature = 3
      end
      
      if @ph_product.ph_data_quality.performance_ratio == 'robust'
          dqi_pr = 1
      end
      if @ph_product.ph_data_quality.performance_ratio == 'indicative'
          dqi_pr = 2
      end
      if @ph_product.ph_data_quality.performance_ratio == 'illustrative'
          dqi_pr = 3
      end
      
      if @ph_product.ph_data_quality.country_use == 'robust'
          dqi_production_country = 1
      end
      if @ph_product.ph_data_quality.country_use == 'indicative'
          dqi_production_country = 2
      end
      if @ph_product.ph_data_quality.country_use == 'illustrative'
          dqi_production_country = 3
      end     
  
      if @ph_product.ph_data_quality.module_specifications == 'robust'
          dqi_module_specifications = 1
      end
      if @ph_product.ph_data_quality.module_specifications == 'indicative'
          dqi_module_specifications = 2
      end
      if @ph_product.ph_data_quality.module_specifications == 'illustrative'
          dqi_module_specifications = 3
      end          
      total = (((2 * dqi_country) + dqi_temperature + (4 * dqi_pr) + (2 * dqi_production_country) + (3 * dqi_module_specifications)) / 12.to_f).to_f
      @dqi_module = total.ceil
      
    end
    
  end   

  def compare
    @ph_product = PhProduct.find(params[:ph_product_id])
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @ph_product.product.name, edit_product_url(@ph_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, ph_production_init_path(@ph_product)
    add_breadcrumb _("Results").html_safe, ph_comparison_url(@ph_product)

    do_comparison

  end

  def pdf_compare
    @ph_product = PhProduct.find(params[:ph_product_id])

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @ph_product.product.name, edit_product_url(@ph_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, ph_production_init_path(@ph_product)
    add_breadcrumb _("Results").html_safe, ph_comparison_url(@ph_product)

    do_comparison

    save_path = Rails.root.join('pdfs','comparison_' + @ph_product.id.to_s + '.pdf')
    if File.exists?(save_path)
      File.delete(save_path)
    end

    pdf_test = false
    if pdf_test
      render :layout => false
    else
      pdf = WickedPdf.new.pdf_from_string(render_to_string(:template => '/ph_results/pdf_compare.html.erb', :layout => false))
      File.open(save_path, 'wb') do |file|
        file << pdf
      end
      send_file save_path
    end

  end



  def do_comparison
    @products_checked = Array.new
    @compare_products = @ph_product.product.name
    params.each do |key, value|
      if key.match(/^compare_product_/)
        ph_product_id = key[16..key.length]
        ph_product = PhProduct.find(ph_product_id)
        @products_checked << ph_product
        @compare_products += "|" + ph_product.product.name
      end
    end

    @product = @ph_product.product
    @ph_embedded_result  = @ph_product.ph_embedded_result
    @ph_result = @ph_product.ph_result
    @step = 5
    
    @values_co2_to_array = @ph_result.cabling.to_s + "," + @ph_result.module.to_s + "," + @ph_result.framing.to_s + "," + @ph_result.mounting.to_s + "," + @ph_result.inverter.to_s + "," + @ph_result.batteries.to_s + "," + @ph_result.maintenance.to_s
    @products_checked.each do |ph_product|
      if ph_product.ph_result
        @values_co2_to_array += "|" + ph_product.ph_result.cabling.to_s + "," + ph_product.ph_result.module.to_s + "," + ph_product.ph_result.framing.to_s + "," + ph_product.ph_result.mounting.to_s + "," + ph_product.ph_result.inverter.to_s + "," + ph_product.ph_result.batteries.to_s + "," + ph_product.ph_result.maintenance.to_s
      else
        @values_co2_to_array += "|0,0,0,0,0,0,0"
      end
    end


    @values_pe_to_array = (@ph_embedded_result.pe_pv_cabling / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_pv_module  / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_pv_framing  / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_pv_mounting / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_inverter  / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_batteries / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_maintenance / @ph_embedded_result.averaged_consumption).to_s
    @products_checked.each do |ph_product|
       if ph_product.ph_embedded_result
         @values_pe_to_array += "|" + (ph_product.ph_embedded_result.pe_pv_cabling / ph_product.ph_embedded_result.averaged_consumption).to_s + "," + (ph_product.ph_embedded_result.pe_pv_module  / ph_product.ph_embedded_result.averaged_consumption).to_s + "," + (ph_product.ph_embedded_result.pe_pv_framing  / ph_product.ph_embedded_result.averaged_consumption).to_s + "," + (ph_product.ph_embedded_result.pe_pv_mounting / ph_product.ph_embedded_result.averaged_consumption).to_s + "," + (ph_product.ph_embedded_result.pe_inverter  / ph_product.ph_embedded_result.averaged_consumption).to_s + "," + (ph_product.ph_embedded_result.pe_batteries / ph_product.ph_embedded_result.averaged_consumption).to_s + "," + (ph_product.ph_embedded_result.pe_maintenance / ph_product.ph_embedded_result.averaged_consumption).to_s
       else
         @values_pe_to_array += "|0,0,0,0,0,0,0"
       end
    end


    @values_lifetime_to_array = (@ph_result.lifetime).to_s
    @products_checked.each do |ph_product|
      if ph_product.ph_result
         @values_lifetime_to_array += "|" + (ph_product.ph_result.lifetime).to_s
      else
        @values_lifetime_to_array += "|0"
      end
    end
    
    @labels_size = 14
    @ticks_to_array = "|" + _('Maintenance').html_safe + "|" + _('Batteries').html_safe + "|" + _('Inverter').html_safe + "|" + _('Mounting').html_safe + "|" + _('Framing/Panel').html_safe + "|" + _('Module/Laminate').html_safe + "|" + _('Cabling').html_safe
    @ticks_lifetime_to_array = "|" + _('Lifetime electricity production').html_safe
    
    @legend = @compare_products

    colors = ["0033FF","00CCFF","336600","663300","CC6600","FF3300","FFCC00","FFFF00"]
    @seriesColors_to_array = "999999"
    @products_checked.each_with_index do |ph_product, index|
      @seriesColors_to_array += "," + colors[index]
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
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @ph_product.product.name, edit_product_url(@ph_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, ph_production_init_path(@ph_product)
    add_breadcrumb _("Results").html_safe, ph_result_graphic_path(@ph_product)
    
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
    
    
    logger.info '****************'
    logger.info 'area_efficiency_projected -->' + area_efficiency_projected.to_s
    logger.info 'area_insolation_projected -->' + area_insolation_projected.to_s
    logger.info 'area_performance_projected -->' + area_performance_projected.to_s
    logger.info 'area_efficiency_optimization -->' + area_efficiency_optimization.to_s
    logger.info 'bench_insolation -->' + @ph_product.ph_specified.bench_insolation.to_s
    logger.info 'area_insolation_optimization -->' + area_insolation_optimization.to_s
    logger.info 'area_performance_optimization -->' + area_performance_optimization.to_s
    logger.info 'area_efficiency_improvement -->' + @area_efficiency_improvement.to_s
    logger.info 'area_insolation_improvement -->' + @area_insolation_improvement.to_s
    logger.info 'area_performance_improvement -->' + @area_performance_improvement.to_s
    logger.info 'area_projected_improvement -->' + @area_projected_improvement.to_s
    logger.info '****************'
    
    
  end

  def optimisation

    @ph_product = PhProduct.find(params[:ph_result_id])
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @ph_product.product.name, edit_product_url(@ph_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, ph_production_init_path(@ph_product)
    add_breadcrumb _("Results").html_safe, ph_result_optimisation_path(@ph_product)
    
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
   
    @ph_product = PhProduct.find(params[:ph_result_id])
    @ph_result = @ph_product.ph_result
    @ph_maintenance_result  = @ph_product.ph_maintenance_result 
    @ph_embedded_result  = @ph_product.ph_embedded_result 
    @product = @ph_product.product
    @ph_database_materials = PhDatabaseMaterial.all
    @ph_database_material_values = PhDatabaseMaterialValue.find(:all, :conditions => ["ph_product_id = ?", @ph_product.id])
    
    generate_graphic
    generate_optimisation
    
    save_path = Rails.root.join('pdfs','ph_report_' + @ph_product.id.to_s + '.pdf')    
    if File.exists?(save_path)
       File.delete(save_path)
    end

    pdf_test = false
    if pdf_test
      render :layout => false
    else
      pdf = WickedPdf.new.pdf_from_string(render_to_string(:template => '/ph_results/pdf.html.erb', :layout => false))
      File.open(save_path, 'wb') do |file|
        file << pdf
      end
      send_file save_path
    end

  end

  # GET /product_results/1
  # GET /product_results/1.xml
  def summary
   
   @ph_product = PhProduct.find(params[:ph_result_id])
   
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @ph_product.product.name, edit_product_url(@ph_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, ph_production_init_path(@ph_product)
    add_breadcrumb _("Results").html_safe, ph_result_summary_path(@ph_product)
   
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
    # ph_result lifetime
    
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
    if @ph_product.ph_electric_component.include_batteries == 'yes'
       if @ph_product.ph_electric_component.ph_battery_type.name == 'Lead Acid'
          pes_1 = get_database_material_result_co2 'Electrics Battery', 'Lead Acid [kg / pc.]', @ph_product
          pes_2 = get_database_material_result_co2 'Electrics Battery', 'Lead Acid [per kg]', @ph_product
       else
          pes_1 = get_database_material_result_co2 'Electrics Battery', 'Lithium Ion [kg / pc.]', @ph_product
          pes_2 = get_database_material_result_co2 'Electrics Battery', 'Lithium Ion [per kg]', @ph_product
       end
       if @ph_product.ph_electric_component.separated_battery
          @ph_result.batteries = @ph_product.ph_electric_component.separated_battery * pes_1 * pes_2
       end
    end
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
    
    
    if @ph_product.ph_maintenance.distance
       @ph_maintenance_result.driven_maintenance = 2 * @ph_product.ph_maintenance.distance
    else
       @ph_maintenance_result.driven_maintenance = 0
    end

    @ph_maintenance_result.driven_year = 0
    if @ph_product.ph_maintenance.yearly_frequency && @ph_maintenance_result.driven_maintenance
       @ph_maintenance_result.driven_year = @ph_maintenance_result.driven_maintenance * @ph_product.ph_maintenance.yearly_frequency
    end
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

    if @ph_product.ph_maintenance.yearly_frequency && @ph_maintenance_result.years_included
      @ph_maintenance_result.total_embodied_co2_cleaning = @ph_maintenance_result.embodied_co2_cleaning * @ph_maintenance_result.years_included * @ph_product.ph_maintenance.yearly_frequency
      @ph_maintenance_result.total_embodied_pe_cleaning = @ph_maintenance_result.embodied_pe_cleaning * @ph_maintenance_result.years_included * @ph_product.ph_maintenance.yearly_frequency
    end
    @ph_maintenance_result.needed_cycles_batteries = 0
    if @ph_maintenance_result.batteries_replacement == 1
      if @ph_maintenance_result.years_included && @ph_product.ph_electric_component.battery_lifetime
        @ph_maintenance_result.needed_cycles_batteries = (@ph_maintenance_result.years_included / @ph_product.ph_electric_component.battery_lifetime) - 1
       if @ph_maintenance_result.needed_cycles_batteries < 0
         @ph_maintenance_result.needed_cycles_batteries = 0
       else  
         @ph_maintenance_result.needed_cycles_batteries = @ph_maintenance_result.needed_cycles_batteries.ceil
       end
      end
    end


    @ph_maintenance_result.needed_replacements_batteries = 0
    if @ph_product.ph_electric_component.separated_battery
       @ph_maintenance_result.needed_replacements_batteries = @ph_maintenance_result.needed_cycles_batteries * @ph_product.ph_electric_component.separated_battery
    end

    @ph_maintenance_result.embodied_co2_batteries = 0
    if @ph_product.ph_electric_component.include_batteries == 'yes'
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
    end


    @ph_maintenance_result.embodied_pe_batteries = 0
    if @ph_product.ph_electric_component.include_batteries == 'yes'

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
    end


    @ph_maintenance_result.embodied_carbon_dioxide = 0
    @ph_maintenance_result.embodied_primary_energy = 0
    if @ph_product.ph_maintenance.maintenance_needs != 'no'
      begin
        @ph_maintenance_result.embodied_carbon_dioxide = @ph_maintenance_result.embodied_co2_1 + @ph_maintenance_result.embodied_co2_2 + @ph_maintenance_result.embodied_co2_transport + @ph_maintenance_result.total_embodied_co2_cleaning + @ph_maintenance_result.embodied_co2_batteries
        @ph_maintenance_result.embodied_primary_energy = @ph_maintenance_result.embodied_pe_1 + @ph_maintenance_result.embodied_pe_2 + @ph_maintenance_result.embodied_pe_transport + @ph_maintenance_result.total_embodied_pe_cleaning + @ph_maintenance_result.embodied_pe_batteries
      rescue
      end
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
    if @ph_product.ph_electric_component.include_batteries == 'yes'
      if @ph_product.ph_electric_component.ph_battery_type.name == 'Lead Acid'
        pes_1 = get_database_material_result_co2 'Electrics Battery', 'Lead Acid [kg / pc.]', @ph_product
        pes_2 = get_database_material_result_pe 'Electrics Battery', 'Lead Acid [per kg]', @ph_product
      else
        pes_1 = get_database_material_result_co2 'Electrics Battery', 'Lithium Ion [kg / pc.]', @ph_product
        pes_2 = get_database_material_result_pe 'Electrics Battery', 'Lithium Ion [per kg]', @ph_product
      end
      if @ph_product.ph_electric_component.separated_battery
         @ph_embedded_result.pe_batteries = @ph_product.ph_electric_component.separated_battery * pes_1 * pes_2
      end
    end
    
    
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
      if ph_product.ph_electric_component.include_batteries == 'no'
        value = 0
      else
        value = assumptions_i93 * (0.1294 * (assumptions_i93 ** -0.081))
      end
    end

      
    if ph_database_material.module == 'Electrics Battery' && ph_database_material.target == 'Lithium Ion [kg / pc.]'
      if ph_product.ph_electric_component.include_batteries == 'no'
        value = 0
      else
        value = (0.009 * assumptions_i93) +   0.1113
      end
    end
      
      
    if ph_database_material.module == 'Electrics Battery' && ph_database_material.target == 'Lead Acid [per kg]'
      if ph_product.ph_electric_component.include_batteries == 'no'
        value = 0
      else     
        value = 0.99 + 0.6 * assumptions_i22 / 1000
      end  
        # =0,99+0,6*$Assumptions.I22/1000
    end     
    
    if ph_database_material.module == 'Electrics Battery' && ph_database_material.target == 'Lithium Ion [per kg]'
      if ph_product.ph_electric_component.include_batteries == 'no'
        value = 0
      else     
        value = 10.02 + 9.37 * assumptions_i22 / 1000
      end  
        # =10.02+9.37*Assumptions!I22/1000
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
        #  value = assumptions_f85 * (1.1107 * Math.exp(-0.002 * (assumptions_f85) / 1000))
          value = assumptions_f85 * (-0.119 * Math.log10((assumptions_f85 / 1000)) + 1.1337)
       end  
       #=($Assumptions.F85)*(1,1107*EXP(-0,002*($Assumptions.F85)/1000))))
    end     
    if ph_database_material.module == 'Electrics' && ph_database_material.target == '1x Inverter Type 2'
       if ((assumptions_i85 != 0) && (assumptions_i87 != 0))
      #    value = assumptions_i85 * (1.1107 * Math.exp(-0.002 * (assumptions_i85) / 1000))
      
      
           value = assumptions_i85 * (-0.119 * Math.log10((assumptions_i85 / 1000)) + 1.1337)
           
           
       end  
    end        
    if ph_database_material.module == 'Electrics Battery' && ph_database_material.target == 'Lead Acid [per kg]'
        value = 25 + (0.6*3.6) / assumptions_i24
        # ==25+0,6/$Assumptions.I24
    end    

    if ph_database_material.module == 'Electrics Battery' && ph_database_material.target == 'Lithium Ion [per kg]'
        value = 179+(9.37*3.6) / assumptions_i24
        # =179+(9.37*3.6)/Assumptions!I26
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

     respond_to do |format|
        format.html { redirect_to comparison_url(@product)}
     end   
  end      

end
