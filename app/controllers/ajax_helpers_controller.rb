class AjaxHelpersController < ApplicationController

  # Helper Ajax functions used in views

  def index
    if params[:type] == "result_check"
       result_id = params[:id]
       isChecked = params[:isChecked]
       result = Result.find(result_id)
       if isChecked == 'true'
         result.check_graphic = true
       else  
         result.check_graphic = false
       end
       result.save
       respond_to do |format|
         format.json  { render :json => result }       
       end        
    end    
    
    if params[:type] == "mt_result_check"
       mt_result_id = params[:id]
       isChecked = params[:isChecked]
       mt_result = MtResult.find(mt_result_id)
       if isChecked == 'true'
         mt_result.check_graphic = true
       else  
         mt_result.check_graphic = false
       end
       mt_result.save
      respond_to do |format|
        format.json  { render :json => mt_result }       
      end        
    end
    
    
    if params[:type] == "st_result_check"
       st_result_id = params[:id]
       isChecked = params[:isChecked]
       st_result = StResult.find(st_result_id)
       if isChecked == 'true'
         st_result.check_graphic = true
       else  
         st_result.check_graphic = false
       end
       st_result.save
      respond_to do |format|
        format.json  { render :json => st_result }       
      end        
    end
    
    if params[:type] == "pc_coating_types_for_pcb_type"
      pcb_type = params[:id]
      result = Array.new
      pc_coating_types = PcCoatingType.all
      pc_coating_types.each do |pc_coating_type|
        if pcb_type != 'elastic' || pc_coating_type.name != 'HASL'
          result << pc_coating_type
        end
      end
      
      respond_to do |format|
        format.json  { render :json => result }       
      end      
    end

    ## Machine tools

    if params[:type] == "mt_supplier_part_datas_for_mt_product"
      mt_product = MtProduct.find(params[:id])
      respond_to do |format|
        format.json  { render :json => mt_product.mt_supplier_part_datas }       
      end
    end    

    if params[:type] == "unit_for_mt_manufacturing_process"
      mt_manufacturing_process = MtManufacturingProcess.find(params[:id])
      respond_to do |format|
        format.json  { render :json => mt_manufacturing_process.unit.to_json }       
      end
    end    
           
    if params[:type] == "unit_for_mt_energy_process"
      mt_energy_process = MtEnergyProcess.find(params[:id])
      respond_to do |format|
        format.json  { render :json => mt_energy_process.unit.to_json }       
      end
    end    
    
    if params[:type] == "mt_energy_processes_for_mt_energy_family"
      mt_energy_family = MtEnergyFamily.find(params[:id])
      respond_to do |format|
        format.json  { render :json => mt_energy_family.mt_energy_processes.sort_by{ |k| k['name'] } }
       end       
    end

    if params[:type] == "mt_materials_for_mt_family"
      mt_family = MtFamily.find(params[:id])
      if params[:general] == 'true'
         return_values = mt_family.mt_materials.select { |a| a.general == true }
      else
         return_values = mt_family.mt_materials
      end  
      
      respond_to do |format|
        format.json  { render :json => return_values }      
      end        
    end

    if params[:type] == "mt_materials_for_mt_family_rough"
      mt_family = MtFamily.find(params[:id])
      return_values = Array.new
      if mt_family.name != 'Other'        
        mt_family.mt_materials.each do |mt_material|
           if mt_material.name == 'Electric Motor' ||
              mt_material.name == 'Electronic control unit' ||
              mt_material.name == 'Foot and housing'  ||
              mt_material.name == 'Worktool holder'  ||
              mt_material.name == 'Worktool spindle'  ||
              mt_material.name == 'Workpiece holder'  ||
              mt_material.name == 'Workpiece spindle'  ||
              mt_material.name == 'Oil mist extraction system'  ||
              mt_material.name == 'Hydraulic power train' ||
              mt_material.name == 'Cooling and Lubrication unit' ||
              mt_material.name == 'Compressor'
              return_values << mt_material
           end   
        end
      else
        mt_family.mt_materials.each do |mt_material|
           return_values << mt_material
        end   
      end  
      respond_to do |format|
        format.json  { render :json => return_values }      
      end        
    end

    if params[:type] == "unit_for_mt_material"
      mt_material = MtMaterial.find(params[:id])
      respond_to do |format|
        format.json  { render :json => mt_material.unit.to_json }       
      end
    end

    ## Smart textiles

    if params[:type] == "unit_for_st_transport"
      st_transport = StTransport.find(params[:id])
      respond_to do |format|
        format.json  { render :json => st_transport.unit.to_json }       
      end
    end
        
    if params[:type] == "unit_for_st_packaging"
      st_packaging = StPackagingType.find(params[:id])
      respond_to do |format|
        format.json  { render :json => st_packaging.unit.to_json }       
      end
    end
        
        
    if params[:type] == "unit_for_st_process"
      st_process = StProcess.find(params[:id])
      respond_to do |format|
        format.json  { render :json => st_process.unit.to_json }       
      end
    end
        
        
    if params[:type] == "unit_for_st_energy_source"
      st_energy_source = StEnergySource.find(params[:id])
      respond_to do |format|
        format.json  { render :json => st_energy_source.st_energy_type.unit.to_json }       
      end
    end
               
    if params[:type] == "unit_for_st_material"
      st_material = StMaterial.find(params[:id])
      respond_to do |format|
        format.json  { render :json => st_material.unit.to_json }       
      end
    end
        
    if params[:type] == "st_transports_for_st_family_transports"
      st_family_transport = StFamilyTransport.find(params[:id])
      respond_to do |format|
        format.json  { render :json => st_family_transport.st_transports }      
      end        
    end
    
    if params[:type] == "st_processes_for_st_family_processes"
      st_family_process = StFamilyProcess.find(params[:id])
      respond_to do |format|
        format.json  { render :json => st_family_process.st_processes }      
      end        
    end
    
    if params[:type] == "st_energy_sources_for_st_energy_types"
      st_energy_type = StEnergyType.find(params[:id])
      respond_to do |format|
        format.json  { render :json => st_energy_type.st_energy_sources }      
      end        
    end
    
    if params[:type] == "st_materials_for_st_family"
      st_family = StFamily.find(params[:id])
      respond_to do |format|
        format.json  { render :json => st_family.st_materials }      
      end        
    end

    ## Sensors

    if params[:type] == "se_use_product_total_anual_amount"
      se_use_product = SeUseProduct.find(params[:se_use_product_id])

      respond_to do |format|
        format.json  { render :json => se_use_product.total_anual_output(params[:with_or_without]).round }      
      end  

    end

    if params[:type] == "se_use_product_update_product_output" 
      se_use_product = SeUseProduct.find(params[:se_use_product_id])
      output_with = params[:output_with]
      output_without = params[:output_without]
      
      if  is_numeric?(output_with)
        se_use_product.output_with = output_with 
      end

      if is_numeric?(output_without)
        se_use_product.output_without = output_without
      end

      
      if se_use_product.save
        respond_to do |format|
          format.json  { render :json => se_use_product }      
        end 
      end
      
    end  

    if params[:type] == "se_use_production_update_country"
      se_use_production = SeUseProduction.find(params[:se_use_production_id])
      se_use_production.se_country_info_id =  params[:country]

      if se_use_production.save
        respond_to do |format|
          format.json  { render :json => se_use_production }
        end
      end

    end

    if params[:type] == "se_use_production_facility_operation_time" 
      se_use_production = SeUseProduction.find(params[:se_use_production_id])
      mp = params[:maximum_production]
      cs = params[:closing_times]
      country = params[:country]

      if  is_numeric?(mp) && is_numeric?(cs)
        se_use_production.se_country_info_id = country
        se_use_production.maximum_production = mp
        se_use_production.closing_times = cs
        se_use_production.operation_time = mp.to_f - cs.to_f
        
        if se_use_production.save
          respond_to do |format|
            format.json  { render :json => se_use_production.operation_time }      
          end 
        end
      end
    end  
    

    if params[:type] == "se_use_production_total_downtime" 
      se_use_production = SeUseProduction.find(params[:se_use_production_id])

      respond_to do |format|
          format.json  { render :json => se_use_production.total_downtime(params[:with_or_without]) }      
       end 
    end  

    if params[:type] == "se_use_production_productiveTime" 
      se_use_production = SeUseProduction.find(params[:se_use_production_id])

      respond_to do |format|
          format.json  { render :json => se_use_production.productive_time(params[:with_or_without]) }      
       end 
    end  

    # Bio-plastics

    if params[:type] == 'bp_economical_flows_for_family'
       if params[:id] != 'null'
          economical_family = BpEconomicalFamily.find(params[:id])
       end   
       economical_phase = BpEconomicalPhase.find(params[:bp_phase_id])       
       bp_product = BpProduct.find(params[:bp_product_id])
       @materials = Array.new
       if economical_phase.name == 'Raw materials' &&  economical_family.name == 'Raw materials'
          bp_product.bp_material_datas.each do |bp_material_data|         
            if bp_material_data.bp_material
              @materials << bp_material_data.bp_material
            end  
          end
       end
       if economical_phase.name == 'Raw materials' &&  economical_family.name == 'Compounding materials and master-batch'
          bp_product.bp_compound_material_datas.each do |bp_compound_material_data|
            if bp_compound_material_data.bp_compound_material
              @materials << bp_compound_material_data.bp_compound_material
            end  
          end
            fakes = BpCompoundMaterial.find(:all, :conditions => ["based_type = 'fake_economic'"])
            fakes.each do |fake|
               @materials << fake
            end
        
       end
       if economical_phase.name == 'Transport'
          bp_product.bp_transport_to_converter_datas.each do |bp_transport_to_converter_data|
            if bp_transport_to_converter_data.bp_vehicle
              @materials << bp_transport_to_converter_data.bp_vehicle
            end  
          end
       end            
       if economical_phase.name == 'Processing' &&  economical_family.name == 'Processes'
          bp_product.bp_manufacturing_datas.each do |bp_manufacturing_data|
            if bp_manufacturing_data.bp_manufacturing_process
              @materials << bp_manufacturing_data.bp_manufacturing_process
            end  
          end
       end
       if economical_phase.name == 'Processing' &&  economical_family.name == 'Finishing'
          bp_product.bp_finishing_datas.each do |bp_finishing_data|
            if bp_finishing_data.bp_manufacturing_process
              @materials << bp_finishing_data.bp_manufacturing_process
            end  
          end
       end
       
       if economical_phase.name == 'Processing' &&  economical_family.name == 'Transport'
          bp_product.bp_manufacturing_transport_datas.each do |bp_manufacturing_transport_data|
            if bp_manufacturing_transport_data.bp_vehicle
              @materials << bp_manufacturing_transport_data.bp_vehicle
            end  
          end
       end
      
       if economical_phase.name == 'Distribution' &&  economical_family.name == 'Packaging'
           bp_packaging_datas = bp_product.bp_packaging_datas
           bp_packaging_datas.each do |bp_packaging_data|
              @materials <<  bp_packaging_data.bp_distribution_default_value             
           end
         
       end

       if economical_phase.name == 'Distribution' &&  economical_family.name == 'Transport'
           bp_product.bp_transport_to_customer_datas.each do |bp_transport_to_customer_data|
              if bp_transport_to_customer_data.bp_vehicle
                @materials << bp_transport_to_customer_data.bp_vehicle
              end  
           end   
       end
       
       
       respond_to do |format|
          format.json  { render :json => @materials }      
       end      
    end


    if params[:type] == 'bp_material'
     @bp_material = BpMaterial.where("id = ?", params[:id])
 
     respond_to do |format|
       format.json  { render :json => @bp_material }      
     end 
    end

    if params[:type] == 'bp_compound_material'
     @bp_compound_material = BpCompoundMaterial.where("id = ?", params[:id])

     respond_to do |format|
       format.json  { render :json => @bp_compound_material }      
     end 
    end      

    if params[:type]  == 'bp_compound_family_for_bp_compound_material'
      @bp_compound_materials = BpCompoundMaterial.where("bp_compound_family_id = ?",params[:bp_compound_family_id]).sort_by{ |k| k['name'] }

      respond_to do |format|
       format.json  { render :json => @bp_compound_materials }      
     end 
    end

    if params[:type]  == 'bp_vehicles_for_bp_model'
      @bp_vehicles = BpVehicle.where("bp_mode_id = ?", params[:bp_mode_id])

      respond_to do |format|
       format.json  { render :json => @bp_vehicles }      
     end 
    end

    if params[:type]  == 'bp_manufacturing_process_for_bp_material'
      
      @bp_manufacturing_processes = BpMaterial.find(params[:bp_material_id]).bp_manufacturing_processes.where("process_type = 'processing'").sort_by{ |k| k['name'] }
      
      respond_to do |format|
       format.json  { render :json => @bp_manufacturing_processes }      
     end 
    end

    # Other methods

    if params[:type] == 'time_mode_percentage'        
       @product = Product.find(params[:product_id])
       @energy_mode = EnergyMode.find(params[:id])
       total = 0
       return_value = 0
       @product.manufacturing_datas.each do |manufacturing_data|
         if manufacturing_data.material && manufacturing_data.material.family.name == 'Battery'

            logger.info "Family --> " + manufacturing_data.material.family.name
            total += manufacturing_data.quantity
            logger.info "Total --> " + total.to_s
         end
       end
       if @energy_mode.name == 'Power off'
         if total > 0
            return_value = 25
         else
            return_value = 45        
         end
       end
       if @energy_mode.name == 'Power sleep'
         if total > 0
            return_value = 35
         else
            return_value = 5
         end         
       end
       if @energy_mode.name == 'Power long idle'
         if total > 0
            return_value = 10
         else
            return_value = 15
         end         
       end
       if @energy_mode.name == 'Power short idle'
         if total > 0
            return_value = 30
         else
            return_value = 35
         end         
       end
       
       respond_to do |format|
          format.json  { render :json => return_value }      
       end  
    end        
    if params[:type] == 'unit_for_material_economic'
       return_value = 'kg'
       phase_id = params[:phase_id]
       family_id = params[:family_id]       
       family = EconomicalFamily.find(family_id)
       if family.name == 'Components'
         return_value = 'unit(s)'
       end
       if family.name == 'Reuse'
         return_value = 'unit(s)'
       end
       if family.name == 'Recycling'
         return_value = 'unit(s)'
       end
       if family.name == 'Materials'
         material = Material.find(params[:id])
         if material.family.name == 'Housing'
           return_value = 'kg'         
         else  
           return_value = 'unit(s)'
         end
       end  
       if family.name == 'Energy consumption'
           return_value = 'kWh'
       end
       if family.name == 'Repair&Maintenance'
         material = Material.find(params[:id])
         if material.family.name == 'Housing'
           return_value = 'kg'         
         else  
           return_value = 'unit(s)'
         end
       end
       respond_to do |format|
          format.json  { render :json => return_value.to_json }      
       end        
    end

    if params[:type] == 'unit_for_material'
       return_value = ''
       phase = params[:phase]
       if params[:id] && !params[:id].blank? && params[:id] != 'null'
         material = Material.find(params[:id])
       end
       if phase && phase == 'repair'
          return_value = 'unit(s)'
          if material && (material.name == 'DDR3 - 4GB' || material.name == 'DDR3 - 8GB' || material.name == 'SSD')
            return_value = 'unit(s)'
          end
       else          
          if material 
            return_value = material.unit
          else
            return_value = ''
          end
       end
       respond_to do |format|
          format.json  { render :json => return_value.to_json }      
       end  
    end

    if params[:type] == 'materials_for_family'
       family = Family.find(params[:id])
       @materials = family.materials
       respond_to do |format|
          format.json  { render :json => @materials }      
       end  
    end

    if params[:type] == 'families_for_module'
       data_module = DataModule.find(params[:id])
       substage = params[:substage]
       if substage && substage == 'Components'
          @families = Family.find(:all, :conditions => ["data_module_id = ? and stage = ? and name != 'Housing'", data_module.id, params[:stage]])
       else
          @families = Family.find(:all, :conditions => ["data_module_id = ? and stage = ?", data_module.id, params[:stage]])
       end  
       respond_to do |format|
          format.json  { render :json => @families }      
       end  
    end

    if params[:type] == 'vehicles_for_mode'
       data_mode = DataMode.find(params[:id])
       @vehicles = data_mode.vehicles
       respond_to do |format|
          format.json  { render :json => @vehicles }      
       end
    end

    if params[:type] == 'families_for_energy_mode'
       energy_mode = EnergyMode.find(params[:id])
       @families = energy_mode.families
       respond_to do |format|
          format.json  { render :json => @families }      
       end         
    end

    if params[:type] == 'energy_types_for_family'
       family = Family.find(params[:id])
       @energy_types = family.energy_types
       respond_to do |format|
          format.json  { render :json => @energy_types }      
       end      
    end

    if params[:type] == 'economical_families_for_phase'
       economical_phase = EconomicalPhase.find(params[:id])
       @economical_families = economical_phase.economical_families
       respond_to do |format|
          format.json  { render :json => @economical_families }      
       end      
    end

    if params[:type] == 'bp_economical_families_for_phase'
       bp_economical_phase = BpEconomicalPhase.find(params[:id])
       @bp_economical_families = bp_economical_phase.bp_economical_families
       respond_to do |format|
          format.json  { render :json => @bp_economical_families }      
       end      
    end

    if params[:type] == 'economical_flows_for_family'
       economical_family = EconomicalFamily.find(params[:id])
       economical_phase = EconomicalPhase.find(params[:phase_id])       
       product = Product.find(params[:product_id])
       @materials = Array.new
       if economical_phase.name == 'Materials' &&  economical_family.name == 'Materials'
          product.material_datas.each do |material_data|
            if material_data.material
              @materials << material_data.material
            end  
          end
       end
       if economical_phase.name == 'Materials' &&  economical_family.name == 'Components'
          product.component_datas.each do |component_data|
            if component_data.material
              @materials << component_data.material
            end  
          end
       end
       
       if economical_phase.name == 'Manufacturing' &&  economical_family.name == 'Manufacturing'
          product.manufacturing_datas.each do |manufacturing_data|
            if manufacturing_data.material
              @materials << manufacturing_data.material
            end  
          end
       end
       if economical_phase.name == 'Use' &&  economical_family.name == 'Energy consumption'
           energy_types = EnergyType.all
           energy_types.each do |energy_type|
              @materials << energy_type
           end   
       end
       
       if economical_family.name == 'Repair&Maintenance'
          product.repair_uses.each do |repair_use|
            if repair_use.material
              @materials << repair_use.material
            end  
          end
       end
       if economical_family.name == 'Reuse'
          product.reuse_end_of_lives.each do |reuse_end_of_life|
            if reuse_end_of_life.material
              @materials << reuse_end_of_life.material
            end  
          end
       end
       if economical_family.name == 'Recycling'
          product.recycling_end_of_lives.each do |recycling_end_of_life|
            if recycling_end_of_life.material
              @materials << recycling_end_of_life.material
            end  
          end
       end
       
       respond_to do |format|
          format.json  { render :json => @materials }      
       end      
    end

    ## Photovoltaic
    if params[:type] == 'country_co2'        
       country = PhCountryInfo.find(params[:id])   
       respond_to do |format|
          format.json  { render :json => country.co2.to_json }      
       end   
    end

    if params[:type] == 'module_efficiency'
       return_value = 14.4
       module_selected = PhModuleType.find(params[:id])  
       if module_selected.name != 'Not specified'
          return_value = module_selected.efficiency
       end
       respond_to do |format|
          format.json  { render :json => return_value.to_json }      
       end   
    end

    if params[:type] == 'module_lifetime'
       return_value = 30
       module_selected = PhModuleType.find(params[:id])
       if module_selected.name != 'Not specified'
          return_value = module_selected.lifetime
       end       
       respond_to do |format|
          format.json  { render :json => return_value.to_json }      
       end   
    end

    if params[:type] == 'co2_intermediate'
       return_value = 0
       country = PhCountryInfo.find(params[:id])   
       item = params[:item]

       return_value = country.co2
       if return_value == -1
          return_value = 0
       end

       respond_to do |format|
          format.json  { render :json => return_value.to_json }      
       end   
    end
  
 end



end