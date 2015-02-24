class MtResultsController < ApplicationController
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
    @mt_product = MtProduct.find(params[:id])
    @product = @mt_product.product
    
    @step = 1
    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @mt_product.product.name, edit_product_url(@mt_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, mt_production_init_path(@mt_product)
    add_breadcrumb _("Detailed results").html_safe, mt_result_url(@product.mt_product)


    @detailed = false
    if @mt_product.mt_assessment && @mt_product.mt_assessment.assessment_type == 'detailed'
      @detailed = true
    end
    
    if @detailed
       do_results_detailed
    else
       do_results
    end 
    
  end   


  def do_results_detailed  

    results_created = false
    results_to_delete = MtResult.find_all_by_mt_product_id(@mt_product.id)        
    results_to_delete.each do |result|
       result_values_to_delete = MtResultValue.find(:all, :conditions => ["mt_result_id = ?" , result.id])
       MtResultValue.delete(result_values_to_delete)
       if !result.has_checkbox
          result.delete
       end   
       results_created = true
    end

    if !results_created          
       root_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Total", :name_ca => "Total", :name_es => "Total", :parent_id => -1, :has_checkbox => true)
       root_result.save   
       
       ## MATERIALS
       materials_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "MATERIALS", :name_ca => "MATERIALS", :name_es => "MATERIALS", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
       materials_result.save

       materials_materials_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Components", :name_ca => "Components", :name_es => "Components", :parent_id => materials_result.id, :check_graphic => true, :has_checkbox => true)
       materials_materials_result.save

       materials_suppliers_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Supplier parts", :name_ca => "Supplier parts", :name_es => "Supplier parts", :parent_id => materials_result.id, :check_graphic => true, :has_checkbox => true)
       materials_suppliers_result.save

       ## MANUFACTURING
       manufacturing_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "MANUFACTURING", :name_ca => "MANUFACTURING", :name_es => "MANUFACTURING", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
       manufacturing_result.save

       manufacturing_process_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Process", :name_ca => "Process", :name_es => "Process", :parent_id => manufacturing_result.id, :check_graphic => true, :has_checkbox => true)
       manufacturing_process_result.save

       manufacturing_materials_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Energy", :name_ca => "Energy", :name_es => "Energy", :parent_id => manufacturing_result.id, :check_graphic => true, :has_checkbox => true)
       manufacturing_materials_result.save

       manufacturing_resource_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Resource", :name_ca => "Resource", :name_es => "Resource", :parent_id => manufacturing_result.id, :check_graphic => true, :has_checkbox => true)
       manufacturing_resource_result.save

       manufacturing_waste_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Waste", :name_ca => "Waste", :name_es => "Waste", :parent_id => manufacturing_result.id, :check_graphic => true, :has_checkbox => true)
       manufacturing_waste_result.save
       
       
       ## DISTRIBUTION
       distribution_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "DISTRIBUTION", :name_ca => "DISTRIBUTION", :name_es => "DISTRIBUTION", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
       distribution_result.save

       distribution_transport_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Transport", :name_ca => "Transport", :name_es => "Transport", :parent_id => distribution_result.id, :check_graphic => true, :has_checkbox => true)
       distribution_transport_result.save

       distribution_packaging_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Packaging", :name_ca => "Packaging", :name_es => "Packaging", :parent_id => distribution_result.id, :check_graphic => true, :has_checkbox => true)
       distribution_packaging_result.save

       ## USE
       use_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "USE", :name_ca => "USE", :name_es => "USE", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
       use_result.save
       
       use_additional_energy_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Additional energy flow", :name_ca => "Additional energy flow", :name_es => "Additional energy flow", :parent_id => use_result.id, :check_graphic => true, :has_checkbox => true)
       use_additional_energy_result.save
       
       use_operating_resources_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Operating resources", :name_ca => "Operating resources", :name_es => "Operating resources", :parent_id => use_result.id, :check_graphic => true, :has_checkbox => true)
       use_operating_resources_result.save
       
       use_shift_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => '', :name_ca => '', :name_es => '', :parent_id => use_result.id, :check_graphic => true, :shift => 1, :has_checkbox => true)
       use_shift_result.save
       
       ## END_OF_LIFE
       endoflife_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "END-OF-LIFE", :name_ca => "END-OF-LIFE", :name_es => "END-OF-LIFE", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
       endoflife_result.save

       endoflife_recycling_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Recycling", :name_ca => "Recycling", :name_es => "Recycling", :parent_id => endoflife_result.id, :check_graphic => true, :has_checkbox => true)
       endoflife_recycling_result.save

       endoflife_incineration_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Incineration", :name_ca => "Incineration", :name_es => "Incineration", :parent_id => endoflife_result.id, :check_graphic => true, :has_checkbox => true)
       endoflife_incineration_result.save

       endoflife_landfill_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Landfill", :name_ca => "Landfill", :name_es => "Landfill", :parent_id => endoflife_result.id, :check_graphic => true, :has_checkbox => true)
       endoflife_landfill_result.save       
       
     else
       root_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Total", -1)
       
       ## MATERIALS
       materials_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "MATERIALS", root_result.id)
       materials_materials_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Components", materials_result.id)
       materials_suppliers_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Supplier parts", materials_result.id)

       ## MANUFACTURING
       manufacturing_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "MANUFACTURING", root_result.id)
       manufacturing_process_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Process", manufacturing_result.id)
       manufacturing_materials_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Energy", manufacturing_result.id)
       manufacturing_resource_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Resource", manufacturing_result.id)
       manufacturing_waste_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Waste", manufacturing_result.id)

       ## DISTRIBUTION
       distribution_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "DISTRIBUTION", root_result.id)
       distribution_transport_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Transport", distribution_result.id)
       distribution_packaging_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Packaging", distribution_result.id)

       ## USE
       use_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "USE", root_result.id)     
       use_additional_energy_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Additional energy flow", use_result.id)
       use_operating_resources_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Operating resources", use_result.id)
       use_shift_result = MtResult.find_by_mt_product_id_and_shift_and_parent_id(@mt_product.id, 1, use_result.id)

       ## END_OF_LIFE
       endoflife_result =  MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "END-OF-LIFE", root_result.id)
       endoflife_recycling_result =  MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Recycling", endoflife_result.id)
       endoflife_incineration_result =  MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Incineration", endoflife_result.id)
       endoflife_landfill_result =  MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Landfill", endoflife_result.id)
     
     end  



       if @mt_product.mt_use.breakdown && @mt_product.mt_use.breakdown == 'shift1'
           name_1 = @mt_product.mt_use.description
           
           use_shift_result.name_en = name_1
           use_shift_result.name_ca = name_1
           use_shift_result.name_es = name_1                    
           use_shift_result.save
    
           use_standby1_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Standby", :name_ca => "Standby", :name_es => "Standby", :parent_id => use_shift_result.id, :check_graphic => true)
           use_standby1_result.save
                 
           use_ready1_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Ready for operation", :name_ca => "Ready for operation", :name_es => "Ready for operation", :parent_id => use_shift_result.id, :check_graphic => true)
           use_ready1_result.save
    
           use_processing1_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Processing", :name_ca => "Processing", :name_es => "Processing", :parent_id => use_shift_result.id, :check_graphic => true)
           use_processing1_result.save
       end
       
       if @mt_product.mt_use.breakdown && @mt_product.mt_use.breakdown == 'shift2'
           name_2 = @mt_product.mt_use.description_2
           
           use_shift_result.name_en = name_2
           use_shift_result.name_ca = name_2
           use_shift_result.name_es = name_2                    
           use_shift_result.save           
    
           use_standby2_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Standby", :name_ca => "Standby", :name_es => "Standby", :parent_id => use_shift_result.id, :check_graphic => true)
           use_standby2_result.save
                 
           use_ready2_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Ready for operation", :name_ca => "Ready for operation", :name_es => "Ready for operation", :parent_id => use_shift_result.id, :check_graphic => true)
           use_ready2_result.save
    
           use_processing2_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Processing", :name_ca => "Processing", :name_es => "Processing", :parent_id => use_shift_result.id, :check_graphic => true)
           use_processing2_result.save
       end
       
       if @mt_product.mt_use.breakdown && @mt_product.mt_use.breakdown == 'shift3'
           name_3 = @mt_product.mt_use.description_3
         
           use_shift_result.name_en = name_3
           use_shift_result.name_ca = name_3
           use_shift_result.name_es = name_3                    
           use_shift_result.save           
  
           use_standby3_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Standby", :name_ca => "Standby", :name_es => "Standby", :parent_id => use_shift_result.id, :check_graphic => true)
           use_standby3_result.save
                 
           use_ready3_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Ready for operation", :name_ca => "Ready for operation", :name_es => "Ready for operation", :parent_id => use_shift_result.id, :check_graphic => true)
           use_ready3_result.save
    
           use_processing3_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Processing", :name_ca => "Processing", :name_es => "Processing", :parent_id => use_shift_result.id, :check_graphic => true)
           use_processing3_result.save
       end
       

       use_additional_energy_standby_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Standby", :name_ca => "Standby", :name_es => "Standby", :parent_id => use_additional_energy_result.id, :check_graphic => true)
       use_additional_energy_standby_result.save

       use_additional_energy_ready_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Ready for operation", :name_ca => "Ready for operation", :name_es => "Ready for operation", :parent_id => use_additional_energy_result.id, :check_graphic => true)
       use_additional_energy_ready_result.save

       use_additional_energy_processing_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Processing", :name_ca => "Processing", :name_es => "Processing", :parent_id => use_additional_energy_result.id, :check_graphic => true)
       use_additional_energy_processing_result.save



       use_operating_resources_standby_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Standby", :name_ca => "Standby", :name_es => "Standby", :parent_id => use_operating_resources_result.id, :check_graphic => true)
       use_operating_resources_standby_result.save

       use_operating_resources_ready_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Ready for operation", :name_ca => "Ready for operation", :name_es => "Ready for operation", :parent_id => use_operating_resources_result.id, :check_graphic => true)
       use_operating_resources_ready_result.save

       use_operating_resources_processing_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Processing", :name_ca => "Processing", :name_es => "Processing", :parent_id => use_operating_resources_result.id, :check_graphic => true)
       use_operating_resources_processing_result.save

       if @product.indicators.size == 0
          indicators = Indicator.where("sector = 'machine'")
          indicators.each do |indicator|
             @product.indicators << indicator
          end   
          @product.save
       end
       @product.indicators.each do |indicator|
            total = 0
            materials = 0
            
            materials_materials = 0
            materials_suppliers = 0
            
            manufacturing = 0
            manufacturing_process = 0            
            manufacturing_materials = 0
            manufacturing_resources = 0
            manufacturing_waste = 0            
            
            distribution = 0
            distribution_transport = 0
            distribution_packaging = 0
            use = 0

            use_standby = 0
            use_ready = 0
            use_processing = 0
            use_shift_1 = 0
            use_shift_2 = 0
            use_shift_3 = 0            
            
            use_additional_energy = 0
            use_operating_resources = 0            
            use_machine_subsystems = 0            
            
            endoflife = 0
            endoflife_recycling = 0
            endoflife_landfill = 0
            endoflife_incineration = 0
            
            #MATERIALS
            components = Hash.new
            suppliers_predefined = Hash.new
            suppliers_user = Hash.new
            
            @mt_product.mt_material_datas.each do |mt_material_data| 
               excel_value = get_mt_excel_value(indicator, mt_material_data.mt_material.name, "MATERIALS")
               value = mt_material_data.quantity * excel_value
               materials += value
               materials_materials += value
               if mt_material_data.scenario == 'recycling'
                  endoflife_recycling += mt_material_data.mt_material.recycling * mt_material_data.quantity
               end   
               if mt_material_data.scenario == 'landfill'
                  endoflife_landfill += mt_material_data.mt_material.landfill * mt_material_data.quantity
               end   
               if mt_material_data.scenario == 'incineration'
                  endoflife_incineration += mt_material_data.mt_material.incineration * mt_material_data.quantity               
              end
              if components.has_key?(mt_material_data.module)
                components[mt_material_data.module] += value
              else 
                components[mt_material_data.module] = value
              end
            end

            components.keys.each do |key|
               tmp_result_component = MtResult.new(:mt_product_id => @mt_product.id, :name_en => key, :name_ca => key, :name_es => key, :parent_id => materials_materials_result.id, :check_graphic => true)
               tmp_result_component.save
               MtResultValue.create(:mt_result_id => tmp_result_component.id, :indicator_id => indicator.id, :value => components[key], :percentage => 0)
               materials_component = MtMaterialData.find(:all, :conditions => ["module = ? and mt_product_id = ?", key, @mt_product.id])
               materials_component.each do |material_component|
                 excel_value = get_mt_excel_value(indicator, material_component.mt_material.name, "MATERIALS")
                 value = material_component.quantity * excel_value
                 tmp_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => material_component.mt_material.name, :name_ca => material_component.mt_material.name, :name_es => material_component.mt_material.name, :parent_id => tmp_result_component.id, :check_graphic => true)
                 tmp_result.save
                 MtResultValue.create(:mt_result_id => tmp_result.id, :indicator_id => indicator.id, :value => value, :percentage => 0)
                 
               end
            end

            @mt_product.mt_predefined_supplier_datas.each do |mt_predefined_supplier_data|  
               excel_value = get_mt_excel_value(indicator, mt_predefined_supplier_data.mt_material.name, "MATERIALS")
               excel_value_transport = get_mt_excel_value(indicator, mt_predefined_supplier_data.mt_transport_type.name , "DISTRIBUTION")
               value = mt_predefined_supplier_data.quantity * excel_value
               if !mt_predefined_supplier_data.quantity.blank? && !mt_predefined_supplier_data.distance.blank?
                 value += ((mt_predefined_supplier_data.quantity * mt_predefined_supplier_data.distance) / 1000) * excel_value_transport 
               end
               materials += value
               materials_suppliers += value
               if mt_predefined_supplier_data.scenario == 'recycling'
                  endoflife_recycling += mt_predefined_supplier_data.mt_material.recycling * mt_predefined_supplier_data.quantity
               end   
               if mt_predefined_supplier_data.scenario == 'landfill'
                  endoflife_landfill += mt_predefined_supplier_data.mt_material.landfill * mt_predefined_supplier_data.quantity
               end   
               if mt_predefined_supplier_data.scenario == 'incineration'
                  endoflife_incineration += mt_predefined_supplier_data.mt_material.incineration * mt_predefined_supplier_data.quantity
               end   
               
              if suppliers_predefined.has_key?(mt_predefined_supplier_data.mt_family.id)
                suppliers_predefined[mt_predefined_supplier_data.mt_family.id] += value
              else 
                suppliers_predefined[mt_predefined_supplier_data.mt_family.id] = value
              end               
            end
     
           @mt_product.mt_user_supplier_datas.each do |mt_user_supplier_data|  
               excel_value = get_mt_excel_value(indicator, mt_user_supplier_data.mt_material.name, "MATERIALS")
               if mt_user_supplier_data.mt_manufacturing_process
                  excel_value_process = get_mt_excel_value(indicator, mt_user_supplier_data.mt_manufacturing_process.name, "MATERIALS")
               else
                  excel_value_process = 0
               end  
               value = mt_user_supplier_data.quantity * excel_value
               value += mt_user_supplier_data.value * excel_value_process
               
               if mt_user_supplier_data.mt_supplier_part_data
                  transport_name = mt_user_supplier_data.mt_supplier_part_data.mt_transport_type.name
                  distance = mt_user_supplier_data.mt_supplier_part_data.distance
                  excel_value_transport = get_mt_excel_value(indicator, transport_name, "DISTRIBUTION")
                  value += distance * (mt_user_supplier_data.quantity / 1000) * excel_value_transport
               end
               materials += value
               materials_suppliers += value
               
               if mt_user_supplier_data.scenario == 'recycling'               
                  endoflife_recycling += mt_user_supplier_data.mt_material.recycling * mt_user_supplier_data.quantity
               end   
               if mt_user_supplier_data.scenario == 'landfill'               
                  endoflife_landfill += mt_user_supplier_data.mt_material.landfill * mt_user_supplier_data.quantity
               end   
               if mt_user_supplier_data.scenario == 'incineration'               
                  endoflife_incineration += mt_user_supplier_data.mt_material.incineration * mt_user_supplier_data.quantity
               end   
               
               if suppliers_user.has_key?(mt_user_supplier_data.mt_supplier_part_data.id)
                 suppliers_user[mt_user_supplier_data.mt_supplier_part_data.id] += value
               else
                 suppliers_user[mt_user_supplier_data.mt_supplier_part_data.id] = value
               end               
            end
     
     
            suppliers_predefined.keys.each do |key|
               mt_family = MtFamily.find(key)
               tmp_result_supplier = MtResult.new(:mt_product_id => @mt_product.id, :name_en => mt_family.name, :name_ca => mt_family.name, :name_es => mt_family.name, :parent_id => materials_suppliers_result.id, :check_graphic => true)
               tmp_result_supplier.save
               MtResultValue.create(:mt_result_id => tmp_result_supplier.id, :indicator_id => indicator.id, :value => suppliers_predefined[key], :percentage => 0)
               materials_supplier = MtPredefinedSupplierData.find(:all, :conditions => ["mt_family_id = ? and mt_product_id = ?", key, @mt_product.id])
               materials_supplier.each do |material_supplier|
                 excel_value = get_mt_excel_value(indicator, material_supplier.mt_material.name, "MATERIALS")
                 excel_value_transport = get_mt_excel_value(indicator, material_supplier.mt_transport_type.name , "DISTRIBUTION")
                 value = material_supplier.quantity * excel_value
                 if !material_supplier.quantity.blank? && !material_supplier.distance.blank?
                   value += ((material_supplier.quantity * material_supplier.distance) / 1000) * excel_value_transport 
                 end       

                 tmp_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en =>  material_supplier.mt_material.name, :name_ca =>  material_supplier.mt_material.name, :name_es => material_supplier.mt_material.name, :parent_id => tmp_result_supplier.id, :check_graphic => true)
                 tmp_result.save
                 MtResultValue.create(:mt_result_id => tmp_result.id, :indicator_id => indicator.id, :value => value, :percentage => 0)
                 
               end
            end
     
            suppliers_user.keys.each do |key|   
               mt_supplier_part_data = MtSupplierPartData.find(key)
               tmp_result_supplier = MtResult.new(:mt_product_id => @mt_product.id, :name_en => mt_supplier_part_data.name, :name_ca => mt_supplier_part_data.name, :name_es => mt_supplier_part_data.name, :parent_id => materials_suppliers_result.id, :check_graphic => true)
               tmp_result_supplier.save
               MtResultValue.create(:mt_result_id => tmp_result_supplier.id, :indicator_id => indicator.id, :value => suppliers_user[key], :percentage => 0)
               materials_supplier = MtUserSupplierData.find(:all, :conditions => ["mt_supplier_part_data_id = ? and mt_product_id = ?", key, @mt_product.id])
               materials_supplier.each do |material_supplier|
                 excel_value = get_mt_excel_value(indicator, material_supplier.mt_material.name, "MATERIALS")
                 if material_supplier.mt_manufacturing_process
                    excel_value_process = get_mt_excel_value(indicator, material_supplier.mt_manufacturing_process.name, "MATERIALS")
                 else 
                    excel_value_process = 0
                 end  
                 value = material_supplier.quantity * excel_value
                 value += material_supplier.value * excel_value_process   
                 
                 tmp_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en =>  material_supplier.mt_material.name, :name_ca =>  material_supplier.mt_material.name, :name_es => material_supplier.mt_material.name, :parent_id => tmp_result_supplier.id, :check_graphic => true)
                 tmp_result.save
                 MtResultValue.create(:mt_result_id => tmp_result.id, :indicator_id => indicator.id, :value => value, :percentage => 0)
                 
               end
            end
     
     
     
     
     
     
            # MANUFACTURING   




            # Manufacturing -> Process
            @mt_product.mt_manufacturing_main_datas.each do |mt_manufacturing_main_data| 
               excel_value = get_mt_excel_value(indicator, mt_manufacturing_main_data.mt_manufacturing_process.name, "MANUFACTURING")
               value = mt_manufacturing_main_data.quantity * excel_value
               manufacturing += value
               manufacturing_process += value
               tmp_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => mt_manufacturing_main_data.mt_manufacturing_process.name, :name_ca => mt_manufacturing_main_data.mt_manufacturing_process.name, :name_es => mt_manufacturing_main_data.mt_manufacturing_process.name, :parent_id => manufacturing_process_result.id, :check_graphic => true)
               tmp_result.save
               MtResultValue.create(:mt_result_id => tmp_result.id, :indicator_id => indicator.id, :value => value, :percentage => 0)
            end
            # Manufacturing -> Energy
            @mt_product.mt_energy_datas.each do |mt_energy_data| 
               excel_value = get_mt_excel_value(indicator, mt_energy_data.mt_energy_process.name, "MATERIALS")
               value = mt_energy_data.quantity * excel_value
               manufacturing += value
               manufacturing_materials += value
               tmp_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => mt_energy_data.mt_energy_process.name, :name_ca => mt_energy_data.mt_energy_process.name, :name_es => mt_energy_data.mt_energy_process.name, :parent_id => manufacturing_materials_result.id, :check_graphic => true)
               tmp_result.save
               MtResultValue.create(:mt_result_id => tmp_result.id, :indicator_id => indicator.id, :value => value, :percentage => 0)
            end
      
            @mt_product.mt_overhead_energy_datas.each do |mt_overhead_energy_data| 
               excel_value = get_mt_excel_value(indicator, mt_overhead_energy_data.mt_energy_process.name, "MATERIALS")
               value = mt_overhead_energy_data.quantity * excel_value
               manufacturing += value
               manufacturing_materials += value
               tmp_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => mt_overhead_energy_data.mt_energy_process.name, :name_ca => mt_overhead_energy_data.mt_energy_process.name, :name_es => mt_overhead_energy_data.mt_energy_process.name, :parent_id => manufacturing_materials_result.id, :check_graphic => true)
               tmp_result.save
               MtResultValue.create(:mt_result_id => tmp_result.id, :indicator_id => indicator.id, :value => value, :percentage => 0)
            end
      
            # Manufacturing -> Resources
            @mt_product.mt_manufacturing_resource_datas.each do |mt_manufacturing_resource_data| 
               excel_value = get_mt_excel_value(indicator, mt_manufacturing_resource_data.mt_consumable.name, "USE")
               value = mt_manufacturing_resource_data.quantity * excel_value
               manufacturing += value
               manufacturing_resources += value
               tmp_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => mt_manufacturing_resource_data.mt_consumable.name, :name_ca => mt_manufacturing_resource_data.mt_consumable.name, :name_es => mt_manufacturing_resource_data.mt_consumable.name, :parent_id => manufacturing_resource_result.id, :check_graphic => true)
               tmp_result.save
               MtResultValue.create(:mt_result_id => tmp_result.id, :indicator_id => indicator.id, :value => value, :percentage => 0)
            end
            
            # Manufacturing -> Waste
            @mt_product.mt_waste_energy_datas.each do |mt_waste_energy_data| 
         #      excel_value = get_mt_excel_value(indicator, mt_waste_energy_data.mt_material.name, "MANUFACTURING")
               # AVERAGE MATERIALS -> Excel
               excel_value = 72
               value = mt_waste_energy_data.quantity * excel_value
               manufacturing += value
               manufacturing_waste += value
               tmp_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => mt_waste_energy_data.mt_material.name, :name_ca => mt_waste_energy_data.mt_material.name, :name_es => mt_waste_energy_data.mt_material.name, :parent_id => manufacturing_waste_result.id, :check_graphic => true)
               tmp_result.save
               MtResultValue.create(:mt_result_id => tmp_result.id, :indicator_id => indicator.id, :value => value, :percentage => 0)
            end
            
            
            # DISTRIBUTION
            # Distribution -> Transport
            
            tmp_value = 0
            if @mt_product.mt_assessment
               tmp_value = @mt_product.mt_assessment.weight
            end   
            @mt_product.mt_distribution_packaging_datas.each do |mt_distribution_packaging_data|
               tmp_value += mt_distribution_packaging_data.quantity
            end
            tmp_value = tmp_value / 1000
            
            @mt_product.mt_distribution_transport_datas.each do |mt_distribution_transport_data|
               excel_value_transport = get_mt_excel_value(indicator, mt_distribution_transport_data.mt_transport_type.name , "DISTRIBUTION")
               value = mt_distribution_transport_data.distance * excel_value_transport * tmp_value
               distribution += value
               distribution_transport += value
               tmp_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => mt_distribution_transport_data.mt_transport_type.name, :name_ca => mt_distribution_transport_data.mt_transport_type.name, :name_es => mt_distribution_transport_data.mt_transport_type.name, :parent_id => distribution_transport_result.id, :check_graphic => true)
               tmp_result.save
               MtResultValue.create(:mt_result_id => tmp_result.id, :indicator_id => indicator.id, :value => value, :percentage => 0)
            end
            

            @mt_product.mt_distribution_packaging_datas.each do |mt_distribution_packaging_data|
               excel_value_packaging = get_mt_excel_value(indicator, mt_distribution_packaging_data.mt_material.name , "MATERIALS")
               if excel_value_packaging == 0
                  excel_value_packaging = get_mt_excel_value(indicator, mt_distribution_packaging_data.mt_material.name , "DISTRIBUTION")
               end              
               value = mt_distribution_packaging_data.quantity
               if mt_distribution_packaging_data.scenario == 'recycling'
                  value = value * (mt_distribution_packaging_data.mt_material.recycling + excel_value_packaging)
               end
               if mt_distribution_packaging_data.scenario == 'incineration'
                  value = value * (mt_distribution_packaging_data.mt_material.incineration + excel_value_packaging)
               end
               if mt_distribution_packaging_data.scenario == 'landfill'
                  value = value * (mt_distribution_packaging_data.mt_material.landfill + excel_value_packaging)
               end
               distribution += value
               distribution_packaging += value
               tmp_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => mt_distribution_packaging_data.mt_material.name, :name_ca => mt_distribution_packaging_data.mt_material.name, :name_es => mt_distribution_packaging_data.mt_material.name, :parent_id => distribution_packaging_result.id, :check_graphic => true)
               tmp_result.save
               MtResultValue.create(:mt_result_id => tmp_result.id, :indicator_id => indicator.id, :value => value, :percentage => 0)
            end
            
            
            
            # USE 
            lifetime = 0
            if @mt_product.mt_assessment
               lifetime = @mt_product.mt_assessment.lifetime
            end
            
            excel_value_process_pre = get_mt_excel_value(indicator, @mt_product.mt_use.mt_energy_process.name, "MATERIALS")
            # Ticket 382 --> kWh
            excel_value_process = 1
            tmp_processing = @mt_product.mt_use.processing * lifetime * excel_value_process            
            tmp_ready = @mt_product.mt_use.ready * lifetime * excel_value_process            
            tmp_standby = @mt_product.mt_use.standby * lifetime * excel_value_process            
            logger.info "tmp_processing --> " + tmp_processing.to_s
            logger.info "tmp_ready --> " + tmp_ready.to_s
            logger.info "tmp_standby --> " + tmp_standby.to_s            
            
            
            # Use -> Shift 1
            @use_shift_1_processing = tmp_processing * @mt_product.mt_use.working_days * @mt_product.mt_use.hours_shift_processing
            @use_shift_1_ready = tmp_ready * @mt_product.mt_use.working_days * @mt_product.mt_use.hours_shift_ready
            @use_shift_1_standby = tmp_standby * @mt_product.mt_use.working_days * @mt_product.mt_use.hours_shift_standby           

            
            @shift_1 = @use_shift_1_processing + @use_shift_1_ready + @use_shift_1_standby

            if @mt_product.mt_use.breakdown && @mt_product.mt_use.breakdown == 'shift1'            
              MtResultValue.create(:mt_result_id => use_processing1_result.id, :indicator_id => indicator.id, :value => @use_shift_1_processing * excel_value_process_pre, :percentage => 0)
              MtResultValue.create(:mt_result_id => use_ready1_result.id, :indicator_id => indicator.id, :value => @use_shift_1_ready * excel_value_process_pre, :percentage => 0)
              MtResultValue.create(:mt_result_id => use_standby1_result.id, :indicator_id => indicator.id, :value => @use_shift_1_standby * excel_value_process_pre, :percentage => 0)
              MtResultValue.create(:mt_result_id => use_shift_result.id, :indicator_id => indicator.id, :value => @shift_1 * excel_value_process_pre, :percentage => 0)
              use += @shift_1 * excel_value_process_pre
            end                        
                        
            # Use -> Shift 2            
            @use_shift_2_processing = tmp_processing * @mt_product.mt_use.working_days_2 * @mt_product.mt_use.hours_shift_processing_2
            @use_shift_2_ready = tmp_ready * @mt_product.mt_use.working_days_2 * @mt_product.mt_use.hours_shift_ready_2            
            @use_shift_2_standby = tmp_standby * @mt_product.mt_use.working_days_2 * @mt_product.mt_use.hours_shift_standby_2



            @shift_2 = @use_shift_2_processing + @use_shift_2_ready + @use_shift_2_standby
            
            if @mt_product.mt_use.breakdown && @mt_product.mt_use.breakdown == 'shift2'
              MtResultValue.create(:mt_result_id => use_processing2_result.id, :indicator_id => indicator.id, :value => @use_shift_2_processing * excel_value_process_pre, :percentage => 0)
              MtResultValue.create(:mt_result_id => use_ready2_result.id, :indicator_id => indicator.id, :value => @use_shift_2_ready * excel_value_process_pre, :percentage => 0)
              MtResultValue.create(:mt_result_id => use_standby2_result.id, :indicator_id => indicator.id, :value => @use_shift_2_standby * excel_value_process_pre, :percentage => 0)
              MtResultValue.create(:mt_result_id => use_shift_result.id, :indicator_id => indicator.id, :value => @shift_2 * excel_value_process_pre, :percentage => 0)
              use += @shift_2 * excel_value_process_pre
            end           
            
            # Use -> Shift 3
            @use_shift_3_processing = tmp_processing * @mt_product.mt_use.working_days_3 * @mt_product.mt_use.hours_shift_processing_3                        
            @use_shift_3_ready = tmp_ready * @mt_product.mt_use.working_days_3 * @mt_product.mt_use.hours_shift_ready_3            
            @use_shift_3_standby = tmp_standby * @mt_product.mt_use.working_days_3 * @mt_product.mt_use.hours_shift_standby_3            
            
            @shift_3 = @use_shift_3_processing + @use_shift_3_ready + @use_shift_3_standby
            
            if @mt_product.mt_use.breakdown && @mt_product.mt_use.breakdown == 'shift3'
              MtResultValue.create(:mt_result_id => use_processing3_result.id, :indicator_id => indicator.id, :value => @use_shift_3_processing * excel_value_process_pre, :percentage => 0)
              MtResultValue.create(:mt_result_id => use_ready3_result.id, :indicator_id => indicator.id, :value => @use_shift_3_ready * excel_value_process_pre, :percentage => 0)
              MtResultValue.create(:mt_result_id => use_standby3_result.id, :indicator_id => indicator.id, :value => @use_shift_3_standby * excel_value_process_pre, :percentage => 0)
              MtResultValue.create(:mt_result_id => use_shift_result.id, :indicator_id => indicator.id, :value => @shift_3 * excel_value_process_pre, :percentage => 0)
              use += @shift_3 * excel_value_process_pre
            end
                        
                        
            tmp_shifts = 0
            tmp_shifts_processing = 0 
            tmp_shifts_ready = 0
            tmp_shifts_standby = 0            
            
            if @mt_product.mt_use.breakdown && @mt_product.mt_use.breakdown == 'shift1'
               tmp_shifts = @mt_product.mt_use.working_days
               tmp_shifts_processing = @mt_product.mt_use.hours_shift_processing 
               tmp_shifts_ready = @mt_product.mt_use.hours_shift_ready
               tmp_shifts_standby = @mt_product.mt_use.hours_shift_standby               
            end   
            if @mt_product.mt_use.breakdown && @mt_product.mt_use.breakdown == 'shift2'
               tmp_shifts = @mt_product.mt_use.working_days_2
               tmp_shifts_processing = @mt_product.mt_use.hours_shift_processing_2 
               tmp_shifts_ready = @mt_product.mt_use.hours_shift_ready_2
               tmp_shifts_standby = @mt_product.mt_use.hours_shift_standby_2               
            end   
            if @mt_product.mt_use.breakdown && @mt_product.mt_use.breakdown == 'shift3'
               tmp_shifts = @mt_product.mt_use.working_days_3
               tmp_shifts_processing = @mt_product.mt_use.hours_shift_processing_3 
               tmp_shifts_ready = @mt_product.mt_use.hours_shift_ready_3
               tmp_shifts_standby = @mt_product.mt_use.hours_shift_standby_3               
            end   
            logger.info "tmp_shifts" + tmp_shifts.to_s
                        
            value_processing = 0
            value_ready = 0
            value_standby = 0
            @mt_product.mt_use_additional_energy_datas.each do |mt_use_additional_energy_data|
               excel_value_process = get_mt_excel_value(indicator, mt_use_additional_energy_data.mt_energy_process.name , "MATERIALS")
               logger.info "excel_value_process --> " + excel_value_process.to_s
               value_processing += mt_use_additional_energy_data.processing * lifetime * tmp_shifts * excel_value_process * tmp_shifts_processing
               logger.info "value_processing --> " + (mt_use_additional_energy_data.processing * lifetime * tmp_shifts * excel_value_process * tmp_shifts_processing).to_s              
               value_ready += mt_use_additional_energy_data.ready * lifetime * tmp_shifts * excel_value_process * tmp_shifts_ready
               logger.info "value_ready --> " + (mt_use_additional_energy_data.ready * lifetime * tmp_shifts * excel_value_process * tmp_shifts_ready).to_s               
               value_standby += mt_use_additional_energy_data.standby * lifetime * tmp_shifts * excel_value_process * tmp_shifts_standby
               logger.info "value_standby --> " + (mt_use_additional_energy_data.standby * lifetime * tmp_shifts * excel_value_process * tmp_shifts_standby).to_s               
            end
            
            excel_value_process_pre_1 = 1
            MtResultValue.create(:mt_result_id => use_additional_energy_processing_result.id, :indicator_id => indicator.id, :value => value_processing * excel_value_process_pre_1, :percentage => 0)
            MtResultValue.create(:mt_result_id => use_additional_energy_ready_result.id, :indicator_id => indicator.id, :value => value_ready * excel_value_process_pre_1, :percentage => 0)
            MtResultValue.create(:mt_result_id => use_additional_energy_standby_result.id, :indicator_id => indicator.id, :value => value_standby * excel_value_process_pre_1, :percentage => 0)
            use_additional_energy = value_processing + value_ready + value_standby
            MtResultValue.create(:mt_result_id => use_additional_energy_result.id, :indicator_id => indicator.id, :value => use_additional_energy * excel_value_process_pre_1, :percentage => 0)
            use += use_additional_energy * excel_value_process_pre_1
            
            tmp_val_1 = @mt_product.mt_use.hours_shift_processing + @mt_product.mt_use.hours_shift_ready + @mt_product.mt_use.hours_shift_standby
            tmp_val_2 = (@mt_product.mt_use.hours_shift_processing * @mt_product.mt_use.processing * @mt_product.mt_use.working_days * lifetime) + (@mt_product.mt_use.hours_shift_ready * @mt_product.mt_use.ready * @mt_product.mt_use.working_days * lifetime) + (@mt_product.mt_use.hours_shift_standby * @mt_product.mt_use.standby* @mt_product.mt_use.working_days * lifetime)
            tmp_val_3 = @mt_product.mt_use.parts_produced * @mt_product.mt_use.hours_shift_processing * @mt_product.mt_use.working_days * lifetime


            if tmp_val_1 !=0 && tmp_val_2 != 0 && @mt_product.mt_use.parts_produced != 0
               @energy_production_ratio = ((tmp_val_2 / tmp_val_3).to_f)
            else
               @energy_production_ratio = 0
            end  

            tmp_val_1 = @mt_product.mt_use.hours_shift_processing_2 + @mt_product.mt_use.hours_shift_ready_2 + @mt_product.mt_use.hours_shift_standby_2
            tmp_val_2 = (@mt_product.mt_use.hours_shift_processing_2 * @mt_product.mt_use.processing * @mt_product.mt_use.working_days_2 * lifetime) + (@mt_product.mt_use.hours_shift_ready_2 * @mt_product.mt_use.ready * @mt_product.mt_use.working_days_2 * lifetime) + (@mt_product.mt_use.hours_shift_standby_2 * @mt_product.mt_use.standby* @mt_product.mt_use.working_days_2 * lifetime)
            tmp_val_3 = @mt_product.mt_use.parts_produced_2 * @mt_product.mt_use.hours_shift_processing_2 * @mt_product.mt_use.working_days_2 * lifetime

            if tmp_val_1 !=0 && tmp_val_2 != 0 && @mt_product.mt_use.parts_produced_2 != 0
               @energy_production_ratio_2 = ((tmp_val_2 / tmp_val_3).to_f)
            else
               @energy_production_ratio_2 = 0
            end  

            tmp_val_1 = @mt_product.mt_use.hours_shift_processing_3 + @mt_product.mt_use.hours_shift_ready_3 + @mt_product.mt_use.hours_shift_standby_3
            #tmp_val_2 = (@mt_product.mt_use.hours_shift_processing_3 * @mt_product.mt_use.processing) + (@mt_product.mt_use.hours_shift_ready_3 * @mt_product.mt_use.ready) + (@mt_product.mt_use.hours_shift_standby_3 * @mt_product.mt_use.standby)
            tmp_val_2 = (@mt_product.mt_use.hours_shift_processing_3 * @mt_product.mt_use.processing * @mt_product.mt_use.working_days_3 * lifetime) + (@mt_product.mt_use.hours_shift_ready_3 * @mt_product.mt_use.ready * @mt_product.mt_use.working_days_3 * lifetime) + (@mt_product.mt_use.hours_shift_standby_3 * @mt_product.mt_use.standby* @mt_product.mt_use.working_days_3 * lifetime)
            tmp_val_3 = @mt_product.mt_use.parts_produced_3 * @mt_product.mt_use.hours_shift_processing_3 * @mt_product.mt_use.working_days_3 * lifetime
            if tmp_val_1 !=0 && tmp_val_2 != 0 && @mt_product.mt_use.parts_produced_3 != 0
               @energy_production_ratio_3 = ((tmp_val_2 / tmp_val_3).to_f)
            else
               @energy_production_ratio_3 = 0
            end  
            
            
            value_processing = 0
            value_ready = 0
            value_standby = 0            
            @mt_product.mt_use_operating_resource_datas.each do |mt_use_operating_resource_data|
               excel_value_consumable = get_mt_excel_value(indicator, mt_use_operating_resource_data.mt_consumable.name , "USE")
               value_processing += mt_use_operating_resource_data.processing * lifetime * tmp_shifts * excel_value_consumable * tmp_shifts_processing
               value_ready += mt_use_operating_resource_data.ready * lifetime * tmp_shifts * excel_value_consumable * tmp_shifts_ready
               value_standby += mt_use_operating_resource_data.standby * lifetime * tmp_shifts * excel_value_consumable * tmp_shifts_standby
            end            
            
            MtResultValue.create(:mt_result_id => use_operating_resources_processing_result.id, :indicator_id => indicator.id, :value => value_processing, :percentage => 0)
            MtResultValue.create(:mt_result_id => use_operating_resources_ready_result.id, :indicator_id => indicator.id, :value => value_ready, :percentage => 0)
            MtResultValue.create(:mt_result_id => use_operating_resources_standby_result.id, :indicator_id => indicator.id, :value => value_standby, :percentage => 0)
            use_operating_resources = value_processing + value_ready + value_standby
            MtResultValue.create(:mt_result_id => use_operating_resources_result.id, :indicator_id => indicator.id, :value => use_operating_resources, :percentage => 0)
            use += use_operating_resources
            

            
            value_processing = 0
            value_ready = 0
            value_standby = 0        
            excel_value_process = get_mt_excel_value(indicator, @mt_product.mt_use.mt_energy_process.name, "MATERIALS")            
            
 
            @mt_product.mt_use_machine_subsystem_datas.each do |mt_use_machine_subsystem_data|
               value_processing +=  mt_use_machine_subsystem_data.processing * lifetime * tmp_shifts * excel_value_process * tmp_shifts_processing
               value_ready += mt_use_machine_subsystem_data.ready * lifetime * tmp_shifts * excel_value_process * tmp_shifts_ready
               value_standby += mt_use_machine_subsystem_data.standby * lifetime * tmp_shifts * excel_value_process * tmp_shifts_standby
            end            
            

            # END OF LIFE
            
            MtResultValue.create(:mt_result_id => endoflife_recycling_result.id, :indicator_id => indicator.id, :value => endoflife_recycling, :percentage => 0)
            MtResultValue.create(:mt_result_id => endoflife_incineration_result.id, :indicator_id => indicator.id, :value => endoflife_incineration, :percentage => 0)
            MtResultValue.create(:mt_result_id => endoflife_landfill_result.id, :indicator_id => indicator.id, :value => endoflife_landfill, :percentage => 0)            
            
            endoflife = endoflife_recycling + endoflife_incineration + endoflife_landfill
            
            MtResultValue.create(:mt_result_id => endoflife_result.id, :indicator_id => indicator.id, :value => endoflife, :percentage => (total != 0)?((endoflife / total) * 100):0)
            
            total = materials + manufacturing + distribution + use + endoflife
            
            MtResultValue.create(:mt_result_id => root_result.id, :indicator_id => indicator.id, :value => total, :percentage => (total != 0)?((total / total) * 100):0)
            MtResultValue.create(:mt_result_id => materials_result.id, :indicator_id => indicator.id, :value => materials, :percentage => (total != 0)?((materials / total) * 100):0)
            MtResultValue.create(:mt_result_id => materials_materials_result.id, :indicator_id => indicator.id, :value => materials_materials, :percentage => (total != 0)?((materials_materials / total) * 100):0)
            MtResultValue.create(:mt_result_id => materials_suppliers_result.id, :indicator_id => indicator.id, :value => materials_suppliers, :percentage => (total != 0)?((materials_suppliers / total) * 100):0)            
            
            
            MtResultValue.create(:mt_result_id => manufacturing_result.id, :indicator_id => indicator.id, :value => manufacturing, :percentage => (total != 0)?((manufacturing / total) * 100):0)
            MtResultValue.create(:mt_result_id => manufacturing_process_result.id, :indicator_id => indicator.id, :value => manufacturing_process, :percentage => (total != 0)?((manufacturing_process / total) * 100):0)            
            MtResultValue.create(:mt_result_id => manufacturing_materials_result.id, :indicator_id => indicator.id, :value => manufacturing_materials, :percentage => (total != 0)?((manufacturing_materials / total) * 100):0)            
            MtResultValue.create(:mt_result_id => manufacturing_resource_result.id, :indicator_id => indicator.id, :value => manufacturing_resources, :percentage => (total != 0)?((manufacturing_resources / total) * 100):0)            
            MtResultValue.create(:mt_result_id => manufacturing_waste_result.id, :indicator_id => indicator.id, :value => manufacturing_waste, :percentage => (total != 0)?((manufacturing_waste / total) * 100):0)            
                                             
            MtResultValue.create(:mt_result_id => distribution_result.id, :indicator_id => indicator.id, :value => distribution, :percentage => (total != 0)?((distribution / total) * 100):0)
            MtResultValue.create(:mt_result_id => distribution_transport_result.id, :indicator_id => indicator.id, :value => distribution_transport, :percentage => (total != 0)?((distribution_transport / total) * 100):0)
            MtResultValue.create(:mt_result_id => distribution_packaging_result.id, :indicator_id => indicator.id, :value => distribution_packaging, :percentage => (total != 0)?((distribution_packaging / total) * 100):0)            
            MtResultValue.create(:mt_result_id => use_result.id, :indicator_id => indicator.id, :value => use, :percentage => (total != 0)?((use / total) * 100):0)

            mt_results = MtResult.find(:all, :conditions => ["mt_product_id = ?", @mt_product.id])
            mt_results.each do |mt_result|
              mt_result_value = MtResultValue.find_by_mt_result_id(mt_result.id)
              if mt_result_value
                 mt_result_value.percentage = (mt_result_value.value.to_f / total.to_f).to_f * 100.to_f
                 mt_result_value.save           
              end
            end            
            
            
            @max = total
            @limit1 = @max * 0.25
            @limit2 = @max * 0.50
            @limit3 = @max * 0.75
            
            @total = total
            @materials = materials
            @manufacturing = manufacturing
            @distribution = distribution
            @use = use            
            @end_of_life = endoflife 
              
            tmp_processing = 0
            tmp_ready = 0
            tmp_standby = 0
            
            @mt_product.mt_use_machine_subsystem_datas.each do |mt_use_machine_subsystem_data|
              tmp_processing += mt_use_machine_subsystem_data.processing
              tmp_ready += mt_use_machine_subsystem_data.ready
              tmp_standby += mt_use_machine_subsystem_data.standby              
            end
            
            @unassigned_processing = @mt_product.mt_use.processing - tmp_processing
            @unassigned_ready = @mt_product.mt_use.ready - tmp_ready
            @unassigned_standby = @mt_product.mt_use.standby - tmp_standby
              
        end
        @main_result = root_result

        @end_of_life_ok = true
        @mt_product.mt_material_datas.each do |mt_material_data|
          if mt_material_data.scenario.blank?
             @end_of_life_ok = false
          end
        end
        @mt_product.mt_predefined_supplier_datas.each do |mt_predefined_supplier_data|
          if mt_predefined_supplier_data.scenario.blank?
            @end_of_life_ok = false
          end
        end
        @mt_product.mt_user_supplier_datas.each do |mt_user_supplier_data|
          if mt_user_supplier_data.scenario.blank?
            @end_of_life_ok = false
          end
        end
    end      



  def do_results  

    results_created = false
    results_to_delete = MtResult.find_all_by_mt_product_id(@mt_product.id)        
    results_to_delete.each do |result|
       result_values_to_delete = MtResultValue.find(:all, :conditions => ["mt_result_id = ?" , result.id])
       MtResultValue.delete(result_values_to_delete)
       if !result.has_checkbox
          result.delete
       end   
       results_created = true
    end

    if !results_created          
       root_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Total", :name_ca => "Total", :name_es => "Total", :parent_id => -1, :has_checkbox => true)
       root_result.save   
       
       ## MATERIALS
       materials_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "MATERIALS", :name_ca => "MATERIALS", :name_es => "MATERIALS", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
       materials_result.save

       materials_materials_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Raw materials", :name_ca => "Raw materials", :name_es => "Raw materials", :parent_id => materials_result.id, :check_graphic => true, :has_checkbox => true)
       materials_materials_result.save

       materials_suppliers_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Supplier parts", :name_ca => "Supplier parts", :name_es => "Supplier parts", :parent_id => materials_result.id, :check_graphic => true, :has_checkbox => true)
       materials_suppliers_result.save

       ## MANUFACTURING
       manufacturing_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "MANUFACTURING", :name_ca => "MANUFACTURING", :name_es => "MANUFACTURING", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
       manufacturing_result.save

       manufacturing_materials_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Energy", :name_ca => "Energy", :name_es => "Energy", :parent_id => manufacturing_result.id, :check_graphic => true, :has_checkbox => true)
       manufacturing_materials_result.save

       manufacturing_waste_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Waste in production", :name_ca => "Waste in production", :name_es => "Waste in production", :parent_id => manufacturing_result.id, :check_graphic => true, :has_checkbox => true)
       manufacturing_waste_result.save
       
       
       ## DISTRIBUTION
       distribution_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "DISTRIBUTION", :name_ca => "DISTRIBUTION", :name_es => "DISTRIBUTION", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
       distribution_result.save

       distribution_transport_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Transport", :name_ca => "Transport", :name_es => "Transport", :parent_id => distribution_result.id, :check_graphic => true, :has_checkbox => true)
       distribution_transport_result.save

       distribution_packaging_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Packaging", :name_ca => "Packaging", :name_es => "Packaging", :parent_id => distribution_result.id, :check_graphic => true, :has_checkbox => true)
       distribution_packaging_result.save

       ## USE
       use_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "USE", :name_ca => "USE", :name_es => "USE", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
       use_result.save

       use_standby_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Standby", :name_ca => "Standby", :name_es => "Standby", :parent_id => use_result.id, :check_graphic => true, :has_checkbox => true)
       use_standby_result.save
             
       use_ready_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Ready for operation", :name_ca => "Ready for operation", :name_es => "Ready for operation", :parent_id => use_result.id, :check_graphic => true, :has_checkbox => true)
       use_ready_result.save

       use_processing_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Processing", :name_ca => "Processing", :name_es => "Processing", :parent_id => use_result.id, :check_graphic => true, :has_checkbox => true)
       use_processing_result.save

       ## END_OF_LIFE
       endoflife_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "END-OF-LIFE", :name_ca => "END-OF-LIFE", :name_es => "END-OF-LIFE", :parent_id => root_result.id, :check_graphic => true, :has_checkbox => true)
       endoflife_result.save
       
       end_of_life_child_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Recycling", :name_ca => "Recycling", :name_es => "Recycling", :parent_id => endoflife_result.id, :check_graphic => true, :has_checkbox => true)
       end_of_life_child_result.save
       
     else
       root_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Total", -1)
       
       ## MATERIALS
       materials_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "MATERIALS", root_result.id)
       materials_materials_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Raw materials", materials_result.id)
       materials_suppliers_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Supplier parts", materials_result.id)

       ## MANUFACTURING
       manufacturing_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "MANUFACTURING", root_result.id)
       manufacturing_materials_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Energy", manufacturing_result.id)
       manufacturing_waste_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Waste in production", manufacturing_result.id)

       ## DISTRIBUTION
       distribution_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "DISTRIBUTION", root_result.id)
       distribution_transport_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Transport", distribution_result.id)
       distribution_packaging_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Packaging", distribution_result.id)

       ## USE
       use_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "USE", root_result.id)     
       use_standby_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Standby", use_result.id)             
       use_ready_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Ready for operation", use_result.id)
       use_processing_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Processing", use_result.id)      
       
       ## END_OF_LIFE
       endoflife_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "END-OF-LIFE", root_result.id)
       end_of_life_child_result = MtResult.find_by_mt_product_id_and_parent_id(@mt_product.id , endoflife_result.id)       
     end  
       if @product.indicators.size == 0
          indicators = Indicator.where("sector = 'machine'")
          indicators.each do |indicator|
             @product.indicators << indicator
          end   
          @product.save
       end
       @product.indicators.each do |indicator|
            total = 0
            materials = 0
            
            materials_materials = 0
            materials_suppliers = 0
            
            manufacturing = 0
            manufacturing_materials = 0
            manufacturing_waste = 0            
            
            distribution = 0
            distribution_transport = 0
            distribution_packaging = 0
            use = 0
            use_standby = 0
            use_ready = 0
            use_processing = 0
            endoflife = 0
            endoflife_recycling = 0
            endoflife_landfill = 0
            endoflife_incineration = 0
            
            
            @mt_product.mt_material_datas.each do |mt_material_data| 
               excel_value = get_mt_excel_value(indicator, mt_material_data.mt_material.name, "MATERIALS")
               value = mt_material_data.quantity * excel_value
               materials += value
               materials_materials += value
               
               endoflife_recycling += mt_material_data.mt_material.recycling * mt_material_data.quantity
               endoflife_landfill += mt_material_data.mt_material.landfill * mt_material_data.quantity
               endoflife_incineration += mt_material_data.mt_material.incineration * mt_material_data.quantity               
               
               tmp_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => mt_material_data.mt_material.name, :name_ca => mt_material_data.mt_material.name, :name_es => mt_material_data.mt_material.name, :parent_id => materials_materials_result.id, :check_graphic => true)
               tmp_result.save
               MtResultValue.create(:mt_result_id => tmp_result.id, :indicator_id => indicator.id, :value => value, :percentage => 0)
            end

            @mt_product.mt_supplier_datas.each do |mt_supplier_data|  
               excel_value = get_mt_excel_value(indicator, mt_supplier_data.mt_material.name, "MATERIALS")
               value = mt_supplier_data.quantity * excel_value
               materials += value
               materials_suppliers += value
               
               endoflife_recycling += mt_supplier_data.mt_material.recycling * mt_supplier_data.quantity
               endoflife_landfill += mt_supplier_data.mt_material.landfill * mt_supplier_data.quantity
               endoflife_incineration += mt_supplier_data.mt_material.incineration * mt_supplier_data.quantity               
               
               tmp_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => mt_supplier_data.mt_material.name, :name_ca => mt_supplier_data.mt_material.name, :name_es => mt_supplier_data.mt_material.name, :parent_id => materials_suppliers_result.id, :check_graphic => true)
               tmp_result.save
               MtResultValue.create(:mt_result_id => tmp_result.id, :indicator_id => indicator.id, :value => value, :percentage => 0)
            end
     
     
            @mt_product.mt_energy_datas.each do |mt_energy_data| 
               excel_value = get_mt_excel_value(indicator, mt_energy_data.mt_energy_process.name, "MATERIALS")
               value = mt_energy_data.quantity * excel_value
               manufacturing += value
               manufacturing_materials += value
               tmp_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => mt_energy_data.mt_energy_process.name, :name_ca => mt_energy_data.mt_energy_process.name, :name_es => mt_energy_data.mt_energy_process.name, :parent_id => manufacturing_materials_result.id, :check_graphic => true)
               tmp_result.save
               MtResultValue.create(:mt_result_id => tmp_result.id, :indicator_id => indicator.id, :value => value, :percentage => 0)
            end
      
            excel_ba = 72
            manufacturing_waste = @mt_product.mt_manufacturing.waste * excel_ba
            manufacturing += manufacturing_waste
            
            if @mt_product.mt_distribution && @mt_product.mt_assessment  && @mt_product.mt_distribution.packaging && @mt_product.mt_assessment.weight
               excel_value = get_mt_excel_value(indicator, "Transport_Lorry 3.5-20t" , "DISTRIBUTION")                             
               distribution_transport = ((@mt_product.mt_distribution.packaging / 1000) + (@mt_product.mt_assessment.weight / 1000)) * 2000 * excel_value
               if @mt_product.mt_distribution.options == 'overseas'
                 excel_value = get_mt_excel_value(indicator, "Transport_Ship" , "DISTRIBUTION")
                 distribution_transport += ((@mt_product.mt_distribution.packaging / 1000) + (@mt_product.mt_assessment.weight/ 1000)) * 20000 * excel_value
               end
            end   
            
            excel_ai = 21.14
            distribution_packaging = 0
            if @mt_product.mt_distribution && @mt_product.mt_distribution.packaging
              distribution_packaging = @mt_product.mt_distribution.packaging * excel_ai
            end
            
            distribution = distribution_transport + distribution_packaging 

            lifetime = 0
            if @mt_product.mt_assessment && @mt_product.mt_assessment.lifetime
                lifetime = @mt_product.mt_assessment.lifetime
            end 

            if @mt_product.mt_use && @mt_product.mt_use.working_days
                pre_value = lifetime * @mt_product.mt_use.working_days
            end

            use_processing = 0
            use_ready = 0
            use_standby = 0

            if @mt_product.mt_use && @mt_product.mt_use.mt_energy_process
               excel_value = get_mt_excel_value(indicator, @mt_product.mt_use.mt_energy_process.name , "USE")
               use_processing = pre_value * @mt_product.mt_use.hours_shift_processing * @mt_product.mt_use.processing * excel_value
               use_ready = pre_value * @mt_product.mt_use.hours_shift_ready * @mt_product.mt_use.ready * excel_value
               use_standby = pre_value * @mt_product.mt_use.hours_shift_standby * @mt_product.mt_use.standby * excel_value
            end

            
            use = use_processing + use_ready + use_standby


            if @mt_product.mt_use
              tmp_val_1 = @mt_product.mt_use.hours_shift_processing + @mt_product.mt_use.hours_shift_ready + @mt_product.mt_use.hours_shift_standby
              tmp_val_2 = (@mt_product.mt_use.hours_shift_processing * @mt_product.mt_use.processing * @mt_product.mt_use.working_days * lifetime) + (@mt_product.mt_use.hours_shift_ready * @mt_product.mt_use.ready * @mt_product.mt_use.working_days * lifetime) + (@mt_product.mt_use.hours_shift_standby * @mt_product.mt_use.standby* @mt_product.mt_use.working_days * lifetime)
              tmp_val_3 = @mt_product.mt_use.parts_produced * @mt_product.mt_use.hours_shift_processing * @mt_product.mt_use.working_days * lifetime
              if tmp_val_3 != 0 && tmp_val_2 != 0 && @mt_product.mt_use.parts_produced != 0
                @energy_production_ratio = ((tmp_val_2.to_f / tmp_val_3.to_f).to_f)
              else
                 @energy_production_ratio = 0
              end
            else
              @energy_production_ratio = 0
            end

            total = materials + manufacturing + distribution + use + endoflife
            
            MtResultValue.create(:mt_result_id => root_result.id, :indicator_id => indicator.id, :value => total, :percentage => (total != 0)?((total / total) * 100):0)
            MtResultValue.create(:mt_result_id => materials_result.id, :indicator_id => indicator.id, :value => materials, :percentage => (total != 0)?((materials / total) * 100):0)
            MtResultValue.create(:mt_result_id => materials_materials_result.id, :indicator_id => indicator.id, :value => materials_materials, :percentage => (total != 0)?((materials_materials / total) * 100):0)
            MtResultValue.create(:mt_result_id => materials_suppliers_result.id, :indicator_id => indicator.id, :value => materials_suppliers, :percentage => (total != 0)?((materials_suppliers / total) * 100):0)            
            
            
            MtResultValue.create(:mt_result_id => manufacturing_result.id, :indicator_id => indicator.id, :value => manufacturing, :percentage => (total != 0)?((manufacturing / total) * 100):0)
            MtResultValue.create(:mt_result_id => manufacturing_materials_result.id, :indicator_id => indicator.id, :value => manufacturing_materials, :percentage => (total != 0)?((manufacturing_materials / total) * 100):0)            
            MtResultValue.create(:mt_result_id => manufacturing_waste_result.id, :indicator_id => indicator.id, :value => manufacturing_waste, :percentage => (total != 0)?((manufacturing_waste / total) * 100):0)            
                                             
            MtResultValue.create(:mt_result_id => distribution_result.id, :indicator_id => indicator.id, :value => distribution, :percentage => (total != 0)?((distribution / total) * 100):0)
            MtResultValue.create(:mt_result_id => distribution_transport_result.id, :indicator_id => indicator.id, :value => distribution_transport, :percentage => (total != 0)?((distribution_transport / total) * 100):0)
            MtResultValue.create(:mt_result_id => distribution_packaging_result.id, :indicator_id => indicator.id, :value => distribution_packaging, :percentage => (total != 0)?((distribution_packaging / total) * 100):0)            
            MtResultValue.create(:mt_result_id => use_result.id, :indicator_id => indicator.id, :value => use, :percentage => (total != 0)?((use / total) * 100):0)
            MtResultValue.create(:mt_result_id => use_standby_result.id, :indicator_id => indicator.id, :value => use_standby, :percentage => (total != 0)?((use_standby / total) * 100):0)
            MtResultValue.create(:mt_result_id => use_ready_result.id, :indicator_id => indicator.id, :value => use_ready, :percentage => (total != 0)?((use_ready / total) * 100):0)
            MtResultValue.create(:mt_result_id => use_processing_result.id, :indicator_id => indicator.id, :value => use_processing, :percentage => (total != 0)?((use_processing / total) * 100):0)

           endoflife = 0
           if @mt_product.mt_end_of_life
              if @mt_product.mt_end_of_life.waste_streams == 'incineration'
                 endoflife = endoflife_incineration
                 end_of_life_child_result.name_en = 'Incineration'
                 end_of_life_child_result.name_ca = 'Incineration'
                 end_of_life_child_result.name_es = 'Incineration'
                 end_of_life_child_result.save
                 excel_ai_endoflife = 0.17
              end
              if @mt_product.mt_end_of_life.waste_streams == 'recycling'
                 endoflife = endoflife_recycling
  #               endoflife_child_result = MtResult.new(:mt_product_id => @mt_product.id, :name_en => "Recycling", :name_ca => "Recycling", :name_es => "Recycling", :parent_id => endoflife_result.id, :check_graphic => true)
                 end_of_life_child_result.name_en = 'Recycling'
                 end_of_life_child_result.name_ca = 'Recycling'
                 end_of_life_child_result.name_es = 'Recycling'
                 end_of_life_child_result.save
           #      endoflife_child_result.save
                 excel_ai_endoflife = -18.65
              end
              if @mt_product.mt_end_of_life.waste_streams == 'landfill'
                 endoflife = endoflife_landfill
                 end_of_life_child_result.name_en = 'Landfill'
                 end_of_life_child_result.name_ca = 'Landfill'
                 end_of_life_child_result.name_es = 'Landfill'
                 end_of_life_child_result.save

                 excel_ai_endoflife = 0.33
              end
           end

           MtResultValue.create(:mt_result_id => endoflife_result.id, :indicator_id => indicator.id, :value => endoflife, :percentage => (total != 0)?((endoflife / total) * 100):0)
           MtResultValue.create(:mt_result_id => end_of_life_child_result.id, :indicator_id => indicator.id, :value => endoflife, :percentage => (total != 0)?((endoflife / total) * 100):0)

           mt_results = MtResult.find(:all, :conditions => ["mt_product_id = ?", @mt_product.id])
           mt_results.each do |mt_result|
           mt_result_value = MtResultValue.find_by_mt_result_id(mt_result.id)
           if mt_result_value && mt_result_value.value && (total != 0) && (mt_result_value.value != 0)
               begin
                 mt_result_value.percentage = (mt_result_value.value.to_f / total.to_f).to_f * 100.to_f
               rescue
                 mt_result_value.percentage = 0
               end
               mt_result_value.save
            end
          end
            
            
          @max = total
          @limit1 = @max * 0.25
          @limit2 = @max * 0.50
          @limit3 = @max * 0.75
            
          @total = total
          @materials = materials
          @manufacturing = manufacturing
          @distribution = distribution
          @use = use
          @end_of_life = endoflife
      end
      @main_result = root_result
      @end_of_life_ok = true
      if !@mt_product.mt_end_of_life || @mt_product.mt_end_of_life.waste_streams.blank?
         @end_of_life_ok = false
      end
  end



  def get_mt_excel_value indicator, local_name, life_cycle_phase
    # TODO -> en excel no espacio
    local_name = local_name.gsub('<', '&lt;')
    local_name = local_name.gsub('>', '&gt;')
    mt_excel_value = ExcelValue.find(:first, :conditions => ["name = ? and phase like ? and indicator_id = ?", local_name, '%' + life_cycle_phase + '%', indicator.id])
    if mt_excel_value
      return mt_excel_value.value
    end
    0
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
    @datas = Array.new
    @datas_absolute = Array.new
    
    @labels = Array.new
    @labels_absolute = Array.new      
    
    @colors = Array.new
    @colors_absolute = Array.new
    coder = HTMLEntities.new
    
    @indicators_checked = Array.new
    @product.indicators.each do |indicator|
       @indicators_checked << indicator
    end
    
    
    @product.indicators.each do |indicator|
           data = Array.new
           data_absolute = Array.new
           
           result_total = MtResult.find(:all, :conditions => ["name_en=? and mt_product_id=?", 'Total', @mt_product.id]).first
           result_total_value = MtResultValue.find(:all, :conditions => ["indicator_id = ? AND mt_result_id = ?", indicator.id, result_total.id]).first
           total = result_total_value.value    

           logger.info "TOTAL --> " + total.to_s
           result_total.children.each do |result| 
             if result.check_graphic 
                result_value = MtResultValue.find(:all, :conditions => ["indicator_id = ? AND mt_result_id = ?", indicator.id, result.id]).first            
                if !result_value || total == 0
                   value = 0
                   value_absolute = 0
                else
                   value = ((result_value.value / total) * 100)
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
                    result_value = MtResultValue.find(:all, :conditions => ["indicator_id = ? AND mt_result_id = ?", indicator.id, result.id]).first            
                    if !result_value || total == 0
                       value = 0
                       value_absolute = 0
                    else
                       value = ((result_value.value / total) * 100)
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
       
      ##################################
      # MATERIALS
      ##################################
      
      @colors = ["0033FF","00CCFF","336600","663300","CC6600","FF3300","FFCC00","FFFF00"]  
       
      materials_result = MtResult.find_by_mt_product_id_and_name_en(@mt_product.id, "MATERIALS")
      materials_materials_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Raw materials", materials_result.id)
      materials_suppliers_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Supplier parts", materials_result.id)

      @materials_ticks = ''
      @materials_values = ''      
      @materials_colors = ''
      index = 0
      mt_total_value = MtResultValue.find_by_mt_result_id(materials_result.id).value
      
      # Materials
      mt_child_results = MtResult.find_all_by_parent_id(materials_materials_result.id)      
      mt_child_results.each do |mt_child_result|
         mt_result_value = MtResultValue.find_by_mt_result_id(mt_child_result.id)
         if @materials_ticks != ''
            @materials_ticks += "|"
            @materials_values += ","
            @materials_colors += "|"
         end
         percentage = ((mt_result_value.value / mt_total_value).to_f * 100).round(2)
         @materials_ticks += mt_child_result.name_en + "(" + percentage.to_s + " %)"
         @materials_values += percentage.to_s
         @materials_colors += @colors[index].to_s
         index = index + 1 
      end

      # Supplier parts
      mt_child_results = MtResult.find_all_by_parent_id(materials_suppliers_result.id)      
      mt_child_results.each do |mt_child_result|
         mt_result_value = MtResultValue.find_by_mt_result_id(mt_child_result.id)
         if @materials_ticks != ''
            @materials_ticks += "|"
            @materials_values += ","
            @materials_colors += "|"
         end
         percentage = ((mt_result_value.value / mt_total_value).to_f * 100).round(2)
         @materials_ticks += mt_child_result.name_en + "(" + percentage.to_s + " %)"
         @materials_values += percentage.to_s
         @materials_colors += @colors[index].to_s
         index = index + 1 
      end
      
      
      
      ###########################
      # MANUFACTURING
      ###########################
            
      manufacturing_result = MtResult.find_by_mt_product_id_and_name_en(@mt_product.id, "MANUFACTURING")
      manufacturing_energy_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Energy", manufacturing_result.id)
      manufacturing_waste_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Waste in production", manufacturing_result.id)      
      
      mt_energy_value = MtResultValue.find_by_mt_result_id(manufacturing_energy_result.id)
      mt_waste_value = MtResultValue.find_by_mt_result_id(manufacturing_waste_result.id)      
    
      total = 0
      mt_energy_value_res = 0
      mt_waste_value_res = 0
      if !mt_energy_value.value.blank?
        mt_energy_value_res = mt_energy_value.value
        total += mt_energy_value_res
      end
      if !mt_waste_value.value.blank?
        mt_waste_value_res = mt_waste_value.value
        total += mt_waste_value_res
      end

      total = mt_energy_value_res + mt_waste_value_res

      percentage_energy = 0
      percentage_waste = 0

      if total != 0
         percentage_energy = ((mt_energy_value_res / total).to_f * 100).round(2)
         percentage_waste = ((mt_waste_value_res / total).to_f * 100).round(2)
      end
      @manufacturing_ticks = _('Energy').html_safe  + "(" + percentage_energy.to_s + " %)" + '|' + _('Waste in production').html_safe + "(" + percentage_waste.to_s + " %)"
      @manufacturing_values = percentage_energy.to_s + ',' + percentage_waste.to_s     
      @manufacturing_colors = @colors[0].to_s + '|' + @colors[1].to_s
      

      ###########################
      # DISTRIBUTION
      ###########################  

      distribution_result = MtResult.find_by_mt_product_id_and_name_en(@mt_product.id, "DISTRIBUTION")
      distribution_transport_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Transport", distribution_result.id)
      distribution_packaging_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Packaging", distribution_result.id)      

      mt_transport_value = MtResultValue.find_by_mt_result_id(distribution_transport_result.id)
      mt_packaging_value = MtResultValue.find_by_mt_result_id(distribution_packaging_result.id)      

      total = 0
      mt_transport_value_res = 0
      mt_packaging_value_res = 0
      if !mt_transport_value.value.blank?
        mt_transport_value_res = mt_transport_value.value
        total += mt_transport_value_res
      end
      if !mt_packaging_value.value.blank?
        mt_packaging_value_res = mt_packaging_value.value
        total += mt_packaging_value_res
      end

      total = mt_transport_value_res + mt_packaging_value_res

      percentage_transport = 0
      percentage_packaging = 0

      if total != 0
          percentage_transport = ((mt_transport_value_res / total).to_f * 100).round(2)
          percentage_packaging = ((mt_packaging_value_res / total).to_f * 100).round(2)
      end
    
      @distribution_ticks = _('Transport').html_safe  + "(" + percentage_transport.to_s + " %)" + '|' + _('Packaging').html_safe + "(" + percentage_packaging.to_s + " %)"
      @distribution_values = percentage_transport.to_s + ',' + percentage_packaging.to_s     
      @distribution_colors = @colors[0].to_s + '|' + @colors[1].to_s

      ###########################
      # USE
      ###########################  

      use_result = MtResult.find_by_mt_product_id_and_name_en(@mt_product.id, "USE")
      use_standby_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Standby", use_result.id)
      use_ready_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Ready for operation", use_result.id)      
      use_processing_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Processing", use_result.id)      
      
      mt_standby_value = MtResultValue.find_by_mt_result_id(use_standby_result.id)
      mt_ready_value = MtResultValue.find_by_mt_result_id(use_ready_result.id)      
      mt_processing_value = MtResultValue.find_by_mt_result_id(use_processing_result.id)      
 
      total = 0
      mt_standby_value_res = 0
      mt_ready_value_res = 0
      mt_processing_value_res = 0

      if !mt_standby_value.value.blank?
        mt_standby_value_res = mt_standby_value.value
        total += mt_standby_value_res
      end
      if !mt_ready_value.value.blank?
        mt_ready_value_res = mt_ready_value.value
        total += mt_ready_value_res
      end
      if !mt_processing_value.value.blank?
        mt_processing_value_res = mt_processing_value.value
        total += mt_processing_value_res
      end



      total = mt_standby_value_res + mt_ready_value_res + mt_processing_value_res

      percentage_standby = 0
      percentage_ready = 0
      percentage_processing = 0

      if total != 0
        percentage_standby = ((mt_standby_value_res / total).to_f * 100).round(2)
        percentage_ready = ((mt_ready_value_res / total).to_f * 100).round(2)
        percentage_processing = ((mt_processing_value_res / total).to_f * 100).round(2)
      end
      @use_ticks = _('Processing').html_safe  + "(" + percentage_processing.to_s + " %)" + '|' + _('Ready').html_safe + "(" + percentage_ready.to_s + " %)" + '|' + _('Standby').html_safe + "(" + percentage_standby.to_s + " %)"
      @use_values = percentage_processing.to_s + ',' + percentage_ready.to_s + ',' + percentage_standby.to_s    
      @use_colors = @colors[0].to_s + '|' + @colors[1].to_s + '|' + @colors[2].to_s
      
      
      
      
  end
    
    
    
  def generate_graphic_detailed
    @datas = Array.new
    @datas_absolute = Array.new
    
    @labels = Array.new
    @labels_absolute = Array.new      
    
    @colors = Array.new
    @colors_absolute = Array.new    
  #  @bp_product_result = @bp_product.bp_product_result
    coder = HTMLEntities.new
    
       @indicators_checked = Array.new
       @product.indicators.each do |indicator|
         @indicators_checked << indicator 
       end    
    
    
    @product.indicators.each do |indicator|
           data = Array.new
           data_absolute = Array.new
           
           result_total = MtResult.find(:all, :conditions => ["name_en=? and mt_product_id=?", 'Total', @mt_product.id]).first
           result_total_value = MtResultValue.find(:all, :conditions => ["indicator_id = ? AND mt_result_id = ?", indicator.id, result_total.id]).first
           total = result_total_value.value

           logger.info "TOTAL --> " + total.to_s
           result_total.children.each_with_index do |result, index|

           if result.check_graphic
              result_value = MtResultValue.find(:all, :conditions => ["indicator_id = ? AND mt_result_id = ?", indicator.id, result.id]).first
              if !result_value || total == 0
                 value = 0
                 value_absolute = 0
              else
                 value = ((result_value.value / total) * 100)
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
                    result_value = MtResultValue.find(:all, :conditions => ["indicator_id = ? AND mt_result_id = ?", indicator.id, result.id]).first            
                    if !result_value || total == 0
                       value = 0
                       value_absolute = 0
                    else
                       value = ((result_value.value / total) * 100)
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

      ##################################
      # COMPONENTS
      ##################################     
      @colors = ["0033FF","00CCFF","336600","663300","CC6600","FF3300","FFCC00","FFFF00"]  
       
      materials_result = MtResult.find_by_mt_product_id_and_name_en(@mt_product.id, "MATERIALS")
      mt_total_value = MtResultValue.find_by_mt_result_id(materials_result.id).value       
      materials_materials_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Components", materials_result.id)       
       
      components = Hash.new
      suppliers_predefined = Hash.new
      suppliers_user = Hash.new
      
      @mt_product.mt_material_datas.each do |mt_material_data| 
        excel_value = get_mt_excel_value(@product.indicators.first, mt_material_data.mt_material.name, "MATERIALS")
        value = mt_material_data.quantity * excel_value
        if components.has_key?(mt_material_data.module)
          components[mt_material_data.module] += value
        else 
          components[mt_material_data.module] = value
        end
      end       
      
      @mt_product.mt_predefined_supplier_datas.each do |mt_predefined_supplier_data|  
         excel_value = get_mt_excel_value(@product.indicators.first, mt_predefined_supplier_data.mt_material.name, "MATERIALS")
         excel_value_transport = get_mt_excel_value(@product.indicators.first, mt_predefined_supplier_data.mt_transport_type.name , "DISTRIBUTION")
         value = mt_predefined_supplier_data.quantity * excel_value
         if !mt_predefined_supplier_data.quantity.blank? && !mt_predefined_supplier_data.distance.blank?
           value += ((mt_predefined_supplier_data.quantity * mt_predefined_supplier_data.distance) / 1000) * excel_value_transport 
         end
         if suppliers_predefined.has_key?(mt_predefined_supplier_data.mt_family.id)
            suppliers_predefined[mt_predefined_supplier_data.mt_family.id] += value
         else 
            suppliers_predefined[mt_predefined_supplier_data.mt_family.id] = value
         end               
      end      
      
     @mt_product.mt_user_supplier_datas.each do |mt_user_supplier_data|  
         excel_value = get_mt_excel_value(@product.indicators.first, mt_user_supplier_data.mt_material.name, "MATERIALS")
         if mt_user_supplier_data.mt_manufacturing_process 
            excel_value_process = get_mt_excel_value(@product.indicators.first, mt_user_supplier_data.mt_manufacturing_process.name, "MATERIALS")
         else 
            excel_value_process = 0
         end  
         value = mt_user_supplier_data.quantity * excel_value
         value += mt_user_supplier_data.value * excel_value_process
         
         if mt_user_supplier_data.mt_supplier_part_data
            transport_name = mt_user_supplier_data.mt_supplier_part_data.mt_transport_type.name
            distance = mt_user_supplier_data.mt_supplier_part_data.distance
            excel_value_transport = get_mt_excel_value(@product.indicators.first, transport_name, "DISTRIBUTION")
            value += distance * (mt_user_supplier_data.quantity / 1000) * excel_value_transport
         end
         
         if suppliers_user.has_key?(mt_user_supplier_data.mt_supplier_part_data.id)
           suppliers_user[mt_user_supplier_data.mt_supplier_part_data.id] += value
         else 
           suppliers_user[mt_user_supplier_data.mt_supplier_part_data.id] = value
         end                
      end           
      
      index = 0 
       
      @components_ticks = ''
      @components_values = ''      
      @components_colors = ''       
       
      components.keys.each do |key|
         if @components_ticks != ''
            @components_ticks += "|"
            @components_values += ","
            @components_colors += "|"
         end        
         value = components[key]
         percentage = ((value / mt_total_value).to_f * 100).round(2)
         if key.blank?
           key = ""
         end
         @components_ticks += key + "(" + percentage.to_s + " %)"
         @components_values += percentage.to_s
         @components_colors += @colors[index].to_s
         index = index + 1 
      end       
       
      suppliers_predefined.keys.each do |key|
         if @components_ticks != ''
            @components_ticks += "|"
            @components_values += ","
            @components_colors += "|"
         end        
         value = suppliers_predefined[key]
         percentage = ((value / mt_total_value).to_f * 100).round(2)
         mt_family = MtFamily.find(key)
         @components_ticks += mt_family.name + "(" + percentage.to_s + " %)"
         @components_values += percentage.to_s
         @components_colors += @colors[index].to_s
         index = index + 1 
      end       
       
       
      suppliers_user.keys.each do |key|
         if @components_ticks != ''
            @components_ticks += "|"
            @components_values += ","
            @components_colors += "|"
         end        
         value = suppliers_user[key]
         percentage = ((value / mt_total_value).to_f * 100).round(2)
         mt_supplier_part_data = MtSupplierPartData.find(key)
         @components_ticks += mt_supplier_part_data.name + "(" + percentage.to_s + " %)"
         @components_values += percentage.to_s
         @components_colors += @colors[index].to_s
         index = index + 1 
      end             
       
      ##################################
      # MATERIALS
      ##################################
             
      materials_result = MtResult.find_by_mt_product_id_and_name_en(@mt_product.id, "MATERIALS")
      materials_materials_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Components", materials_result.id)
      materials_suppliers_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Supplier parts", materials_result.id)

      @materials_ticks = ''
      @materials_values = ''      
      @materials_colors = ''
      index = 0
      mt_total_value = MtResultValue.find_by_mt_result_id(materials_result.id).value
      
      # Materials
      mt_child_results = MtResult.find_all_by_parent_id(materials_materials_result.id)      
      mt_child_results.each do |mt_child_result|
         mt_result_value = MtResultValue.find_by_mt_result_id(mt_child_result.id)
         if @materials_ticks != ''
            @materials_ticks += "|"
            @materials_values += ","
            @materials_colors += "|"
         end
         percentage = ((mt_result_value.value / mt_total_value).to_f * 100).round(2)
         if mt_child_result.name_en.blank?
            @materials_ticks += "(" + percentage.to_s + " %)"
         else
            @materials_ticks += mt_child_result.name_en + "(" + percentage.to_s + " %)"
         end  
         @materials_values += percentage.to_s
         @materials_colors += @colors[index].to_s
         index = index + 1 
      end

      # Supplier parts
      mt_child_results = MtResult.find_all_by_parent_id(materials_suppliers_result.id)      
      mt_child_results.each do |mt_child_result|
         mt_result_value = MtResultValue.find_by_mt_result_id(mt_child_result.id)
         if @materials_ticks != ''
            @materials_ticks += "|"
            @materials_values += ","
            @materials_colors += "|"
         end
         percentage = ((mt_result_value.value / mt_total_value).to_f * 100).round(2)
         @materials_ticks += mt_child_result.name_en + "(" + percentage.to_s + " %)"
         @materials_values += percentage.to_s
         @materials_colors += @colors[index].to_s
         index = index + 1 
      end
      
      
      
      ###########################
      # MANUFACTURING
      ###########################
            
      manufacturing_result = MtResult.find_by_mt_product_id_and_name_en(@mt_product.id, "MANUFACTURING")
      manufacturing_process_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Process", manufacturing_result.id)
      manufacturing_energy_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Energy", manufacturing_result.id)
      manufacturing_resource_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Resource", manufacturing_result.id)
      manufacturing_waste_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Waste", manufacturing_result.id)
      
      manufacturing_process_value = MtResultValue.find_by_mt_result_id(manufacturing_process_result.id)
      manufacturing_energy_value = MtResultValue.find_by_mt_result_id(manufacturing_energy_result.id)      
      manufacturing_resource_value = MtResultValue.find_by_mt_result_id(manufacturing_resource_result.id)
      manufacturing_waste_value = MtResultValue.find_by_mt_result_id(manufacturing_waste_result.id)      
      
      @manufacturing_ticks = ''
      @manufacturing_values = ''      
      @manufacturing_colors = ''      
      
      index = 0
      manufacturing_process_value_res = 0
      manufacturing_energy_value_res = 0
      manufacturing_resource_value_res = 0
      manufacturing_waste_value_res = 0

      if !manufacturing_process_value.value.blank?
        manufacturing_process_value_res = manufacturing_process_value.value
      end
      if !manufacturing_energy_value.value.blank?
        manufacturing_energy_value_res = manufacturing_energy_value.value
      end
      if !manufacturing_resource_value.value.blank?
        manufacturing_resource_value_res = manufacturing_resource_value.value
      end
      if !manufacturing_waste_value.value.blank?
        manufacturing_waste_value_res = manufacturing_waste_value.value
      end


      total = manufacturing_process_value_res + manufacturing_energy_value_res + manufacturing_resource_value_res + manufacturing_waste_value_res

      percentage_process = 0
      percentage_energy = 0
      percentage_resource = 0
      percentage_waste = 0

      if total != 0
        percentage_process = ((manufacturing_process_value_res / total).to_f * 100).round(2)
        percentage_energy = ((manufacturing_energy_value_res / total).to_f * 100).round(2)
        percentage_resource = ((manufacturing_resource_value_res / total).to_f * 100).round(2)
        percentage_waste = ((manufacturing_waste_value_res / total).to_f * 100).round(2)
      end
      
      @manufacturing_ticks = _('Process').html_safe  + "(" + percentage_process.to_s + " %)" + '|' + _('Energy').html_safe + "(" + percentage_energy.to_s + " %)" + '|' + _('Resource').html_safe + "(" + percentage_resource.to_s + " %)" + '|' + _('Waste').html_safe + "(" + percentage_waste.to_s + " %)"
      @manufacturing_values = percentage_process.to_s + ',' + percentage_energy.to_s + ',' + percentage_resource.to_s + ',' + percentage_waste.to_s     
      @manufacturing_colors = @colors[0].to_s + '|' + @colors[1].to_s + '|' + @colors[2].to_s + '|' + @colors[4].to_s

      ###########################
      # DISTRIBUTION
      ###########################  

      distribution_result = MtResult.find_by_mt_product_id_and_name_en(@mt_product.id, "DISTRIBUTION")
      distribution_transport_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Transport", distribution_result.id)
      distribution_packaging_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Packaging", distribution_result.id)      

      mt_transport_value = MtResultValue.find_by_mt_result_id(distribution_transport_result.id)
      mt_packaging_value = MtResultValue.find_by_mt_result_id(distribution_packaging_result.id)      
    
      mt_transport_value_res = 0
      mt_packaging_value_res = 0

      if !mt_transport_value.value.blank?
        mt_transport_value_res = mt_transport_value.value
      end
      if !mt_packaging_value.value.blank?
        mt_packaging_value_res = mt_packaging_value.value
      end

      total = mt_transport_value_res + mt_packaging_value_res

      percentage_transport = 0
      percentage_packaging = 0
      if total != 0
        percentage_transport = ((mt_transport_value_res / total).to_f * 100).round(2)
        percentage_packaging = ((mt_packaging_value_res / total).to_f * 100).round(2)
      end    
      @distribution_ticks = _('Transport').html_safe  + "(" + percentage_transport.to_s + " %)" + '|' + _('Packaging').html_safe + "(" + percentage_packaging.to_s + " %)"
      @distribution_values = percentage_transport.to_s + ',' + percentage_packaging.to_s     
      @distribution_colors = @colors[0].to_s + '|' + @colors[1].to_s

      ###########################
      # USE
      ###########################  


      standby = 0
      ready = 0
      processing = 0      
      
      use_result = MtResult.find_by_mt_product_id_and_name_en(@mt_product.id, "USE")
      
      use_additional_energy_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Additional energy flow", use_result.id)            
      use_operational_resources_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Operating resources", use_result.id)
      
      use_additional_energy_standby_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Standby", use_additional_energy_result.id)
      use_additional_energy_ready_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Ready for operation", use_additional_energy_result.id)
      use_additional_energy_processing_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Processing", use_additional_energy_result.id)
      
      use_additional_energy_standby_result_value = MtResultValue.find_by_mt_result_id(use_additional_energy_standby_result.id)      
      use_additional_energy_ready_result_value = MtResultValue.find_by_mt_result_id(use_additional_energy_ready_result.id)
      use_additional_energy_processing_result_value = MtResultValue.find_by_mt_result_id(use_additional_energy_processing_result.id)      

      if !use_additional_energy_standby_result_value.value.blank?
        standby += use_additional_energy_standby_result_value.value
      end
      if !use_additional_energy_ready_result_value.value.blank?
        ready += use_additional_energy_ready_result_value.value
      end
      if !use_additional_energy_processing_result_value.value.blank?
        processing += use_additional_energy_processing_result_value.value
      end

      use_operational_resources_standby_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Standby", use_operational_resources_result.id)
      use_operational_resources_ready_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Ready for operation", use_operational_resources_result.id)
      use_operational_resources_processing_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Processing", use_operational_resources_result.id)
      
      use_operational_resources_standby_result_value = MtResultValue.find_by_mt_result_id(use_operational_resources_standby_result.id)      
      use_operational_resources_ready_result_value = MtResultValue.find_by_mt_result_id(use_operational_resources_ready_result.id)
      use_operational_resources_processing_result_value = MtResultValue.find_by_mt_result_id(use_operational_resources_processing_result.id)

      if !use_operational_resources_standby_result_value.value.blank?
        standby += use_operational_resources_standby_result_value.value
      end
      if !use_operational_resources_ready_result_value.value.blank?
        ready += use_operational_resources_ready_result_value.value
      end
      if !use_operational_resources_processing_result_value.value.blank?
        processing += use_operational_resources_processing_result_value.value
      end

      @selected_shift = ''
      if @mt_product.mt_use.breakdown && @mt_product.mt_use.breakdown == 'shift1'
         use_shift_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, @mt_product.mt_use.description, use_result.id)
         @selected_shift = @mt_product.mt_use.description
      end
      if @mt_product.mt_use.breakdown && @mt_product.mt_use.breakdown == 'shift2'
         use_shift_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, @mt_product.mt_use.description_2, use_result.id)
         @selected_shift = @mt_product.mt_use.description_2
      end
      if @mt_product.mt_use.breakdown && @mt_product.mt_use.breakdown == 'shift3'
         use_shift_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, @mt_product.mt_use.description_3, use_result.id)
         @selected_shift = @mt_product.mt_use.description_3
      end

      use_shift_standby_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Standby", use_shift_result.id)
      use_shift_ready_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Ready for operation", use_shift_result.id)
      use_shift_processing_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Processing", use_shift_result.id)
      
      use_shift_standby_result_value = MtResultValue.find_by_mt_result_id(use_shift_standby_result.id)      
      use_shift_ready_result_value = MtResultValue.find_by_mt_result_id(use_shift_ready_result.id)
      use_shift_processing_result_value = MtResultValue.find_by_mt_result_id(use_shift_processing_result.id)


      if !use_shift_standby_result_value.value.blank?
         standby += use_shift_standby_result_value.value
      end
      if !use_shift_ready_result_value.value.blank?
         ready += use_shift_ready_result_value.value
      end
      if !use_shift_processing_result_value.value.blank?
         processing += use_shift_processing_result_value.value
      end

      total = standby + ready + processing
      
      if total != 0
        percentage_standby = ((standby / total).to_f * 100).round(2)
        percentage_ready = ((ready / total).to_f * 100).round(2)
        percentage_processing = ((processing / total).to_f * 100).round(2)            
      else
        percentage_standby = 0
        percentage_ready = 0
        percentage_processing = 0        
      end  
      @use_ticks = _('Standby').html_safe  + "(" + percentage_standby.to_s + " %)" + '|' + _('Ready for operation').html_safe + "(" + percentage_ready.to_s + " %)" + '|' + _('Processing').html_safe + "(" + percentage_processing.to_s + " %)"
      @use_values = percentage_standby.to_s + ',' + percentage_ready.to_s + ',' + percentage_processing.to_s    
      @use_colors = @colors[0].to_s + '|' + @colors[1].to_s + '|' + @colors[2].to_s
      
      
      @use_shifts_ticks = _('Processing').html_safe + '|' + _('Ready for operation').html_safe  + '|' + _('Standby').html_safe + '|' + @mt_product.mt_use.description_3
      @use_shifts_ticks += '|' + _('Processing').html_safe + '|' + _('Ready for operation').html_safe  + '|' + _('Standby').html_safe + '|' + @mt_product.mt_use.description_2
      @use_shifts_ticks += '|' + _('Processing').html_safe + '|' + _('Ready for operation').html_safe  + '|' + _('Standby').html_safe + '|' + @mt_product.mt_use.description
      
      
      value_processing_total_1 = @use_shift_1_processing
      value_processing_total_2 = @use_shift_2_processing      
      value_processing_total_3 = @use_shift_3_processing

      value_ready_total_1 = @use_shift_1_ready
      value_ready_total_2 = @use_shift_2_ready      
      value_ready_total_3 = @use_shift_3_ready
      
      value_standby_total_1 = @use_shift_1_standby
      value_standby_total_2 = @use_shift_2_standby      
      value_standby_total_3 = @use_shift_3_standby
      
      tmp_shifts_1 = @mt_product.mt_use.working_days
      tmp_shifts_2 = @mt_product.mt_use.working_days_2      
      tmp_shifts_3 = @mt_product.mt_use.working_days_3

      lifetime = 0
      if @mt_product.mt_assessment
          lifetime = @mt_product.mt_assessment.lifetime
      end 

      @mt_product.mt_use_additional_energy_datas.each do |mt_use_additional_energy_data|
         excel_value_process = get_mt_excel_value(@mt_product.product.indicators.first, mt_use_additional_energy_data.mt_energy_process.name , "MATERIALS")
         value_processing_total_1 += mt_use_additional_energy_data.processing * lifetime * tmp_shifts_1 * excel_value_process * @mt_product.mt_use.hours_shift_processing
         value_processing_total_2 += mt_use_additional_energy_data.processing * lifetime * tmp_shifts_2 * excel_value_process * @mt_product.mt_use.hours_shift_processing_2         
         value_processing_total_3 += mt_use_additional_energy_data.processing * lifetime * tmp_shifts_3 * excel_value_process * @mt_product.mt_use.hours_shift_processing_3         
              
         value_ready_total_1 += mt_use_additional_energy_data.ready * lifetime * tmp_shifts_1 * excel_value_process * @mt_product.mt_use.hours_shift_ready
         value_ready_total_2 += mt_use_additional_energy_data.ready * lifetime * tmp_shifts_2 * excel_value_process * @mt_product.mt_use.hours_shift_ready_2
         value_ready_total_3 += mt_use_additional_energy_data.ready * lifetime * tmp_shifts_3 * excel_value_process * @mt_product.mt_use.hours_shift_ready_3
         
         value_standby_total_1 += mt_use_additional_energy_data.standby * lifetime * tmp_shifts_1 * excel_value_process * @mt_product.mt_use.hours_shift_standby
         value_standby_total_2 += mt_use_additional_energy_data.standby * lifetime * tmp_shifts_2 * excel_value_process * @mt_product.mt_use.hours_shift_standby_2
         value_standby_total_3 += mt_use_additional_energy_data.standby * lifetime * tmp_shifts_3 * excel_value_process * @mt_product.mt_use.hours_shift_standby_3               
      end            
                      
      @mt_product.mt_use_operating_resource_datas.each do |mt_use_operating_resource_data|
         excel_value_consumable = get_mt_excel_value(@mt_product.product.indicators.first, mt_use_operating_resource_data.mt_consumable.name , "USE")
         value_processing_total_1 += mt_use_operating_resource_data.processing * lifetime * tmp_shifts_1 * excel_value_consumable * @mt_product.mt_use.hours_shift_processing
         value_processing_total_2 += mt_use_operating_resource_data.processing * lifetime * tmp_shifts_2 * excel_value_consumable * @mt_product.mt_use.hours_shift_processing_2
         value_processing_total_3 += mt_use_operating_resource_data.processing * lifetime * tmp_shifts_3 * excel_value_consumable * @mt_product.mt_use.hours_shift_processing_3         
                  
         value_ready_total_1 += mt_use_operating_resource_data.ready * lifetime * tmp_shifts_1 * excel_value_consumable * @mt_product.mt_use.hours_shift_ready
         value_ready_total_2 += mt_use_operating_resource_data.ready * lifetime * tmp_shifts_2 * excel_value_consumable * @mt_product.mt_use.hours_shift_ready_2
         value_ready_total_3 += mt_use_operating_resource_data.ready * lifetime * tmp_shifts_3 * excel_value_consumable * @mt_product.mt_use.hours_shift_ready_3

         value_standby_total_1 += mt_use_operating_resource_data.standby * lifetime * tmp_shifts_1 * excel_value_consumable * @mt_product.mt_use.hours_shift_standby
         value_standby_total_2 += mt_use_operating_resource_data.standby * lifetime * tmp_shifts_2 * excel_value_consumable * @mt_product.mt_use.hours_shift_standby_2
         value_standby_total_3 += mt_use_operating_resource_data.standby * lifetime * tmp_shifts_3 * excel_value_consumable * @mt_product.mt_use.hours_shift_standby_3          
      end         
      
      shift_1 = value_processing_total_1 + value_ready_total_1 + value_standby_total_1
      shift_2 = value_processing_total_2 + value_ready_total_2 + value_standby_total_2
      shift_3 = value_processing_total_3 + value_ready_total_3 + value_standby_total_3
      
      @use_shifts_values = shift_1.to_s + ',' + value_standby_total_1.to_s + ',' + value_ready_total_1.to_s + ',' + value_processing_total_1.to_s   
      @use_shifts_values += ',' + shift_2.to_s + ',' + value_standby_total_2.to_s + ',' + value_ready_total_2.to_s + ',' + value_processing_total_2.to_s
      @use_shifts_values += ',' + shift_3.to_s + ',' + value_standby_total_3.to_s + ',' + value_ready_total_3.to_s + ',' + value_processing_total_3.to_s     
      
      @use_shifts_colors = @colors[0].to_s + '|' + @colors[0].to_s + '|' + @colors[0].to_s + '|' + @colors[0].to_s
      @use_shifts_colors += '|' + @colors[1].to_s + '|' + @colors[1].to_s + '|' + @colors[1].to_s + '|' + @colors[1].to_s
      @use_shifts_colors += '|' + @colors[2].to_s + '|' + @colors[2].to_s + '|' + @colors[2].to_s + '|' + @colors[2].to_s
      
      tmp_array = Array.new
      tmp_array << shift_3
      tmp_array << shift_2
      tmp_array << shift_1      
      @min_use_shifts = tmp_array.sort[0]
      if @min_use_shifts > 0 
         @min_use_shifts = 0
      end
      @max_use_shifts = tmp_array.sort.reverse[0] + 30          

      excel_value_process = get_mt_excel_value(@mt_product.product.indicators.first, @mt_product.mt_use.mt_energy_process.name, "MATERIALS")            
 
      tmp_shifts = 0
      tmp_shifts_processing = 0 
      tmp_shifts_ready = 0
      tmp_shifts_standby = 0            
      
      if @mt_product.mt_use.breakdown && @mt_product.mt_use.breakdown == 'shift1'
         tmp_shifts = @mt_product.mt_use.working_days
         tmp_shifts_processing = @mt_product.mt_use.hours_shift_processing 
         tmp_shifts_ready = @mt_product.mt_use.hours_shift_ready
         tmp_shifts_standby = @mt_product.mt_use.hours_shift_standby               
      end   
      if @mt_product.mt_use.breakdown && @mt_product.mt_use.breakdown == 'shift2'
         tmp_shifts = @mt_product.mt_use.working_days_2
         tmp_shifts_processing = @mt_product.mt_use.hours_shift_processing_2 
         tmp_shifts_ready = @mt_product.mt_use.hours_shift_ready_2
         tmp_shifts_standby = @mt_product.mt_use.hours_shift_standby_2               
      end   
      if @mt_product.mt_use.breakdown && @mt_product.mt_use.breakdown == 'shift3'
         tmp_shifts = @mt_product.mt_use.working_days_3         
         tmp_shifts_processing = @mt_product.mt_use.hours_shift_processing_3 
         tmp_shifts_ready = @mt_product.mt_use.hours_shift_ready_3
         tmp_shifts_standby = @mt_product.mt_use.hours_shift_standby_3               
      end               
      
      total = 0 
      
      @mt_product.mt_use_machine_subsystem_datas.each do |mt_use_machine_subsystem_data|
         value_processing =  mt_use_machine_subsystem_data.processing * lifetime * tmp_shifts * excel_value_process * tmp_shifts_processing
         value_ready = mt_use_machine_subsystem_data.ready * lifetime * tmp_shifts * excel_value_process * tmp_shifts_ready
         value_standby = mt_use_machine_subsystem_data.standby * lifetime * tmp_shifts * excel_value_process * tmp_shifts_standby
         value_total = value_processing + value_ready + value_standby
         total += value_total
      end      
      
      @use_machine_ticks = ''
      @use_machine_values = ''      
      @use_machine_colors = ''      
      index = 0
      @mt_product.mt_use_machine_subsystem_datas.each do |mt_use_machine_subsystem_data|
         value_processing =  mt_use_machine_subsystem_data.processing * lifetime * tmp_shifts * excel_value_process * tmp_shifts_processing
         value_ready = mt_use_machine_subsystem_data.ready * lifetime * tmp_shifts * excel_value_process * tmp_shifts_ready
         value_standby = mt_use_machine_subsystem_data.standby * lifetime * tmp_shifts * excel_value_process * tmp_shifts_standby
         value_total = value_processing + value_ready + value_standby      
      
         if @use_machine_ticks != ''
            @use_machine_ticks += "|"
            @use_machine_values += ","
            @use_machine_colors += "|"
         end
         percentage = ((value_total / total).to_f * 100).round(2)
         @use_machine_ticks += mt_use_machine_subsystem_data.mt_subsystem.name + "(" + percentage.to_s + " %)"
         @use_machine_values += percentage.to_s
         @use_machine_colors += @colors[index].to_s
         index = index + 1       
      end
      
      ###########################
      # END OF LIFE
      ###########################  

      endoflife_result = MtResult.find_by_mt_product_id_and_name_en(@mt_product.id, "END-OF-LIFE")
      endoflife_recycling_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Recycling", endoflife_result.id)
      endoflife_incineration_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Incineration", endoflife_result.id)      
      endoflife_landfill_result = MtResult.find_by_mt_product_id_and_name_en_and_parent_id(@mt_product.id, "Landfill", endoflife_result.id)      

      recycling_value = MtResultValue.find_by_mt_result_id(endoflife_recycling_result.id).value
      incineration_value = MtResultValue.find_by_mt_result_id(endoflife_incineration_result.id).value
      landfill_value = MtResultValue.find_by_mt_result_id(endoflife_landfill_result.id).value
      
      total = recycling_value + incineration_value + landfill_value
    
      @endoflife_ticks = _('Landfill').html_safe + '|' + _('Incineration').html_safe + '|' + _('Recycling').html_safe
      @endoflife_values = recycling_value.to_s + ',' + incineration_value.to_s + ',' + landfill_value.to_s    
      @endoflife_colors = @colors[0].to_s + '|' + @colors[1].to_s + '|' + @colors[2].to_s 

      tmp_array = Array.new
      tmp_array << recycling_value
      tmp_array << incineration_value
      tmp_array << landfill_value      
      @min_endoflife = tmp_array.sort[0]
      if @min_endoflife > 0 
         @min_endoflife = 0
      end
      
      @max_endoflife = tmp_array.sort.reverse[0] + 30     
      
  end
    
    
    
  def graphic



    @mt_product = MtProduct.find(params[:mt_result_id])
    @product = @mt_product.product
    @step = 2    
    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @mt_product.product.name, edit_product_url(@mt_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, mt_production_init_path(@mt_product)
    add_breadcrumb _("Graphic results").html_safe, mt_result_graphic_path(@product.mt_product)
         
    @detailed = false
    if @mt_product.mt_assessment && @mt_product.mt_assessment.assessment_type == 'detailed'
      @detailed = true
    end         
         
    if @detailed
       do_results_detailed
       generate_graphic_detailed
    else        
       do_results       
       generate_graphic      
    end 
     
    
    
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
    
    
    logger.info '** Summary **'
    logger.info 'area_efficiency_projected --> ' + area_efficiency_projected.to_s
    logger.info 'area_insolation_projected --> ' + area_insolation_projected.to_s
    logger.info 'area_performance_projected --> ' + area_performance_projected.to_s
    logger.info 'area_efficiency_optimization --> ' + area_efficiency_optimization.to_s
    logger.info 'bench_insolation --> ' + @ph_product.ph_specified.bench_insolation.to_s
    logger.info 'area_insolation_optimization --> ' + area_insolation_optimization.to_s
    logger.info 'area_performance_optimization --> ' + area_performance_optimization.to_s
    logger.info 'area_efficiency_improvement --> ' + @area_efficiency_improvement.to_s
    logger.info 'area_insolation_improvement --> ' + @area_insolation_improvement.to_s
    logger.info 'area_performance_improvement --> ' + @area_performance_improvement.to_s
    logger.info 'area_projected_improvement --> ' + @area_projected_improvement.to_s
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
   
    @mt_product = MtProduct.find(params[:mt_result_id])
    @product = @mt_product.product
    
    @detailed = false
    if @mt_product.mt_assessment && @mt_product.mt_assessment.assessment_type == 'detailed'
      @detailed = true
    end         
         
    if @detailed
       do_results_detailed
       generate_graphic_detailed
    else
       do_results
       generate_graphic
    end 
    
    
    
    save_path = Rails.root.join('pdfs','mt_report_' + @mt_product.id.to_s + '.pdf')    
    if File.exists?(save_path)
       File.delete(save_path)
    end
  
    pdf = WickedPdf.new.pdf_from_string(render_to_string(:template => '/mt_results/pdf.html.erb', :layout => false))
  

    File.open(save_path, 'wb') do |file|
      file << pdf
    end
    
    
    send_file save_path

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
   
   # ph_result framing
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

     respond_to do |format|
        format.html { redirect_to bp_result_graphic_path(@product.bp_product)}
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
        worksheet.write(0, 0, title, format_bold_right)
        worksheet.write(1, 0, title_2, format_bold_right)       
        product.indicators.each_with_index do |indicator, index|
          worksheet.write(0, index + 1, coder.decode(indicator.name), format_bold)  # cell B2   
          worksheet.write(1, index + 1, coder.decode(indicator.unit.gsub('<sub>','').gsub('</sub>','').gsub('<sup>','^').gsub('</sup>','')), format_bold)  # cell B2
        end
           
        first_node = MtResult.find(:all, :conditions => ["name_en=? and mt_product_id = ?", 'Total', product.mt_product.id]).first
        
        worksheet.write(2, 0, coder.decode("TOTAL"), format_bold_left)
        product.indicators.each_with_index do |indicator, index| 
          result_value = MtResultValue.find(:all, :conditions => ["mt_result_id=? and indicator_id=?", first_node.id, indicator.id]).first
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
         result_value = MtResultValue.find(:all, :conditions => ["mt_result_id=? and indicator_id=?", child.id, indicator.id]).first
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
    
    @mt_product_compare = MtProduct.find(params[:mt_product_id])
    @mt_product_compare_2 = MtProduct.find(params[:compareTo])
    #@st_product_2 = StProduct.find(params[:st_product_id])
    
    @product = @mt_product_compare.product
    @product_2 = @mt_product_compare_2.product
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
    
    @values_to_array = ""
    
    @mt_product = @mt_product_compare
    
    @detailed = false
    if @mt_product.mt_assessment && @mt_product.mt_assessment.assessment_type == 'detailed'
      @detailed = true
    end         
         
    if @detailed
       do_results_detailed
    else
       do_results
    end  
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
    @mt_product = @mt_product_compare_2
    
    @detailed = false
    if @mt_product.mt_assessment && @mt_product.mt_assessment.assessment_type == 'detailed'
      @detailed = true
    end         
         
    if @detailed
       do_results_detailed
    else
       do_results
    end  
    
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
    
    @mt_product = @mt_product_compare
    
  end  
end
