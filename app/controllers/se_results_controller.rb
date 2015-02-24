# encoding: UTF-8
class SeResultsController < ApplicationController
  require 'csv'
  before_filter :load_indicators_and_excel_values, :only => :show
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
    @se_product = SeProduct.find(params[:id])
    if !@se_product.se_result
        se_result = SeResult.new 
        se_result.se_product_id = @se_product.id
        se_result.save
        @se_product.se_result = se_result
    end
    @se_result = @se_product.se_result
    @product = @se_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @se_product.product.name, edit_product_url(@se_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, se_manufacturing_path(@se_product)
    add_breadcrumb _("Results").html_safe, se_result_path(@se_product)


    ################
    #Table 1       #
    #kg CO2-eq/year#
    ################

    #sensor_kg_year
    @se_result.sensor_kg_year_with = sensor_kg_year(@se_product,'with')
    @se_result.sensor_kg_year_without = 0
    @sensor_kg_year_increment_impact = @se_result.sensor_kg_year_with - @se_result.sensor_kg_year_without

    #energy_kg_year
    @se_result.energy_kg_year_with = energy_kg_year(@se_product,'with')
    @se_result.energy_kg_year_without = energy_kg_year(@se_product,'without')
    @energy_kg_year_increment_impact = @se_result.energy_kg_year_with - @se_result.energy_kg_year_without

    #consumables_kg_year
    @se_result.consumables_kg_year_with = consumables_kg_year(@se_product,'with')
    @se_result.consumables_kg_year_without = consumables_kg_year(@se_product,'without')
    @consumables_kg_year_increment_impact = @se_result.consumables_kg_year_with - @se_result.consumables_kg_year_without

    #utilities_kg_year
    @se_result.utilities_kg_year_with = utilities_kg_year(@se_product,'with')
    @se_result.utilities_kg_year_without = utilities_kg_year(@se_product,'without')
    @utilities_kg_year_increment_impact = @se_result.utilities_kg_year_with - @se_result.utilities_kg_year_without

    #yield_kg_year
    @se_result.yield_kg_year_with = yield_kg_year(@se_product,'with')
    @se_result.yield_kg_year_without = yield_kg_year(@se_product,'without')
    @yeld_kg_year_increment_impact =  @se_result.yield_kg_year_with - @se_result.yield_kg_year_without

    #kg_year_sum_with
    @kg_year_sum_with = @se_result.sensor_kg_year_with + @se_result.energy_kg_year_with +  @se_result.consumables_kg_year_with + @se_result.utilities_kg_year_with + @se_result.yield_kg_year_with

    #kg_year_sum_without
    @kg_year_sum_without = @se_result.sensor_kg_year_without + @se_result.energy_kg_year_without +  @se_result.consumables_kg_year_without + @se_result.utilities_kg_year_without + @se_result.yield_kg_year_without

    #kg_year_sum_increment_impact
    @kg_year_sum_increment_impact = @sensor_kg_year_increment_impact + @energy_kg_year_increment_impact + @consumables_kg_year_increment_impact + @utilities_kg_year_increment_impact + @yeld_kg_year_increment_impact


    ######################
    #Table 2             #
    #kg CO2-eq/kg product#
    ######################
    
    #sensor_kg_product
    @se_result.sensor_kg_product_with = @se_result.sensor_kg_year_with / (@se_product.se_use_product.output_with * @se_product.se_use_production.productive_time("with"))
    @se_result.sensor_kg_product_without = 0
    @sensor_kg_product_increment_impact = @se_result.sensor_kg_product_with - @se_result.sensor_kg_product_without

    #energy_kg_product
    @se_result.energy_kg_product_with = @se_result.energy_kg_year_with / (@se_product.se_use_product.output_with * @se_product.se_use_production.productive_time("with"))
    @se_result.energy_kg_product_without = @se_result.energy_kg_year_without / (@se_product.se_use_product.output_without * @se_product.se_use_production.productive_time("without"))
    @energy_kg_product_increment_impact =  @se_result.energy_kg_product_with - @se_result.energy_kg_product_without

    #consumable_kg_product
    @se_result.consumables_kg_product_with = @se_result.consumables_kg_year_with / (@se_product.se_use_product.output_with * @se_product.se_use_production.productive_time("with"))
    @se_result.consumables_kg_product_without = @se_result.consumables_kg_year_without /  (@se_product.se_use_product.output_without * @se_product.se_use_production.productive_time("without"))
    @consumable_kg_product_increment_impact =  @se_result.consumables_kg_product_with - @se_result.consumables_kg_product_without

    #utilities_kg_product
    @se_result.utilities_kg_product_with =  @se_result.utilities_kg_year_with / (@se_product.se_use_product.output_with * @se_product.se_use_production.productive_time("with"))
    @se_result.utilities_kg_product_without =  @se_result.utilities_kg_year_without / (@se_product.se_use_product.output_without * @se_product.se_use_production.productive_time("without"))
    @utilities_kg_product_increment_impact =  @se_result.utilities_kg_product_with - @se_result.utilities_kg_product_without

    @se_result.yield_kg_product_with = @se_result.yield_kg_year_with / (@se_product.se_use_product.output_with * @se_product.se_use_production.productive_time("with"))
    @se_result.yield_kg_product_without = @se_result.yield_kg_year_without / (@se_product.se_use_product.output_without * @se_product.se_use_production.productive_time("without"))

    @yield_loss_kg_product_increment_impact = @se_result.yield_kg_product_with - @se_result.yield_kg_product_without

    #kg_product_sum_with
    @kg_product_sum_with = @se_result.sensor_kg_product_with + @se_result.energy_kg_product_with + @se_result.consumables_kg_product_with + @se_result.utilities_kg_product_with + @se_result.yield_kg_product_with

    #kg_product_sum_without
    @kg_product_sum_without = @se_result.sensor_kg_product_without + @se_result.energy_kg_product_without + @se_result.consumables_kg_product_without + @se_result.utilities_kg_product_without + @se_result.yield_kg_product_without

    #kg_product_sum_increment_impact
    @kg_product_sum_increment_impact =  @sensor_kg_product_increment_impact +  @energy_kg_product_increment_impact +  @consumable_kg_product_increment_impact + @utilities_kg_product_increment_impact + @yield_loss_kg_product_increment_impact


    ######################
    #Table 3             #
    #euro/year           #
    ######################

    if !@se_product.se_use_consumption.sensor_system_with.nil?
      @se_result.sensor_euro_year_with  = @se_product.se_manufacturing.purchase / @se_product.se_manufacturing.sensor_lifetime + @se_product.se_manufacturing.installation / @se_product.se_manufacturing.sensor_lifetime + @se_product.se_manufacturing.maintenance + @se_product.se_use_consumption.sensor_system_with * @se_product.se_use_production.maximum_production * @se_product.se_use_cost.electricity
    else
      @se_result.sensor_euro_year_with = 0
    end
    @se_result.sensor_euro_year_without = 0
    @sensor_euro_year_increment_impact = @se_result.sensor_euro_year_with - @se_result.sensor_euro_year_without

    #production_euro_year
    @se_result.production_euro_year_with = production_euro_year(@se_product,"with")
    @se_result.production_euro_year_without = production_euro_year(@se_product,"without")
    @production_euro_year_increment_impact = @se_result.production_euro_year_with - @se_result.production_euro_year_without

    #yield_loss_euro_year
    @se_result.yield_euro_year_with =  yield_loss_euro_year(@se_product,"with")
    @se_result.yield_euro_year_without =  yield_loss_euro_year(@se_product,"without")
    @yield_euro_year_increment_impact = @se_result.yield_euro_year_with - @se_result.yield_euro_year_without

    #value_euro_year
    @se_result.value_euro_year_with = value_euro_year(@se_product,"with")
    @se_result.value_euro_year_without = value_euro_year(@se_product,"without")
    @value_euro_year_increment_impact = @se_result.value_euro_year_with - @se_result.value_euro_year_without

    #euro_year_sum_with
    @euro_year_sum_with =  @se_result.sensor_euro_year_with + @se_result.production_euro_year_with +  @se_result.yield_euro_year_with + @se_result.value_euro_year_with
    #euro_year_sum_without
    @euro_year_sum_without = @se_result.sensor_euro_year_without + @se_result.production_euro_year_without +  @se_result.yield_euro_year_without + @se_result.value_euro_year_without
    @euro_year_sum_increment_impact =  @sensor_euro_year_increment_impact + @production_euro_year_increment_impact +  @yield_euro_year_increment_impact +  @value_euro_year_increment_impact

    ######################
    #Table 4             #
    #euro/kg             #
    ######################
    total_anual_output_with = @se_product.se_use_product.total_anual_output("with")
    total_anual_output_without = @se_product.se_use_product.total_anual_output("without")

    #sensors_euro_kg
    @se_result.sensor_euro_product_with =  @se_result.sensor_euro_year_with / total_anual_output_with
    @se_result.sensor_euro_product_without = @se_result.sensor_euro_year_without / total_anual_output_without
    @sensors_euro_kg_increment_impact = @se_result.sensor_euro_product_with - @se_result.sensor_euro_product_without

    #production_euro_kg
    @se_result.production_euro_product_with = @se_result.production_euro_year_with / total_anual_output_with
    @se_result.production_euro_product_without = @se_result.production_euro_year_without / total_anual_output_without
    @production_euro_kg_increment_impact = @se_result.production_euro_product_with - @se_result.production_euro_product_without

    #yield_euro_kg
    @se_result.yield_euro_product_with = @se_result.yield_euro_year_with / total_anual_output_with
    @se_result.yield_euro_product_without = @se_result.yield_euro_year_without / total_anual_output_without
    @yield_euro_kg_increment_impact = @se_result.yield_euro_product_with - @se_result.yield_euro_product_without

    #value_euro_kg
    @se_result.value_euro_product_with =   @se_result.value_euro_year_with / total_anual_output_with
    @se_result.value_euro_product_without =  @se_result.value_euro_year_without / total_anual_output_without
    @value_euro_kg_increment_impact = @se_result.value_euro_product_with - @se_result.value_euro_product_without

    #euro_kg_sum_with
    @euro_kg_sum_with = @se_result.sensor_euro_product_with + @se_result.production_euro_product_with + @se_result.yield_euro_product_with + @se_result.value_euro_product_with
    #euro_kg_sum_without
    @euro_kg_sum_without = @se_result.sensor_euro_product_without + @se_result.production_euro_product_without + @se_result.yield_euro_product_without + @se_result.value_euro_product_without
    #euro_kg_sum_increment_impact
    @euro_kg_sum_increment_impact = @sensors_euro_kg_increment_impact + @production_euro_kg_increment_impact + @yield_euro_kg_increment_impact + @value_euro_kg_increment_impact


    @se_result.save
    @step = 1
    
  end   

  def sensor_kg_year(se_product, type)
    result = 0

    f10_sum = 0
    g10_sum = 0
    h10_sum = 0
    j10_sum = 0
    i10_sum = 0

    battery_lifetime = se_product.se_manufacturing.battery_lifetime
    sensor_lifetime = se_product.se_manufacturing.sensor_lifetime
    cables = se_product.se_manufacturing.cables
    cable_lifetime = se_product.se_manufacturing.cable_lifetime
    maximum_production = se_product.se_use_production.maximum_production

    sensor_system = 0

    if type == 'with'
        sensor_system = se_product.se_use_consumption.sensor_system_with if !se_product.se_use_consumption.sensor_system_with.nil?
    elsif type == 'without'
        sensor_system = se_product.se_use_consumption.sensor_system_without if !se_product.se_use_consumption.sensor_system_without.nil?
    end             

    se_product.se_manufacturing_datas.each do |se_manufacturing_data|
        if se_manufacturing_data.se_component.name_en == 'Microcontroller ICs'
            f10_sum +=  (se_manufacturing_data.number * se_manufacturing_data.quantity)
            mylog << "Microcontroller ICs: #{f10_sum} --> #{se_manufacturing_data.number} * #{se_manufacturing_data.quantity} \n"
        elsif se_manufacturing_data.se_component.name_en == 'Memory'
            g10_sum +=  (se_manufacturing_data.number * se_manufacturing_data.quantity)
            mylog << "Memory: #{g10_sum} --> #{se_manufacturing_data.number} * #{se_manufacturing_data.quantity} \n"
        elsif se_manufacturing_data.se_component.name_en == 'Printed Circuit Board'
            h10_sum +=  (se_manufacturing_data.number * se_manufacturing_data.quantity)
            mylog << "Printed Circuit Board: #{h10_sum} --> #{se_manufacturing_data.number} * #{se_manufacturing_data.quantity} \n"
        elsif se_manufacturing_data.se_component.name_en == 'Battery (Li-ion)'
            i10_sum +=  (se_manufacturing_data.number * se_manufacturing_data.quantity)
            mylog << "Battery (Li-ion): #{i10_sum} --> #{se_manufacturing_data.number} * #{se_manufacturing_data.quantity} \n"
        elsif se_manufacturing_data.se_component.name_en == 'Housing, steel'            
            j10_sum +=  (se_manufacturing_data.number * se_manufacturing_data.quantity)
            mylog << "Housing, steel: #{j10_sum} --> #{se_manufacturing_data.number} * #{se_manufacturing_data.quantity} \n"
        end            
    end

    result = (f10_sum * @excel_value_f10)
    mylog << "partial result: #{result} --> #{f10_sum} * #{@excel_value_f10} \n"
    result += (g10_sum * @excel_value_g10)
    mylog << "partial result: #{result} --> #{g10_sum} * #{@excel_value_g10} \n"
    result += (h10_sum * @excel_value_h10)
    mylog << "partial result: #{result} --> #{h10_sum} * #{@excel_value_h10} \n"
    result += (j10_sum * @excel_value_j10)
    mylog << "partial result: #{result} --> #{j10_sum} * #{@excel_value_j10} \n"
    t= result
    if sensor_lifetime != 0
      result = result / sensor_lifetime
      mylog << "partial result: #{result} --> #{t} / #{sensor_lifetime} \n"
    end  
    if battery_lifetime != 0    
      result += ((i10_sum * @excel_value_i10) / battery_lifetime)
      mylog << "partial result: #{result} --> ((#{i10_sum} * #{@excel_value_i10}) / #{battery_lifetime}) \n"
    end  
    if cable_lifetime != 0    
      result += (cables * @excel_value_k10) / cable_lifetime
      mylog << "partial result: #{result} --> (#{cables} * #{@excel_value_k10}) / #{cable_lifetime} \n"
    end  
    # country
    result += (sensor_system * maximum_production) * @excel_value_l10
    mylog << "partial result: #{result} --> (#{sensor_system} * #{maximum_production}) * #{@excel_value_l10}\n"

    mylog << "------------------------End - sensor_kg_year - #{type} ----------------\n"
    logger.debug mylog

    result
  end 

  def energy_kg_year(se_product,type)
    mylog = "------------------------Start - energy_kg_year - #{type} ----------------\n"

    result = 0
    use_d10 = se_product.se_use_production.operation_time #equival facility operation time
    use_h20 = se_product.se_use_production.productive_time(type) #equival productive time
    
    use_d35_electricity_operational = 0
    use_d36_electricity_downtimes = 0
    use_d37_electricity_overhead = 0

    use_d38_heat_operational = 0
    use_d39_heat_downtimes = 0
    use_d40_heat_overhead = 0

    use_d41_gas_operational = 0
    use_d42_gas_downtimes = 0
    use_d43_gas_overhead = 0

    use_d44_other_fuel_operational = 0
    use_d45_other_fuel_downtimes = 0
    use_d46_other_fuel_overhead = 0
    
    se_product.se_use_consumption_datas.each do |consumption_data|
      sensor_val = 0
      if type == "with"
        sensor_val = consumption_data.with_sensor if !consumption_data.with_sensor.nil?
      elsif type == "without"
        sensor_val = consumption_data.without_sensor if !consumption_data.without_sensor.nil?
      end

        if consumption_data.se_energy_type.name_en == "Electricity" && consumption_data.se_energy_use.name_en == "Machine, operational times"
          use_d35_electricity_operational += sensor_val
          mylog << "Electricity Machine, operational times: #{use_d35_electricity_operational} \n"
        elsif consumption_data.se_energy_type.name_en ==  "Electricity" && consumption_data.se_energy_use.name_en ==  "Machine, downtimes"
          use_d36_electricity_downtimes += sensor_val
          mylog << "Electricity Machine, downtimes: #{use_d36_electricity_downtimes} \n"
        elsif consumption_data.se_energy_type.name_en ==  "Electricity" && consumption_data.se_energy_use.name_en ==  "Overhead, infrastructure, at all times"
          use_d37_electricity_overhead += sensor_val
          mylog << "Electricity Overhead, infrastructure, at all times: #{use_d37_electricity_overhead} \n"
        end

        if consumption_data.se_energy_type.name_en ==  "Heat" && consumption_data.se_energy_use.name_en ==  "Machine, operational times"
          use_d38_heat_operational += sensor_val
          mylog << "Heat Machine, operational times: #{use_d38_heat_operational} \n"
        elsif consumption_data.se_energy_type.name_en == "Heat" && consumption_data.se_energy_use.name_en == "Machine, downtimes"
          use_d39_heat_downtimes += sensor_val
          mylog << "Heat Machine, downtimes: #{use_d39_heat_downtimes} \n"
        elsif consumption_data.se_energy_type.name_en == "Heat" && consumption_data.se_energy_use.name_en == "Overhead, infrastructure, at all times"
          use_d40_heat_overhead += sensor_val
          mylog << "Heat Overhead, infrastructure, at all times: #{use_d40_heat_overhead} \n"
        end

        if consumption_data.se_energy_type.name_en ==  "Natural Gas" && consumption_data.se_energy_use.name_en ==  "Machine, operational times"
          use_d41_gas_operational += sensor_val
          mylog << "Heat Machine, operational times: #{use_d41_gas_operational} \n"
        elsif consumption_data.se_energy_type.name_en ==  "Natural Gas" && consumption_data.se_energy_use.name_en ==  "Machine, downtimes"
          use_d42_gas_downtimes += sensor_val
          mylog << "Heat Machine, downtimes: #{use_d42_gas_downtimes} \n"
        elsif consumption_data.se_energy_type.name_en ==  "Natural Gas" && consumption_data.se_energy_use.name_en == "Overhead, infrastructure, at all times"
          use_d43_gas_overhead += sensor_val
          mylog << "Heat Overhead, infrastructure, at all times: #{use_d43_gas_overhead} \n"
        end

        if consumption_data.se_energy_type.name_en ==  "Other fuels" && consumption_data.se_energy_use.name_en ==  "Machine, operational times"
          use_d44_other_fuel_operational += sensor_val
          mylog << "Other fuels Machine, operational times: #{use_d44_other_fuel_operational} \n"
        elsif consumption_data.se_energy_type.name_en ==  "Other fuels" && consumption_data.se_energy_use.name_en ==  "Machine, downtimes"
          use_d45_other_fuel_downtimes += sensor_val
          mylog << "Other fuels Machine, downtimes: #{use_d45_other_fuel_downtimes} \n"
        elsif consumption_data.se_energy_type.name_en ==  "Other fuels" && consumption_data.se_energy_use.name_en == "Overhead, infrastructure, at all times"
          use_d46_other_fuel_overhead += sensor_val
          mylog << "Other fuels Overhead, infrastructure, at all times: #{use_d46_other_fuel_overhead} \n"
        end
    end

    result = use_h20 * use_d35_electricity_operational + (use_d10 - use_h20) * use_d36_electricity_downtimes + use_d10 * use_d37_electricity_overhead
    mylog << "partial result: #{result} --> #{use_h20} * #{use_d35_electricity_operational} + #{use_d10} - #{use_h20} * #{use_d36_electricity_downtimes} + #{use_d10} * #{use_d37_electricity_overhead} \n"
    # country
    result = result * @excel_value_l10
    mylog << "partial result: #{result} --> #{result} * #{@excel_value_l10} \n"
    result += (use_h20 * use_d38_heat_operational + (use_d10 - use_h20) * use_d39_heat_downtimes + use_d10 * use_d40_heat_overhead) * @excel_value_l10
    mylog << "partial result: #{result} --> ( #{use_h20} * #{use_d38_heat_operational} + (#{use_d10} - #{use_h20}) * #{use_d39_heat_downtimes} + #{use_d10} * #{use_d40_heat_overhead}) * #{@excel_value_l10} \n"
    result += (use_h20 * use_d41_gas_operational + (use_d10 - use_h20) * use_d42_gas_downtimes  + use_d10 * use_d43_gas_overhead) * @excel_value_m10
    mylog << "partial result: #{result} --> (#{use_h20} * #{use_d41_gas_operational} + (#{use_d10} - #{use_h20}) * #{use_d42_gas_downtimes}  + #{use_d10} * #{use_d43_gas_overhead}) * #{@excel_value_m10} \n"
    result += (use_h20 * use_d44_other_fuel_operational + (use_d10 - use_h20) * use_d45_other_fuel_downtimes + use_d10 * use_d46_other_fuel_overhead) * @excel_value_n10
    mylog << "Result: #{result} --> (#{use_h20} * #{use_d44_other_fuel_operational} + (#{use_d10} - #{use_h20}) * #{use_d45_other_fuel_downtimes} + #{use_d10} * #{use_d46_other_fuel_overhead}) * #{@excel_value_n10} \n"

    mylog << "------------------------End - energy_kg_year - #{type} ----------------\n"
    logger.debug mylog

    result
  end

    

  def consumables_kg_year(se_product,type)
    mylog = "------------------------Start - consumables_kg_year - #{type} ----------------\n"

    result = 0
    use_d10 = se_product.se_use_production.operation_time #equival facility operation time

    se_product.se_use_consumption_consumable_datas.each do |consumable_data|
      sensor_val = 0
      tmp_result = 0

      if type == "with"
        sensor_val = consumable_data.with_sensor if !consumable_data.with_sensor.nil?
      elsif type == "without"
        sensor_val = consumable_data.without_sensor if !consumable_data.without_sensor.nil?
      end

      if consumable_data.se_consumable.name_en == "Other"
        tmp_result = sensor_val * use_d10 * consumable_data.global_warming_potential
        mylog << "Other: #{tmp_result} --> #{sensor_val} * #{use_d10} * #{consumable_data.global_warming_potential}\n"
      else
         @excel_value_o10.each do |o10|
            if o10.name == consumable_data.se_consumable.name_en
              tmp_result = sensor_val * use_d10 * o10.value
              mylog << "Tots: #{tmp_result} --> #{sensor_val} * #{use_d10} * #{o10.value} \n"
            end
         end
      end

      result += tmp_result
    end

    mylog << "Result: #{result}\n"
    mylog << "------------------------End - consumables_kg_year - #{type} ----------------\n"
    logger.debug mylog

    result
   end

   def utilities_kg_year(se_product,type)
    mylog = "------------------------Start - utilities_kg_year - #{type} ----------------\n"
    result = 0
    use_d10 = se_product.se_use_production.operation_time #equival facility operation time
    use_f64_electricity_consum = 0

    if type == "with"
      use_f64_electricity_consum = se_product.se_use_consumption.sensor_system_with if !se_product.se_use_consumption.sensor_system_with.nil?
    elsif type == "without"
      use_f64_electricity_consum = se_product.se_use_consumption.sensor_system_without if !se_product.se_use_consumption.sensor_system_without.nil?
    end


    se_product.se_use_consumption_utility_datas.each do |utility_data|
      tmp_result = 0
      sensor_val = 0
      if type == "with"
        sensor_val = utility_data.with_sensor if !utility_data.with_sensor.nil?
      elsif type == "without"
        sensor_val = utility_data.without_sensor if !utility_data.without_sensor.nil?
      end

      if utility_data.se_utility.name_en == "Exhaust"
        tmp_result = sensor_val * @excel_value_x11
        mylog << "Exhaust: #{tmp_result} --> #{sensor_val} * #{@excel_value_x11}\n"
      elsif utility_data.se_utility.name_en == "Vacuum"
        tmp_result = sensor_val * @excel_value_y11
        mylog << "Vacuum: #{tmp_result} --> #{sensor_val} * #{@excel_value_y11}\n"
      elsif utility_data.se_utility.name_en == "Clean Dry Air"
        tmp_result = sensor_val * @excel_value_z11
        mylog << "Clean Dry Air: #{tmp_result} --> #{sensor_val} * #{@excel_value_z11}\n"
      elsif utility_data.se_utility.name_en == "High Pressure Clean Dry Air"
        tmp_result = sensor_val * @excel_value_aa11
        mylog << "High Pressure Clean Dry Air: #{tmp_result} --> #{sensor_val} * #{@excel_value_aa11}\n"
    elsif utility_data.se_utility.name_en == "Compressed Air"
      logger.info "sensor_val --> " + sensor_val.to_s
      logger.info " se_product.se_use_production.operation_time --> " +  se_product.se_use_production.operation_time.to_s
      logger.info "utility_data.electricity_consumption --> " + utility_data.electricity_consumption.to_s
      logger.info "@excel_value_l10 --> " + @excel_value_l10.to_s
      tmp_result += sensor_val * utility_data.electricity_consumption
      elsif utility_data.se_utility.name_en == "Water Cooled (by Refrigeration)"
        excel_value_ac11 = 0
        excel_value_ac11 = 0.258 * utility_data.temperature_difference + 0.273 if !utility_data.temperature_difference.nil?
        tmp_result = sensor_val * excel_value_ac11
        mylog << "Water Cooled (by Refrigeration): #{tmp_result} --> #{sensor_val} * #{excel_value_ac11}\n"
      elsif utility_data.se_utility.name_en == "Ultrapure Water Deionized"
        tmp_result = sensor_val * @excel_value_ad11
        mylog << "Ultrapure Water Deionized: #{tmp_result} --> #{sensor_val} * #{@excel_value_ad11}\n"
      elsif utility_data.se_utility.name_en == "Hot Ultrapure Water / Deionized Water, pressurized, Temp > 85&deg;"
        tmp_result = sensor_val * @excel_value_ae11
        mylog << "Hot Ultrapure Water / Deionized Water, pressurized, Temp > 85&deg;: #{tmp_result} --> #{sensor_val} * #{@excel_value_ae11}\n"
      elsif utility_data.se_utility.name_en == "Nitrogen"
        tmp_result = sensor_val * @excel_value_af11
        mylog << "Nitrogen: #{tmp_result} --> #{sensor_val} * #{@excel_value_af11}\n"
      end

      result += tmp_result
      mylog << "partial result: #{result}\n"
    end

    t = result
    result += (use_d10 * result) * @excel_value_l10
    mylog << "partial result: #{result} --> (#{use_d10} * #{t}) * #{@excel_value_l10} \n"

    mylog << "Result: #{result}\n"
    mylog << "------------------------End - utilities_kg_year - #{type} ----------------\n"
    logger.debug mylog

    result
   end

  def yield_kg_year(se_product,type)
    result = 0
    total_anual_output = se_product.se_use_product.total_anual_output(type)

    mylog = "------------------------Start - yield_kg_year - #{type} ----------------\n"

    se_product.se_recycling_datas.each do |recycling_data|
      tmp_result = 0
      sensor_val = 0
      if type == "with"
        sensor_val = recycling_data.with_sensor if !recycling_data.with_sensor.nil?
      elsif type == "without"
        sensor_val = recycling_data.without_sensor if !recycling_data.without_sensor.nil?
      end

      if recycling_data.se_production_yield_loss_material.name_en == "Aluminium strip / sheet / foil"
        tmp_result = (sensor_val/100 * total_anual_output) * @excel_value_ag
        mylog << "Aluminium strip / sheet / foil: \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{@excel_value_ag} = #{tmp_result} \n"

      elsif recycling_data.se_production_yield_loss_material.name_en == "Aluminium sheet parts (d=0.2 ... 2 mm)"
        tmp_result = (sensor_val/100 * total_anual_output) * @excel_value_ah
        mylog << "Aluminium sheet parts (d=0.2 … 2 mm): \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{@excel_value_ah} = #{tmp_result} \n"

      elsif recycling_data.se_production_yield_loss_material.name_en == "Aluminium foil (processed, d=0.005 ... 0.2)"
        tmp_result = (sensor_val/100 * total_anual_output) * @excel_value_ai
        mylog << "Aluminium foil (processed, d=0.005 … 0.2): \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{@excel_value_ai} = #{tmp_result} \n"

      elsif recycling_data.se_production_yield_loss_material.name_en == "Aluminium profile (processed)"
        tmp_result = (sensor_val/100 * total_anual_output) * @excel_value_aj
        mylog << "Aluminium profile (processed): \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{@excel_value_aj} = #{tmp_result} \n"

      elsif recycling_data.se_production_yield_loss_material.name_en == "Copper strip / sheet / foil"
        tmp_result = (sensor_val/100 * total_anual_output) * @excel_value_ak
        mylog << "Copper strip / sheet / foil: \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{@excel_value_ak} = #{tmp_result} \n"

      elsif recycling_data.se_production_yield_loss_material.name_en == "Steel, hot rolled"
        tmp_result = (sensor_val/100 * total_anual_output) * @excel_value_al
        mylog << "Steel, hot rolled: \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{@excel_value_al} = #{tmp_result} \n"

      elsif recycling_data.se_production_yield_loss_material.name_en == "Stainless steel, hot rolled"
        tmp_result = (sensor_val/100 * total_anual_output) * @excel_value_am
        mylog << "Stainless steel, hot rolled: \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{@excel_value_am} = #{tmp_result} \n"

      elsif recycling_data.se_production_yield_loss_material.name_en == "Steel, cold rolled / plates"
        tmp_result = (sensor_val/100 * total_anual_output) * @excel_value_an
        mylog << "Steel, cold rolled / plates: \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{@excel_value_an} = #{tmp_result} \n"

      elsif recycling_data.se_production_yield_loss_material.name_en == "Steel parts (processed coil, stamped or bended or otherwise processed plates)"
        tmp_result = (sensor_val/100 * total_anual_output) * @excel_value_ao
        mylog << "Steel parts (processed coil, stamped or bended or otherwise processed plates): \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{@excel_value_ao} = #{tmp_result} \n"

      elsif recycling_data.se_production_yield_loss_material.name_en == "Stainless steel, processed coil"
        tmp_result = (sensor_val/100 * total_anual_output) * @excel_value_ap
        mylog << "Stainless steel, processed coil: \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{@excel_value_ap} = #{tmp_result} \n"

      elsif recycling_data.se_production_yield_loss_material.name_en == "Stainless steel parts (stamped or bended or otherwise processed plates)"
        tmp_result = (sensor_val/100 * total_anual_output) * @excel_value_aq
        mylog << "Stainless steel parts (stamped or bended or otherwise processed plates): \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{@excel_value_aq} = #{tmp_result} \n"

      elsif recycling_data.se_production_yield_loss_material.name_en == "Zinc sheet parts (d=0.7mm)"
        tmp_result = (sensor_val/100 * total_anual_output) * @excel_value_ar
        mylog << "Zinc sheet parts (d=0.7mm): \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{@excel_value_ar} = #{tmp_result} \n"

      elsif recycling_data.se_production_yield_loss_material.name_en == "Glass, flat, annealed"
        tmp_result = (sensor_val/100 * total_anual_output) * @excel_value_as
        mylog << "Glass, flat, annealed: \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{@excel_value_as} = #{tmp_result} \n"

      elsif recycling_data.se_production_yield_loss_material.name_en == "Glass, flat, processed"
        tmp_result = (sensor_val/100 * total_anual_output) * @excel_value_at
        mylog << "Glass, flat, processed: \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{@excel_value_at} = #{tmp_result} \n"

      elsif recycling_data.se_production_yield_loss_material.name_en == "Paper (calendered)"
        tmp_result = (sensor_val/100 * total_anual_output) * @excel_value_au
        mylog << "Paper (calendered): \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{@excel_value_au} = #{tmp_result} \n"

      elsif recycling_data.se_production_yield_loss_material.name_en == "Paper, cardboard (printed)"
        tmp_result = (sensor_val/100 * total_anual_output) *  @excel_value_av
        mylog << "Paper, cardboard (printed): \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{@excel_value_av} = #{tmp_result} \n"

      elsif recycling_data.se_production_yield_loss_material.name_en == "Newspaper (printed)"
        tmp_result = (sensor_val/100 * total_anual_output) * @excel_value_aw
        mylog << "Newspaper (printed): \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{@excel_value_aw} = #{tmp_result} \n"

      elsif recycling_data.se_production_yield_loss_material.name_en == "Other"
        user_kepi = 0
        user_kepi = recycling_data.global_warming_potential if !recycling_data.global_warming_potential.nil?
        tmp_result = (sensor_val/100 * total_anual_output) *  user_kepi
        mylog << "Newspaper (printed): \n"
        mylog << "( #{sensor_val}/100 * #{total_anual_output} ) * #{user_kepi} = #{tmp_result} \n"

      end

      result += tmp_result

      mylog << "result partial: #{result} \n"

    end


    mylog << "final result: #{result} \n"
    mylog << "------------------------End - yield_kg_year - #{type} ----------------\n"
    logger.debug mylog

    result
  end

  def production_euro_year(se_product,type)
    mylog = "------------------------Start - production_euro_year - #{type} ----------------\n"

    result = 0
    total_downtime = se_product.se_use_production.total_downtime(type)
    productive_time = se_product.se_use_production.productive_time(type)
    facility_operation_time =  se_product.se_use_production.operation_time
    energy_cost = 0

    #energy
    mylog << "Start section -> Energy \n"
    se_product.se_use_consumption_datas.each do |consumption_data|

      if consumption_data.se_energy_type.name_en == "Electricity"
        energy_cost =  se_product.se_use_cost.electricity
      elsif consumption_data.se_energy_type.name_en == "Heat"
        energy_cost =  se_product.se_use_cost.heat
      elsif consumption_data.se_energy_type.name_en == "Natural Gas"
        energy_cost = se_product.se_use_cost.gas
      elsif consumption_data.se_energy_type.name_en == "Other fuels"
        energy_cost =  se_product.se_use_cost.fuels
      end

      tmp_result = 0
      sensor_val = 0

      if type == "with"
        sensor_val = consumption_data.with_sensor  if !consumption_data.with_sensor.nil?
      elsif type == "without"
        sensor_val = consumption_data.without_sensor  if !consumption_data.without_sensor.nil?
      end

      if consumption_data.se_energy_use.name_en == "Machine, operational times"
        tmp_result = sensor_val * productive_time  * energy_cost
        mylog << "Machine, operational times: #{tmp_result} --> #{sensor_val} * #{productive_time}  * #{energy_cost} \n"
      elsif consumption_data.se_energy_use.name_en == "Machine, downtimes"
        tmp_result = sensor_val * total_downtime  * energy_cost
        mylog << "Machine, downtimes: #{tmp_result} --> #{sensor_val} * #{total_downtime}  * #{energy_cost} \n"
      elsif consumption_data.se_energy_use.name_en == "Overhead, infrastructure, at all times"
        tmp_result = sensor_val * facility_operation_time  * energy_cost
        mylog << "Overhead, infrastructure, at all times: #{tmp_result} --> #{sensor_val} * #{facility_operation_time}  * #{energy_cost} \n"
      end

      result += tmp_result
      mylog << "partial energy result: #{result}"
    end

    mylog << "Resultat - energy: #{result} \n"
    mylog << "End section -> Energy \n"

    mylog << "Start section -> Consumables \n"
    se_product.se_use_consumption_consumable_datas.each do |consumable_data|
      tmp_result = 0
      sensor_val = 0

      if type == "with"
        sensor_val = consumable_data.with_sensor if !consumable_data.with_sensor.nil?
      elsif type == "without"
        sensor_val = consumable_data.without_sensor if !consumable_data.without_sensor.nil?
      end

      if sensor_val && facility_operation_time && consumable_data.cost
         tmp_result =  sensor_val * facility_operation_time *  consumable_data.cost
      end
      mylog << "#{tmp_result} = #{sensor_val} * #{facility_operation_time} * #{consumable_data.cost}\n"

      result += tmp_result
      mylog << "partial result: #{result}\n"
    end

    mylog << "Resultat - consumables: #{result} \n"
    mylog << "End section -> Consumables \n"

    ## Segona part - bloc 1
    mylog << "Start section -> segona part bloc 1 \n"

    machine_fixed = se_product.se_use_cost.machine_fixed
    machine_variable = se_product.se_use_cost.machine_variable
    personnel_cost = 0
    mantinance_cost = 0
    storage_parts = 0
    storage_cost = se_product.se_use_cost.spare_parts_storage

    if type == "with"
      personnel_cost = se_product.se_use_cost.personnel_with
      mantinance_cost = se_product.se_use_cost.maintenance_with
      storage_parts = se_product.se_use_cost.spare_parts_with
    elsif type == "without"
      personnel_cost = se_product.se_use_cost.personnel_without
      mantinance_cost = se_product.se_use_cost.maintenance_without
      storage_parts = se_product.se_use_cost.spare_parts_without
    end

    mylog << "#{machine_fixed} * #{facility_operation_time} + #{machine_variable} * #{productive_time} + #{personnel_cost} + #{mantinance_cost} + #{storage_parts} * #{storage_cost} \n"
    result += machine_fixed * facility_operation_time + machine_variable * productive_time + personnel_cost + mantinance_cost + storage_parts * storage_cost
    mylog << "Result: #{result}"
    mylog << "End section -> segona part bloc 1 \n"

    ## Segona part bloc 2
    mylog << "Start section -> segona part bloc 2 \n"

    sum_utilities = 0
    electric_cost = se_product.se_use_cost.electricity
    use_f64_electricity_consum = 0
    if type == "with"
      use_f64_electricity_consum = se_product.se_use_consumption.sensor_system_with if !se_product.se_use_consumption.sensor_system_with.nil?
    elsif type == "without"
      use_f64_electricity_consum = se_product.se_use_consumption.sensor_system_without if !se_product.se_use_consumption.sensor_system_without.nil?
    end

    se_product.se_use_consumption_utility_datas.each do |utility_data|
      sensor_val = 0

      if type== "with"
        sensor_val = utility_data.with_sensor if !utility_data.with_sensor.nil?
      elsif type == "without"
        sensor_val = utility_data.without_sensor if !utility_data.without_sensor.nil?
      end

      if utility_data.se_utility.name_en == "Exhaust"
        sum_utilities +=  sensor_val * @excel_value_x11
        mylog << "#{sum_utilities} +=  #{sensor_val} * #{@excel_value_x11}\n"
      elsif utility_data.se_utility.name_en == "Vacuum"
        sum_utilities +=  sensor_val * @excel_value_y11
        mylog << "#{sum_utilities} +=  #{sensor_val} * #{@excel_value_y11}\n"
      elsif utility_data.se_utility.name_en == "Clean Dry Air"
        sum_utilities +=  sensor_val * @excel_value_z11
        mylog << "#{sum_utilities} +=  #{sensor_val} * #{@excel_value_z11}\n"
      elsif utility_data.se_utility.name_en == "High Pressure Clean Dry Air"
        sum_utilities +=  sensor_val * @excel_value_aa11
        mylog << "#{sum_utilities} +=  #{sensor_val} * #{@excel_value_aa11}\n"
      elsif utility_data.se_utility.name_en == "Compressed Air"
        sum_utilities += sensor_val * utility_data.electricity_consumption
#          if use_f64_electricity_consum == 0
#            sum_utilities +=  sensor_val * @excel_value_ab11
#            mylog << "#{sum_utilities} +=  #{sensor_val} * #{@excel_value_ab11}\n"
#          else
#            sum_utilities +=  sensor_val * use_f64_electricity_consum * @excel_value_ab11
#            mylog << "#{sum_utilities} +=  #{sensor_val} * #{use_f64_electricity_consum} * #{@excel_value_ab11}\n"
#          end
      elsif utility_data.se_utility.name_en == "Water Cooled (by Refrigeration)"
        excel_value_ac11 = 0
        excel_value_ac11 = 0.258 * utility_data.temperature_difference + 0.273 if !utility_data.temperature_difference.nil?
        sum_utilities +=  sensor_val * excel_value_ac11
        mylog << "#{sum_utilities} +=  #{sensor_val} * #{excel_value_ac11}\n"
      elsif utility_data.se_utility.name_en == "Ultrapure Water / Deionized Water"
        sum_utilities +=  sensor_val * @excel_value_ad11
        mylog << "#{sum_utilities} +=  #{sensor_val} * #{@excel_value_ad11}\n"
      elsif utility_data.se_utility.name_en == "Hot Ultrapure Water / Deionized Water, pressurized, Temp"
        sum_utilities +=  sensor_val * @excel_value_ae11
        mylog << "#{sum_utilities} +=  #{sensor_val} * #{@excel_value_ae11}\n"
      elsif utility_data.se_utility.name_en == "Nitrogen"
        sum_utilities +=  sensor_val * @excel_value_af11
        mylog << "#{sum_utilities} +=  #{sensor_val} * #{@excel_value_af11}\n"
      end
    end

    mylog << "#{facility_operation_time} * #{electric_cost} * #{sum_utilities}\n"
    result +=  facility_operation_time * electric_cost * sum_utilities

    mylog << "Result: #{result}"
    mylog << "End section -> segona part bloc 2 \n"


    #tercer bloc
    yield_sum = 0

    mylog << "Start section -> segona part bloc 3 \n"
    se_product.se_recycling_datas.each do |recycling_data|
      if type=="with"
        yield_sum = recycling_data.with_sensor
      elsif type == "without"
        yield_sum = recycling_data.without_sensor
      end
    end

    total_anual_otuput = se_product.se_use_product.total_anual_output(type)


    raw_mat = 0
    raw_mat = se_product.se_use_cost.raw_material if !se_product.se_use_cost.raw_material.nil?

    result += (((yield_sum/100) * total_anual_otuput) + total_anual_otuput) * raw_mat
    mylog << "(((#{yield_sum}/100 * #{total_anual_otuput}) + #{total_anual_otuput}) * #{raw_mat}\n"
    mylog << "Result: #{result}\n"
    mylog << "End section -> segona part bloc 3 \n"
    mylog << "------------------------End - production_euro_year - #{type} ----------------\n"
    logger.debug mylog

    result

  end

  def value_euro_year(se_product,type)
   result = 0
   total_anual_output = se_product.se_use_product.total_anual_output(type)

   se_product.se_recycling_datas.each do |recycling_data|
     if type == "with"
      recycling_data_percent = recycling_data.with_sensor
     elsif type == "without"
       recycling_data_percent = recycling_data.without_sensor
     else
       recycling_data_percent = 0
     end

     result += recycling_data_percent/100 * total_anual_output * recycling_data.recycling_revenue

   end

    result += SeUseProduct.total_anual_output_cost(se_product,type)

   result *= -1
   result
  end

  def yield_loss_euro_year(se_product,type)
    result = 0
    #total_anual_output = se_product.se_use_product.total_anual_output(type)
    total_anual_output_cost = SeUseProduct.total_anual_output_cost(se_product,type)

    se_product.se_recycling_datas.each do |recycling_data|
      if type == "with"
        recycling_data_percent = recycling_data.with_sensor
      elsif type == "without"
        recycling_data_percent = recycling_data.without_sensor
      else
        recycling_data_percent = 0
      end

      result += recycling_data_percent/100 * total_anual_output_cost

    end
    result
  end

  def load_indicators_and_excel_values
    #use_f65 =

    indicator_1 = Indicator.find(:first, :conditions => ["sector='sensors' and name='Global warming potential (CO2 eq.)'"])
    indicator_2 = Indicator.find(:first, :conditions => ["sector='sensors' and name='Electricity consumption (kWh)'"])    
    @excel_value_f10 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='MANUFACTURING' and family='Sensor nodes' and name='Microcontroller ICs'", indicator_1.id]).value
    @excel_value_g10 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='MANUFACTURING' and family='Sensor nodes' and name='Memory'", indicator_1.id]).value
    @excel_value_h10 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='MANUFACTURING' and family='Sensor nodes' and name='Sensor Printed Circuit Board'", indicator_1.id]).value
    @excel_value_i10 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='MANUFACTURING' and family='Sensor nodes' and name='battery (Li-ion)'", indicator_1.id]).value    
    @excel_value_j10 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='MANUFACTURING' and family='Sensor nodes' and name='housing, steel'", indicator_1.id]).value
    @excel_value_k10 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='MANUFACTURING' and family='Cables' and name='cable'", indicator_1.id]).value    

    #@excel_value_l10 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='USE' and family='Energy' and name='Electricity (EU-27)'", indicator_1.id]).value
    @excel_value_l10 = SeUseProduction.find_by_se_product_id(params[:id]).se_country_info.electricity

    @excel_value_m10 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='USE' and family='Energy' and name='Natural gas'", indicator_1.id]).value
    @excel_value_n10 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='USE' and family='Energy' and name='Other fuels'", indicator_1.id]).value

    @excel_value_o10 = ExcelValue.find(:all, :conditions => ["indicator_id = ? and phase='USE' and family='Consumables'", indicator_1.id])

    @excel_value_x11 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='USE' and family='Utilities' and name='Exhaust'", indicator_2.id]).value
    @excel_value_y11 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='USE' and family='Utilities' and name='Vacuum'", indicator_2.id]).value
    @excel_value_z11 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='USE' and family='Utilities' and name='Clean Dry Air'", indicator_2.id]).value
    @excel_value_aa11 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='USE' and family='Utilities' and name='High Pressure Clean Dry Air'", indicator_2.id]).value
    @excel_value_ab11 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='USE' and family='Utilities' and name='Compressed Air'", indicator_2.id]).value
    @excel_value_ac11 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='USE' and family='Utilities' and name='Water Cooled (by Refrigeration)'", indicator_2.id]).value
    @excel_value_ad11 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='USE' and family='Utilities' and name='Ultrapure Water / Deionized Water'", indicator_2.id]).value
    @excel_value_ae11 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='USE' and family='Utilities' and name='Hot Ultrapure Water / Deionized Water, pressurized, Temp'", indicator_2.id]).value
    @excel_value_af11 = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='USE' and family='Utilities' and name='Nitrogen'", indicator_2.id]).value

    @excel_value_ag = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='DISPOSAL' and family='Yield loss recycling' and name='01_Aluminium strip / sheet / foil'", indicator_1.id]).value
    @excel_value_ah = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='DISPOSAL' and family='Yield loss recycling' and name='02_Aluminium sheet parts (d=0.2  2 mm)'", indicator_1.id]).value
    @excel_value_ai = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='DISPOSAL' and family='Yield loss recycling' and name='03_Aluminium foil (processed, d=0.005  0.2)'", indicator_1.id]).value
    @excel_value_aj = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='DISPOSAL' and family='Yield loss recycling' and name='04_Aluminium profile (processed)'", indicator_1.id]).value
    @excel_value_ak = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='DISPOSAL' and family='Yield loss recycling' and name='05_Copper strip / sheet / foil'", indicator_1.id]).value
    @excel_value_al = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='DISPOSAL' and family='Yield loss recycling' and name='06_Steel, hot rolled'", indicator_1.id]).value
    @excel_value_am = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='DISPOSAL' and family='Yield loss recycling' and name='07_Stainless steel, hot rolled'", indicator_1.id]).value
    @excel_value_an = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='DISPOSAL' and family='Yield loss recycling' and name='08_Steel, cold rolled / plates'", indicator_1.id]).value
    @excel_value_ao = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='DISPOSAL' and family='Yield loss recycling' and name='09_Steel parts (processed coil, stamped or bended or otherwise processed plates)'", indicator_1.id]).value
    @excel_value_ap = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='DISPOSAL' and family='Yield loss recycling' and name='10_Stainless steel, processed coil'", indicator_1.id]).value
    @excel_value_aq = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='DISPOSAL' and family='Yield loss recycling' and name='11_Stainless steel parts (stamped or bended or otherwise processed plates)'", indicator_1.id]).value
    @excel_value_ar = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='DISPOSAL' and family='Yield loss recycling' and name='12_Zinc sheet parts (d=0.7mm)'", indicator_1.id]).value
    @excel_value_as = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='DISPOSAL' and family='Yield loss recycling' and name='13_Glass, flat, annealed'", indicator_1.id]).value
    @excel_value_at = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='DISPOSAL' and family='Yield loss recycling' and name='14_Glass, flat, processed'", indicator_1.id]).value
    @excel_value_au = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='DISPOSAL' and family='Yield loss recycling' and name='15_Paper (calendered)'", indicator_1.id]).value
    @excel_value_av = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='DISPOSAL' and family='Yield loss recycling' and name='16_Paper, cardboard (printed)'", indicator_1.id]).value
    @excel_value_aw = ExcelValue.find(:first, :conditions => ["indicator_id = ? and phase='DISPOSAL' and family='Yield loss recycling' and name='17_Newspaper (printed)'", indicator_1.id]).value
  end










  def compare
    puts params.inspect
    @ph_product = PhProduct.find(params[:ph_product_id])
    @ph_product_2 = PhProduct.find(params[:compareTo])
    
    @product = @ph_product.product
    @product_2 = @ph_product_2.product
    @ph_embedded_result  = @ph_product.ph_embedded_result 
    @ph_embedded_result_2  = @ph_product_2.ph_embedded_result 
    @ph_result = @ph_product.ph_result
    @ph_result_2 = @ph_product_2.ph_result
    @step = 5
    
    @values_co2_to_array = @ph_result.cabling.to_s + "," + @ph_result.module.to_s + "," + @ph_result.framing.to_s + "," + @ph_result.mounting.to_s + "," + @ph_result.inverter.to_s + "," + @ph_result.batteries.to_s + "," + @ph_result.maintenance.to_s
    @values_co2_to_array += "|" + @ph_result_2.cabling.to_s + "," + @ph_result_2.module.to_s + "," + @ph_result_2.framing.to_s + "," + @ph_result_2.mounting.to_s + "," + @ph_result_2.inverter.to_s + "," + @ph_result_2.batteries.to_s + "," + @ph_result_2.maintenance.to_s
    
    @values_pe_to_array = (@ph_embedded_result.pe_pv_cabling / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_pv_module  / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_pv_framing  / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_pv_mounting / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_inverter  / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_batteries / @ph_embedded_result.averaged_consumption).to_s + "," + (@ph_embedded_result.pe_maintenance / @ph_embedded_result.averaged_consumption).to_s
    @values_pe_to_array += "|" + (@ph_embedded_result_2.pe_pv_cabling / @ph_embedded_result_2.averaged_consumption).to_s + "," + (@ph_embedded_result_2.pe_pv_module  / @ph_embedded_result_2.averaged_consumption).to_s + "," + (@ph_embedded_result_2.pe_pv_framing  / @ph_embedded_result_2.averaged_consumption).to_s + "," + (@ph_embedded_result_2.pe_pv_mounting / @ph_embedded_result_2.averaged_consumption).to_s + "," + (@ph_embedded_result_2.pe_inverter  / @ph_embedded_result_2.averaged_consumption).to_s + "," + (@ph_embedded_result_2.pe_batteries / @ph_embedded_result_2.averaged_consumption).to_s + "," + (@ph_embedded_result_2.pe_maintenance / @ph_embedded_result_2.averaged_consumption).to_s    
    
    @labels_size = 14
    @ticks_to_array = "|" + _('Maintenance').html_safe + "|" + _('Batteries').html_safe + "|" + _('Inverter').html_safe + "|" + _('Mounting').html_safe + "|" + _('Framing/Panel').html_safe + "|" + _('Module/Laminate').html_safe + "|" + _('Cabling').html_safe
    @legend = @product.name + "|" + @product_2.name 
    @seriesColors_to_array = "999999,0000FF"    
  end   
    
  def generate_graphic
     
     @data_saving_year_to_array = "0,"

     @colors_year_to_array = "F58528|"
     tmp = (@se_result.sensor_kg_year_with - @se_result.sensor_kg_year_without) / 1000
     @data_saving_year_to_array += tmp.to_s + ","
     if tmp > 0 
        @colors_year_to_array += "F58528|"
     else
        @colors_year_to_array += "FFCC00|"
     end  
              
     tmp = (@se_result.energy_kg_year_with - @se_result.energy_kg_year_without) / 1000
     @data_saving_year_to_array += tmp.to_s + ","
     if tmp > 0 
        @colors_year_to_array += "F58528|"
     else
        @colors_year_to_array += "FFCC00|"
     end  
     
     tmp = (@se_result.consumables_kg_year_with - @se_result.consumables_kg_year_without)  / 1000    
     @data_saving_year_to_array += tmp.to_s + ","
     if tmp > 0 
        @colors_year_to_array += "F58528|"
     else
        @colors_year_to_array += "FFCC00|"
     end  

     
     tmp = (@se_result.utilities_kg_year_with - @se_result.utilities_kg_year_without)  / 1000
     @data_saving_year_to_array += tmp.to_s + ","
     if tmp > 0 
        @colors_year_to_array += "F58528|"
     else
        @colors_year_to_array += "FFCC00|"
     end  
     
     tmp = (@se_result.yield_kg_year_with - @se_result.yield_kg_year_without)   / 1000    
     @data_saving_year_to_array += (tmp).to_s
     if tmp > 0 
        @colors_year_to_array += "F58528"
     else
        @colors_year_to_array += "FFCC00"
     end  
         
     @labels_saving_year_to_array = "|" + _('yield loss') + "|" + _('production - utilities usage') + "|" + _('production - consumables usage') + "|" + _('production - energy usage') + "|" + _('sensor life cycle')
     @legend_saving_year_to_array = "Greenhouse gas emissions t CO2-eq. "
     @data_saving_product_to_array = "0,"

     @colors_product_to_array = "F58528|"
     tmp = (@se_result.sensor_kg_product_with - @se_result.sensor_kg_product_without)
     @data_saving_product_to_array += tmp.to_s + ","
     if tmp > 0 
        @colors_product_to_array += "F58528|"
     else
        @colors_product_to_array += "FFCC00|"
     end  
              
     tmp = (@se_result.energy_kg_product_with - @se_result.energy_kg_product_without)
     @data_saving_product_to_array += tmp.to_s + ","
     if tmp > 0 
        @colors_product_to_array += "F58528|"
     else
        @colors_product_to_array += "FFCC00|"
     end  
     
     tmp = (@se_result.consumables_kg_product_with - @se_result.consumables_kg_product_without)     
     @data_saving_product_to_array += tmp.to_s + ","
     if tmp > 0 
        @colors_product_to_array += "F58528|"
     else
        @colors_product_to_array += "FFCC00|"
     end  

     
     tmp = (@se_result.utilities_kg_product_with - @se_result.utilities_kg_product_without) 
     @data_saving_product_to_array += tmp.to_s + ","
     if tmp > 0 
        @colors_product_to_array += "F58528|"
     else
        @colors_product_to_array += "FFCC00|"
     end  
     
     tmp = (@se_result.yield_kg_product_with - @se_result.yield_kg_product_without)      
     @data_saving_product_to_array += (tmp).to_s
     if tmp > 0 
        @colors_product_to_array += "F58528"
     else
        @colors_product_to_array += "FFCC00"
     end  
         
     @labels_saving_product_to_array = "|" + _('yield loss') + "|" + _('production - utilities usage') + "|" + _('production - consumables usage') + "|" + _('production - energy usage') + "|" + _('sensor life cycle')
     @legend_saving_product_to_array = "Greenhouse gas emissions kg CO2-eq. / kg product output"

     @data_saving_savings_to_array = "0,"

     @colors_savings_to_array = "F58528|"
     tmp = (@se_result.sensor_euro_product_with - @se_result.sensor_euro_product_without)
     @data_saving_savings_to_array += tmp.to_s + ","
     if tmp > 0 
        @colors_savings_to_array += "F58528|"
     else
        @colors_savings_to_array += "FFCC00|"
     end  
              
     tmp = (@se_result.production_euro_product_with - @se_result.production_euro_product_without)
     @data_saving_savings_to_array += tmp.to_s + ","
     if tmp > 0 
        @colors_savings_to_array += "F58528|"
     else
        @colors_savings_to_array += "FFCC00|"
     end  

     tmp = (@se_result.yield_euro_product_with - @se_result.yield_euro_product_without) 
     @data_saving_savings_to_array += tmp.to_s + ","
     if tmp > 0 
        @colors_savings_to_array += "F58528|"
     else
        @colors_savings_to_array += "FFCC00|"
     end  
     
     
     tmp = (@se_result.value_euro_product_with - @se_result.value_euro_product_without)     
     @data_saving_savings_to_array += tmp.to_s
     if tmp > 0 
        @colors_savings_to_array += "F58528|"
     else
        @colors_savings_to_array += "FFCC00|"
     end  

     @labels_saving_savings_to_array = "|" + _('value creation') + "|" + _('yield loss') + "|" + _('production costs') + "|" + _('sensor life cycle')
     @legend_saving_savings_to_array = "Euro/kg product output"

     @data_compare_to_array = @se_result.sensor_kg_product_with.to_s + "," + @se_result.energy_kg_product_with.to_s + "," + @se_result.consumables_kg_product_with.to_s + "," + @se_result.utilities_kg_product_with.to_s + "," + @se_result.yield_kg_product_with.to_s
     @data_compare_to_array += "|" + @se_result.sensor_kg_product_without.to_s + "," + @se_result.energy_kg_product_without.to_s + "," + @se_result.consumables_kg_product_without.to_s + "," + @se_result.utilities_kg_product_without.to_s + "," + @se_result.yield_kg_product_without.to_s

     @labels_compare_to_array = "|" + _('yield loss') + "|" + _('production - utilities usage') + "|" + _('production - consumables usage') + "|" + _('production - energy usage') + "|" + _('sensor life cycle')

     @legend_compare = "with sensor|without sensor"
     @colors_compare_to_array = "F58528,FFCC00"
     
     
     
  end
    
  def graphic

    @se_product = SeProduct.find(params[:se_result_id])
    @se_result = @se_product.se_result
    @product = @se_product.product
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @se_product.product.name, edit_product_url(@se_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, se_manufacturing_path(@se_product)
    add_breadcrumb _("Results").html_safe, se_result_graphic_path(@se_product)
    
    @step = 2
    
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

    @power_optimisation_ticks = _('Projected System') + "|" + _('Efficiency') + "|" + _('Insolation') + "|" + _('Performance Ratio') + "|" + _('Lifetime')     
    @power_optimisation_values = @power_projected_improvement.to_s + "|"  + @power_efficiency_graph.to_s + "|"  + @power_insolation_graph.to_s + "|"  + @power_performance_graph.to_s + "|"  + @power_lifetime_graph.to_s    
  #  @power_optimisation_values = @power_projected_improvement.to_s + "|"  + @power_efficiency_improvement.to_s + "|"  + @power_insolation_improvement.to_s + "|"  + @power_performance_improvement.to_s + "|"  + @power_lifetime_improvement.to_s
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
   # @area = @ph_product.ph_specified.area * @ph_product.ph_specified.area_unit.conversion_factor
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
    
    
    logger.info '*******************'
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
    logger.info '*******************'
    
    
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
   
    @se_product = SeProduct.find(params[:se_result_id])
    @se_result = @se_product.se_result
    @product = @se_product.product
    
    generate_graphic
    
    save_path = Rails.root.join('pdfs','se_report_' + @se_product.id.to_s + '.pdf')    
    if File.exists?(save_path)
       File.delete(save_path)
    end


    pdf_test = false
    if pdf_test
      render :layout => false
    else
      pdf = WickedPdf.new.pdf_from_string(render_to_string(:template => '/se_results/pdf.html.erb', :layout => false))
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
        end
    else 
        #Menues!N49*(Assumptions!F38/100)*Assumptions!I15*Assumptions!I9*Assumptions!F39                       
        @ph_result.lifetime = n49 * (calcul_efficiency  / 100) * @ph_product.ph_basic_information.performance_ratio * @ph_product.ph_basic_information.radiation * @ph_product.ph_specified.lifetime
            
    end
   
        
       #IF($Assumptions.E35=$Menues.G41;$Assumptions.D35*$Menues.E60;IF($Assumptions.E35=$Menues.G42;$Assumptions.D35;IF($Assumptions.E35=G43;$Menues.E59*$Assumptions.D35;IF($Assumptions.E35=$Menues.G44;$Menues.E58*$Assumptions.D35;IF($Assumptions.E35=$Menues.G45;$Menues.E61*$Assumptions.D35;0)))));0))
   
   # ph_result cabling
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
#    @ph_embedded_result.estim_co2 = 1000 * @ph_result.co2_total / @ph_embedded_result.lifetime_production
    


 
    
    
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
        format.html { redirect_to comparison_url(@product)}
     end   
  end

        
  def generate_csv
    product = get_product(params[:product_id])
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

        format_num.set_num_format('0.00')
        @se_product = product.se_product
        @se_result = @se_product.se_result
        
        title = _('INDICATOR')
        title_2 = _('UNITS')

        worksheet.write(1, 0, _('kg CO2-eq/year'), format_bold)
        worksheet.write(1, 1, _('Without sensor'), format_bold)
        worksheet.write(1, 2, _('With sensor'), format_bold)
        worksheet.write(1, 3, _('Increment impacts'), format_bold)
       
        total_1 = 0
        total_2 = 0
        total_3 = 0
       
        worksheet.write(2, 0, _('sensor life cycle'), format_bold)
        worksheet.write(2, 1, @se_result.sensor_kg_year_without, format_num)
       total_1 += @se_result.sensor_kg_year_without
       worksheet.write(2, 2, @se_result.sensor_kg_year_with, format_num) 
       total_2 += @se_result.sensor_kg_year_with
       @sensor_kg_year_increment_impact = @se_result.sensor_kg_year_with - @se_result.sensor_kg_year_without
       total_3 += @sensor_kg_year_increment_impact
       worksheet.write(2, 3, @sensor_kg_year_increment_impact, format_num) 

       worksheet.write(3, 0, _('production - energy usage'), format_bold)    
       worksheet.write(3, 1, @se_result.energy_kg_year_without, format_num)
       total_1 += @se_result.energy_kg_year_without
       worksheet.write(3, 2, @se_result.energy_kg_year_with, format_num) 
       total_2 += @se_result.energy_kg_year_with
       @energy_kg_year_increment_impact = @se_result.energy_kg_year_with - @se_result.energy_kg_year_without
       total_3 += @energy_kg_year_increment_impact
       worksheet.write(3, 3, @energy_kg_year_increment_impact, format_num)  
       
       worksheet.write(4, 0, _('production - consumables usage'), format_bold)  
       worksheet.write(4, 1, @se_result.consumables_kg_year_without, format_num)
       total_1 += @se_result.consumables_kg_year_without       
       worksheet.write(4, 2, @se_result.consumables_kg_year_with, format_num)
       total_2 += @se_result.consumables_kg_year_with       
       @consumables_kg_year_increment_impact = @se_result.consumables_kg_year_with - @se_result.consumables_kg_year_without
       total_3 += @consumables_kg_year_increment_impact       
       worksheet.write(4, 3, @consumables_kg_year_increment_impact, format_num)  

       worksheet.write(5, 0, _('production - utilities usage'), format_bold)  
       worksheet.write(5, 1, @se_result.utilities_kg_year_without, format_num)
       total_1 += @se_result.utilities_kg_year_without       
       worksheet.write(5, 2, @se_result.utilities_kg_year_with, format_num)
       total_2 += @se_result.utilities_kg_year_with       
       @utilities_kg_year_increment_impact = @se_result.utilities_kg_year_with - @se_result.utilities_kg_year_without
       total_3 += @utilities_kg_year_increment_impact       
       worksheet.write(5, 3, @utilities_kg_year_increment_impact, format_num)  

       worksheet.write(6, 0, _('yield loss'), format_bold)  
       worksheet.write(6, 1, @se_result.yield_kg_year_without, format_num)
       total_1 += @se_result.yield_kg_year_without       
       worksheet.write(6, 2, @se_result.yield_kg_year_with, format_num)
       total_2 += @se_result.yield_kg_year_with       
       @yield_loss_kg_year_increment_impact = @se_result.yield_kg_year_with - @se_result.yield_kg_year_without
       total_3 += @yield_loss_kg_year_increment_impact       
       worksheet.write(6, 3, @yield_loss_kg_year_increment_impact, format_num)  
       
       
       worksheet.write(7, 0, _('TOTAL'), format_bold)  
       worksheet.write(7, 1, total_1, format_num)
       worksheet.write(7, 2, total_2, format_num) 
       worksheet.write(7, 3, total_3, format_num)  
       
       worksheet.write(9, 0, _('kg CO2-eq/kg product'), format_bold)  
       worksheet.write(9, 1, _('Without sensor'), format_bold)        
       worksheet.write(9, 2, _('With sensor'), format_bold)  
       worksheet.write(9, 3, _('Increment impacts'), format_bold)  
       
       total_1 = 0
       total_2 = 0
       total_3 = 0
      
       worksheet.write(10, 0, _('sensor life cycle'), format_bold)  
       worksheet.write(10, 1, @se_result.sensor_kg_product_without, format_num)      
       total_1 += @se_result.sensor_kg_product_without         
       worksheet.write(10, 2, @se_result.sensor_kg_product_with, format_num)
       total_2 += @se_result.sensor_kg_product_with  
       @sensor_kg_product_increment_impact = @se_result.sensor_kg_product_with - @se_result.sensor_kg_product_without
       total_3 += @sensor_kg_product_increment_impact
       worksheet.write(10, 3, @sensor_kg_product_increment_impact, format_num) 

       worksheet.write(11, 0, _('production - energy usage'), format_bold)
       worksheet.write(11, 1, @se_result.energy_kg_product_without, format_num)    
       total_1 += @se_result.energy_kg_product_without       
       worksheet.write(11, 2, @se_result.energy_kg_product_with, format_num)
       total_2 += @se_result.energy_kg_product_with       
       @energy_kg_product_increment_impact = @se_result.energy_kg_product_with - @se_result.energy_kg_product_without
       total_3 += @energy_kg_product_increment_impact     
       worksheet.write(11, 3, @energy_kg_product_increment_impact, format_num) 
       
       worksheet.write(12, 0, _('production - consumables usage'), format_bold)
       worksheet.write(12, 1, @se_result.consumables_kg_product_without, format_num)  
       total_1 += @se_result.consumables_kg_product_without       
       worksheet.write(12, 2, @se_result.consumables_kg_product_with, format_num)
       total_2 += @se_result.consumables_kg_product_with       
       @consumable_kg_product_increment_impact = @se_result.consumables_kg_product_with - @se_result.consumables_kg_product_without
       total_3 += @consumable_kg_product_increment_impact       
       worksheet.write(12, 3, @consumable_kg_product_increment_impact, format_num) 
       
       worksheet.write(13, 0, _('production - utilities usage'), format_bold)
       worksheet.write(13, 1, @se_result.utilities_kg_product_without, format_num)  
       total_1 += @se_result.utilities_kg_product_without       
       worksheet.write(13, 2, @se_result.utilities_kg_product_with, format_num)
       total_2 += @se_result.utilities_kg_product_with       
       @utilities_kg_product_increment_impact = @se_result.utilities_kg_product_with - @se_result.utilities_kg_product_without
       total_3 +=  @utilities_kg_product_increment_impact      
       worksheet.write(13, 3, @utilities_kg_product_increment_impact, format_num) 
       
       worksheet.write(14, 0, _('yield loss'), format_bold)
       worksheet.write(14, 1, @se_result.yield_kg_product_without, format_num)     
       total_1 += @se_result.yield_kg_product_without       
       worksheet.write(14, 2, @se_result.yield_kg_product_with, format_num)
       total_2 += @se_result.yield_kg_product_with       
       @yield_loss_kg_product_increment_impact = @se_result.yield_kg_product_with - @se_result.yield_kg_product_without
       total_3 += @yield_loss_kg_product_increment_impact       
       worksheet.write(14, 3, @yield_loss_kg_product_increment_impact, format_num) 
       
       worksheet.write(15, 0, _('TOTAL'), format_bold)  
       worksheet.write(15, 1, total_1, format_num)
       worksheet.write(15, 2, total_2, format_num) 
       worksheet.write(15, 3, total_3, format_num)  
       
       
       worksheet.write(17, 0, _('Euro/year'), format_bold)  
       worksheet.write(17, 1, _('Without sensor'), format_bold)        
       worksheet.write(17, 2, _('With sensor'), format_bold)  
       worksheet.write(17, 3, _('Increment impacts'), format_bold)  
       
       total_1 = 0
       total_2 = 0
       total_3 = 0
             
       worksheet.write(18, 0, _('sensor life cycle'), format_bold)  
       worksheet.write(18, 1, @se_result.sensor_euro_year_without, format_num)  
       total_1 += @se_result.sensor_euro_year_without
       worksheet.write(18, 2, @se_result.sensor_euro_year_with, format_num)
       total_2 += @se_result.sensor_euro_year_with       
       @sensor_euro_year_increment_impact = @se_result.sensor_euro_year_with - @se_result.sensor_euro_year_without
       total_3 += @sensor_euro_year_increment_impact       
       worksheet.write(18, 3, @sensor_euro_year_increment_impact, format_num) 

       worksheet.write(19, 0, _('production costs'), format_bold)  
       worksheet.write(19, 1, @se_result.production_euro_year_without, format_num)     
       total_1 += @se_result.production_euro_year_without       
       worksheet.write(19, 2, @se_result.production_euro_year_with, format_num)
       total_2 += @se_result.production_euro_year_with       
       @production_euro_year_increment_impact = @se_result.production_euro_year_with - @se_result.production_euro_year_without
       total_3 += @production_euro_year_increment_impact     
       worksheet.write(19, 3, @production_euro_year_increment_impact, format_num) 
       
       worksheet.write(20, 0, _('yield loss'), format_bold)  
       worksheet.write(20, 1, @se_result.yield_euro_year_without, format_num)  
       total_1 += @se_result.yield_euro_year_without       
       worksheet.write(20, 2, @se_result.yield_euro_year_with, format_num)
       total_2 += @se_result.yield_euro_year_with       
       @yield_euro_year_increment_impact = @se_result.yield_euro_year_with - @se_result.yield_euro_year_without
       total_3 += @yield_euro_year_increment_impact       
       worksheet.write(20, 3, @yield_euro_year_increment_impact, format_num) 

       worksheet.write(21, 0, _('value creation'), format_bold)  
       worksheet.write(21, 1, @se_result.value_euro_year_without, format_num)
       total_1 += @se_result.value_euro_year_without       
       worksheet.write(21, 2, @se_result.value_euro_year_with, format_num)
       total_2 += @se_result.value_euro_year_with       
       @value_euro_year_increment_impact = @se_result.value_euro_year_with - @se_result.value_euro_year_without
       total_3 += @value_euro_year_increment_impact       
       worksheet.write(21, 3, @value_euro_year_increment_impact, format_num) 
       
       
       worksheet.write(22, 0, _('TOTAL'), format_bold)  
       worksheet.write(22, 1, total_1, format_num)
       worksheet.write(22, 2, total_2, format_num) 
       worksheet.write(22, 3, total_3, format_num)  
       
       worksheet.write(24, 0, _('Euro/kg'), format_bold)  
       worksheet.write(24, 1, _('Without sensor'), format_bold)        
       worksheet.write(24, 2, _('With sensor'), format_bold)  
       worksheet.write(24, 3, _('Increment impacts'), format_bold)  
       
       total_1 = 0
       total_2 = 0
       total_3 = 0
      
       worksheet.write(25, 0, _('sensor life cycle'), format_bold)  
       worksheet.write(25, 1, @se_result.sensor_euro_product_without, format_num) 
       total_1 += @se_result.sensor_euro_product_without       
       worksheet.write(25, 2, @se_result.sensor_euro_product_with, format_num)
       total_2 += @se_result.sensor_euro_product_with       
       @sensors_euro_kg_increment_impact = @se_result.sensor_euro_product_with - @se_result.sensor_euro_product_without
       total_3 += @sensors_euro_kg_increment_impact       
       worksheet.write(25, 3, @sensors_euro_kg_increment_impact, format_num) 

       worksheet.write(26, 0, _('production costs'), format_bold)  
       worksheet.write(26, 1, @se_result.production_euro_product_without, format_num) 
       total_1 += @se_result.production_euro_product_without       
       worksheet.write(26, 2, @se_result.production_euro_product_with, format_num)
       total_2 += @se_result.production_euro_product_with       
       @production_euro_kg_increment_impact = @se_result.production_euro_product_with - @se_result.production_euro_product_without
       total_3 += @production_euro_kg_increment_impact       
       worksheet.write(26, 3, @production_euro_kg_increment_impact, format_num) 
       
       worksheet.write(27, 0, _('yield loss'), format_bold)  
       worksheet.write(27, 1, @se_result.yield_euro_product_without, format_num)
       total_1 += @se_result.yield_euro_product_without       
       worksheet.write(27, 2, @se_result.yield_euro_product_with, format_num)
       total_2 += @se_result.yield_euro_product_with       
       @yield_euro_kg_increment_impact = @se_result.yield_euro_product_with - @se_result.yield_euro_product_without
       total_3 += @yield_euro_kg_increment_impact       
       worksheet.write(27, 3, @yield_euro_kg_increment_impact, format_num) 

       worksheet.write(28, 0, _('yield loss'), format_bold)  
       worksheet.write(28, 1, @se_result.value_euro_product_without, format_num)   
       total_1 += @se_result.value_euro_product_without       
       worksheet.write(28, 2, @se_result.value_euro_product_with, format_num)
       total_2 += @se_result.value_euro_product_with       
       @value_euro_kg_increment_impact = @se_result.value_euro_product_with - @se_result.value_euro_product_without
       total_3 += @value_euro_kg_increment_impact  
       worksheet.write(28, 3, @value_euro_kg_increment_impact, format_num) 
       
       
       worksheet.write(29, 0, _('TOTAL'), format_bold)  
       worksheet.write(29, 1, total_1, format_num)
       worksheet.write(29, 2, total_2, format_num) 
       worksheet.write(29, 3, total_3, format_num)  
      
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
  
  
  
end
