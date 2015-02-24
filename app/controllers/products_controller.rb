class ProductCreateException < Exception; end

class ProductsController < ApplicationController
  # GET /products
  # GET /products.xml
  def index
    ## CREATE DEFAULT PRODUCTS ELECTRONICS
    if current_user.has_any_electronic_product || current_user.has_sector('electronics')    
      if !current_user.default_products_electronics
       products = Product.find_all_by_sector_and_is_default_product("electronics", true)
       products.each do |product|
          product2 = duplicate_electronics(product)
          product2.name = product.name
          product2.user = current_user
          product2.is_default_product = false
          product2.save
       end
       current_user.default_products_electronics = true;
       current_user.save
      end
    end
    @query = params[:query]
    if @query
      @products = Product.find(:all, :conditions => ["user_id = ? and (name like ? or organisation like ?)", current_user.id, '%' + @query + '%', '%' + @query + '%']).paginate(:page => params[:page], :per_page => 10)
    else  
      @products = Product.find(:all, :conditions => ["user_id = ?" , current_user.id]).paginate(:page => params[:page], :per_page => 10)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  def duplicate_electronics(product)
     product2 = product.clone

     product.material_datas.each do |material_data|
        material_data2 = material_data.clone
        material_data2.product = product2
        material_data2.save
     end
     product.component_datas.each do |component_data|
        component_data2 = component_data.clone
        component_data2.product = product2
        component_data2.save
     end   
     product.manufacturing_datas.each do |manufacturing_data|
        manufacturing_data2 = manufacturing_data.clone
        manufacturing_data2.product = product2
        manufacturing_data2.save
     end
     product.process_datas.each do |process_data|
        process_data2 = process_data.clone
        process_data2.product = product2
        process_data2.save
     end
     product.packaging_distributions.each do |packaging_distribution|
        packaging_distribution2 = packaging_distribution.clone
        packaging_distribution2.product = product2
        packaging_distribution2.save
     end    
     product.transport_distributions.each do |transport_distribution|
        transport_distribution2 = transport_distribution.clone
        transport_distribution2.product = product2
        transport_distribution2.save
     end     
     product.consumption_uses.each do |consumption_use|
        consumption_use2 = consumption_use.clone
        consumption_use2.product = product2
        consumption_use2.save
     end  
     product.consumable_uses.each do |consumable_use|
        consumable_use2 = consumable_use.clone
        consumable_use2.product = product2
        consumable_use2.save
     end  
     product.repair_uses.each do |repair_use|
        repair_use2 = repair_use.clone
        repair_use2.product = product2
        repair_use2.save
     end
     product.reuse_end_of_lives.each do |reuse_end_of_life|
        reuse_end_of_life2 = reuse_end_of_life.clone
        reuse_end_of_life2.product = product2
        reuse_end_of_life2.save
     end
     product.recycling_end_of_lives.each do |reciclyng_end_of_life|
        reciclyng_end_of_life2 = reciclyng_end_of_life.clone
        reciclyng_end_of_life2.product = product2
        reciclyng_end_of_life2.save
     end
     product.transport_repair_datas.each do |transport_repair_data|
        transport_repair_data2 = transport_repair_data.clone
        transport_repair_data2.product = product2
        transport_repair_data2.save
     end
     if product.scenario
        scenario = product.scenario.clone
        scenario.product = product2
        scenario.save
     end    
     if product.use
        use = product.use.clone
        use.product = product2
        use.save
     end    
     if product.end_of_life
        end_of_life = product.end_of_life.clone
        end_of_life.product = product2
        end_of_life.save
     end    
     if product.data_quality
        data_quality = product.data_quality.clone
        data_quality.product = product2
        data_quality.save
     end    
     return product2    
    
  end

  def duplicate
   product = Product.find(params[:product_id])
   if product.sector == 'electronics'             
     product2 = duplicate_electronics(product)
     product2.name = 'Copy of ' + product.name
     product2.save
   end  
   if product.sector == 'renewable'
     product2 = product.clone
     product2.name = 'Copy of ' + product.name
     product2.ph_product = product.ph_product.clone     
     
     if product.ph_product.ph_basic_information
        ph_basic_information = product.ph_product.ph_basic_information.clone
        ph_basic_information.ph_product = product2.ph_product
        ph_basic_information.save
     end 

     if product.ph_product.ph_specified
        ph_specified = product.ph_product.ph_specified.clone
        ph_specified.ph_product = product2.ph_product
        ph_specified.save
     end 

     if product.ph_product.ph_intermediate_result
        ph_intermediate_result = product.ph_product.ph_intermediate_result.clone
        ph_intermediate_result.ph_product = product2.ph_product
        ph_intermediate_result.save
     end 

     if product.ph_product.ph_electric_component
        ph_electric_component = product.ph_product.ph_electric_component.clone
        ph_electric_component.ph_product = product2.ph_product
        ph_electric_component.save
     end 

     if product.ph_product.ph_maintenance
        ph_maintenance = product.ph_product.ph_maintenance.clone
        ph_maintenance.ph_product = product2.ph_product
        ph_maintenance.save
     end 

     if product.ph_product.ph_result
        ph_result = product.ph_product.ph_result.clone
        ph_result.ph_product = product2.ph_product
        ph_result.save
     end 

     if product.ph_product.ph_maintenance_result
        ph_maintenance_result = product.ph_product.ph_maintenance_result.clone
        ph_maintenance_result.ph_product = product2.ph_product
        ph_maintenance_result.save
     end 
   
     if product.ph_product.ph_embedded_result
        ph_embedded_result = product.ph_product.ph_embedded_result.clone
        ph_embedded_result.ph_product = product2.ph_product
        ph_embedded_result.save
     end 
      
     product2.save
     product2.ph_product.save
    end

   if product.sector == 'bio_based'
     product2 = product.clone
     product2.name = 'Copy of ' + product.name
     product2.bp_product = product.bp_product.clone  
 
     product.bp_product.bp_material_datas.each do |bp_material_data|
        bp_material_data2 = bp_material_data.clone
        bp_material_data2.bp_product = product2.bp_product
        bp_material_data2.save
     end     
     
     product.bp_product.bp_compound_material_datas.each do |bp_compound_material_data|
        bp_compound_material_data2 = bp_compound_material_data.clone
        bp_compound_material_data2.bp_product = product2.bp_product
        bp_compound_material_data2.save
     end     
     
     product.bp_product.bp_transport_to_converter_datas.each do |bp_transport_to_converter_data|
        bp_transport_to_converter_data2 = bp_transport_to_converter_data.clone
        bp_transport_to_converter_data2.bp_product = product2.bp_product
        bp_transport_to_converter_data2.save
     end     
     
     product.bp_product.bp_transport_to_customer_datas.each do |bp_transport_to_customer_data|
        bp_transport_to_customer_data2 = bp_transport_to_customer_data.clone
        bp_transport_to_customer_data2.bp_product = product2.bp_product
        bp_transport_to_customer_data2.save
     end     

     product.bp_product.bp_manufacturing_datas.each do |bp_manufacturing_data|
        bp_manufacturing_data2 = bp_manufacturing_data.clone
        bp_manufacturing_data2.bp_product = product2.bp_product
        bp_manufacturing_data2.save
     end     

     product.bp_product.bp_packaging_datas.each do |bp_packaging_data|
        bp_packaging_data2 = bp_packaging_data.clone
        bp_packaging_data2.bp_product = product2.bp_product
        bp_packaging_data2.save
     end     


     product.bp_product.bp_manufacturing_transport_datas.each do |bp_manufacturing_transport_data|
        bp_manufacturing_transport_data2 = bp_manufacturing_transport_data.clone
        bp_manufacturing_transport_data2.bp_product = product2.bp_product
        bp_manufacturing_transport_data2.save
     end     

     if product.bp_product.bp_distribution_user_value
        bp_distribution_user_value = product.bp_product.bp_distribution_user_value.clone
        bp_distribution_user_value.bp_product = product2.bp_product
        bp_distribution_user_value.save
     end 

    if product.bp_product.bp_end_of_life_data
        bp_end_of_life_data = product.bp_product.bp_end_of_life_data.clone
        bp_end_of_life_data.bp_product = product2.bp_product
        bp_end_of_life_data.save
    end  
   
     product2.save
     product2.bp_product.save    
    
    end



  if product.sector == 'sensors'
     product2 = product.clone
     product2.name = 'Copy of ' + product.name
     product2.se_product = product.se_product.clone  
     
     if product.se_product.se_manufacturing
        se_manufacturing = product.se_product.se_manufacturing.clone
        se_manufacturing.se_product = product2.se_product
        se_manufacturing.save
     end  
    
     if product.se_product.se_use_production
        se_use_production = product.se_product.se_use_production.clone
        se_use_production.se_product = product2.se_product
        se_use_production.save
     end  
     
     if product.se_product.se_use_product
        se_use_product = product.se_product.se_use_product.clone
        se_use_product.se_product = product2.se_product
        se_use_product.save
     end  
     
     if product.se_product.se_use_consumption
        se_use_consumption = product.se_product.se_use_consumption.clone
        se_use_consumption.se_product = product2.se_product
        se_use_consumption.save
     end  

     if product.se_product.se_use_cost
        se_use_cost = product.se_product.se_use_cost.clone
        se_use_cost.se_product = product2.se_product
        se_use_cost.save
     end  

     if product.se_product.se_result
        se_result = product.se_product.se_result.clone
        se_result.se_product = product2.se_product
        se_result.save
     end  

     if product.se_product.se_data_quality
        se_data_quality = product.se_product.se_data_quality.clone
        se_data_quality.se_product = product2.se_product
        se_data_quality.save
     end  
 
     product.se_product.se_manufacturing_datas.each do |se_manufacturing_data|
        se_manufacturing_data2 = se_manufacturing_data.clone
        se_manufacturing_data2.se_product = product2.se_product
        se_manufacturing_data2.save
     end     
  
     product.se_product.se_recycling_datas.each do |se_recycling_data|
        se_recycling_data2 = se_recycling_data.clone
        se_recycling_data2.se_product = product2.se_product
        se_recycling_data2.save
     end     
  
     product.se_product.se_use_production_datas.each do |se_use_production_data|
        se_use_production_data2 = se_use_production_data.clone
        se_use_production_data2.se_product = product2.se_product
        se_use_production_data2.save
     end     
  
     product.se_product.se_use_product_datas.each do |se_use_product_data|
        se_use_product_data2 = se_use_product_data.clone
        se_use_product_data2.se_product = product2.se_product
        se_use_product_data2.save
     end     
   
     product.se_product.se_use_consumption_datas.each do |se_use_consumption_data|
        se_use_consumption_data2 = se_use_consumption_data.clone
        se_use_consumption_data2.se_product = product2.se_product
        se_use_consumption_data2.save
     end     

     product.se_product.se_use_consumption_consumable_datas.each do |se_use_consumption_consumable_data|
        se_use_consumption_consumable_data2 = se_use_consumption_consumable_data.clone
        se_use_consumption_consumable_data2.se_product = product2.se_product
        se_use_consumption_consumable_data2.save
     end     

     product.se_product.se_use_consumption_utility_datas.each do |se_use_consumption_utility_data|
        se_use_consumption_utility_data2 = se_use_consumption_utility_data.clone
        se_use_consumption_utility_data2.se_product = product2.se_product
        se_use_consumption_utility_data2.save
     end     
 
     product2.save
     product2.se_product.save    
    
    end    




  if product.sector == 'textiles'
     product2 = product.clone
     product2.name = 'Copy of ' + product.name
     product2.st_product = product.st_product.clone  
     
     if product.st_product.st_material_detail
        st_material_detail = product.st_product.st_material_detail.clone
        st_material_detail.st_product = product2.st_product
        st_material_detail.save
     end  
    
     if product.st_product.st_use
        st_use = product.st_product.st_use.clone
        st_use.st_product = product2.st_product
        st_use.save
     end  
    
     if product.st_product.st_end_of_life
        st_end_of_life = product.st_product.st_end_of_life.clone
        st_end_of_life.st_product = product2.st_product
        st_end_of_life.save
     end  
    
     if product.st_product.st_data_quality
        st_data_quality = product.st_product.st_data_quality.clone
        st_data_quality.st_product = product2.st_product
        st_data_quality.save
     end  
   
     product.st_product.st_material_datas.each do |st_material_data|
        st_material_data2 = st_material_data.clone
        st_material_data2.st_product = product2.st_product
        st_material_data2.save
     end     
 
     product.st_product.st_energy_datas.each do |st_energy_data|
        st_energy_data2 = st_energy_data.clone
        st_energy_data2.st_product = product2.st_product
        st_energy_data2.save
     end     

     product.st_product.st_process_datas.each do |st_process_data|
        st_process_data2 = st_process_data.clone
        st_process_data2.st_product = product2.st_product
        st_process_data2.save
     end     
  
     product.st_product.st_packaging_datas.each do |st_packaging_data|
        st_packaging_data2 = st_packaging_data.clone
        st_packaging_data2.st_product = product2.st_product
        st_packaging_data2.save
     end     
  
     product.st_product.st_transport_datas.each do |st_transport_data|
        st_transport_data2 = st_transport_data.clone
        st_transport_data2.st_product = product2.st_product
        st_transport_data2.save
     end     
  
     product.st_product.st_consumption_datas.each do |st_consumption_data|
        st_consumption_data2 = st_consumption_data.clone
        st_consumption_data2.st_product = product2.st_product
        st_consumption_data2.save
     end     
  
     product.st_product.st_consumable_datas.each do |st_consumable_data|
        st_consumable_data2 = st_consumable_data.clone
        st_consumable_data2.st_product = product2.st_product
        st_consumable_data2.save
     end     
  
 
     product2.save
     product2.st_product.save    
    
    end    



  # MACHINE TOOLS

  if product.sector == 'machine'
     product2 = product.clone
     product2.name = 'Copy of ' + product.name
     product2.mt_product = product.mt_product.clone  
     
     product.mt_product.mt_material_datas.each do |mt_material_data|
        mt_material_data2 = mt_material_data.clone
        mt_material_data2.mt_product = product2.mt_product
        mt_material_data2.save
     end      
     
     product.mt_product.mt_supplier_datas.each do |mt_supplier_data|
        mt_supplier_data2 = mt_supplier_data.clone
        mt_supplier_data2.mt_product = product2.mt_product
        mt_supplier_data2.save
     end      

     product.mt_product.mt_predefined_supplier_datas.each do |mt_predefined_supplier_data|
        mt_predefined_supplier_data2 = mt_predefined_supplier_data.clone
        mt_predefined_supplier_data2.mt_product = product2.mt_product
        mt_predefined_supplier_data2.save
     end      

     product.mt_product.mt_user_supplier_datas.each do |mt_user_supplier_data|
        mt_user_supplier_data2 = mt_user_supplier_data.clone
        mt_user_supplier_data2.mt_product = product2.mt_product
        mt_user_supplier_data2.save
     end      
  
     product.mt_product.mt_supplier_part_datas.each do |mt_supplier_part_data|
        mt_supplier_part_data2 = mt_supplier_part_data.clone
        mt_supplier_part_data2.mt_product = product2.mt_product
        mt_supplier_part_data2.save
     end      
  
     product.mt_product.mt_energy_datas.each do |mt_energy_data|
        mt_energy_data2 = mt_energy_data.clone
        mt_energy_data2.mt_product = product2.mt_product
        mt_energy_data2.save
     end      

     product.mt_product.mt_overhead_energy_datas.each do |mt_overhead_energy_data|
        mt_overhead_energy_data2 = mt_overhead_energy_data.clone
        mt_overhead_energy_data2.mt_product = product2.mt_product
        mt_overhead_energy_data2.save
     end      
  
     product.mt_product.mt_waste_energy_datas.each do |mt_waste_energy_data|
        mt_waste_energy_data2 = mt_waste_energy_data.clone
        mt_waste_energy_data2.mt_product = product2.mt_product
        mt_waste_energy_data2.save
     end      
 
     product.mt_product.mt_manufacturing_resource_datas.each do |mt_manufacturing_resource_data|
        mt_manufacturing_resource_data2 = mt_manufacturing_resource_data.clone
        mt_manufacturing_resource_data2.mt_product = product2.mt_product
        mt_manufacturing_resource_data2.save
     end      
  
     product.mt_product.mt_manufacturing_main_datas.each do |mt_manufacturing_main_data|
        mt_manufacturing_main_data2 = mt_manufacturing_main_data.clone
        mt_manufacturing_main_data2.mt_product = product2.mt_product
        mt_manufacturing_main_data2.save
     end      
  
     product.mt_product.mt_distribution_transport_datas.each do |mt_distribution_transport_data|
        mt_distribution_transport_data2 = mt_distribution_transport_data.clone
        mt_distribution_transport_data2.mt_product = product2.mt_product
        mt_distribution_transport_data2.save
     end      

     product.mt_product.mt_distribution_packaging_datas.each do |mt_distribution_packaging_data|
        mt_distribution_packaging_data2 = mt_distribution_packaging_data.clone
        mt_distribution_packaging_data2.mt_product = product2.mt_product
        mt_distribution_packaging_data2.save
     end      

     product.mt_product.mt_use_additional_energy_datas.each do |mt_use_additional_energy_data|
        mt_use_additional_energy_data2 = mt_use_additional_energy_data.clone
        mt_use_additional_energy_data2.mt_product = product2.mt_product
        mt_use_additional_energy_data2.save
     end      

     product.mt_product.mt_use_operating_resource_datas.each do |mt_use_operating_resource_data|
        mt_use_operating_resource_data2 = mt_use_operating_resource_data.clone
        mt_use_operating_resource_data2.mt_product = product2.mt_product
        mt_use_operating_resource_data2.save
     end      
  
     product.mt_product.mt_use_machine_subsystem_datas.each do |mt_use_machine_subsystem_data|
        mt_use_machine_subsystem_data2 = mt_use_machine_subsystem_data.clone
        mt_use_machine_subsystem_data2.mt_product = product2.mt_product
        mt_use_machine_subsystem_data2.save
     end      

     product.mt_product.mt_end_of_life_datas.each do |mt_end_of_life_data|
        mt_end_of_life_data2 = mt_end_of_life_data.clone
        mt_end_of_life_data2.mt_product = product2.mt_product
        mt_end_of_life_data2.save
     end      

     if product.mt_product.mt_assessment
        mt_assessment = product.mt_product.mt_assessment.clone
        mt_assessment.mt_product = product2.mt_product
        mt_assessment.save
     end  

     if product.mt_product.mt_manufacturing
        mt_manufacturing = product.mt_product.mt_manufacturing.clone
        mt_manufacturing.mt_product = product2.mt_product
        mt_manufacturing.save
     end  
    
     if product.mt_product.mt_distribution
        mt_distribution = product.mt_product.mt_distribution.clone
        mt_distribution.mt_product = product2.mt_product
        mt_distribution.save
     end  

     if product.mt_product.mt_use
        mt_use = product.mt_product.mt_use.clone
        mt_use.mt_product = product2.mt_product
        mt_use.save
     end  

     if product.mt_product.mt_end_of_life
        mt_end_of_life = product.mt_product.mt_end_of_life.clone
        mt_end_of_life.mt_product = product2.mt_product
        mt_end_of_life.save
     end  

     if product.mt_product.mt_data_quality
        mt_data_quality = product.mt_product.mt_data_quality.clone
        mt_data_quality.mt_product = product2.mt_product
        mt_data_quality.save
     end  

     product2.save
     product2.mt_product.save    
    
    end    

    # PCB
    if product.sector == 'printed'
       product2 = product.clone
       product2.name = 'Copy of ' + product.name
       product2.pc_product = product.pc_product.clone  
     
       if product.pc_product.pc_basic
          pc_basic = product.pc_product.pc_basic.clone
          pc_basic.pc_product = product2.pc_product
          pc_basic.save
       end       
     
       product2.save
       product2.pc_product.save        
     
    end  
   respond_to do |format|       
      format.html { redirect_to(products_url) }
    end  
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @edit_flag = true
  end

  # POST /products
  # POST /products.xml
  def create
    redirect_url = products_url
    Product.transaction do
      begin
        @product = Product.new(params[:product])
        @product.user = current_user
        @product.step = 1

        if @product.save
          if @product.sector == 'bio_based'
            @bp_product = BpProduct.new
            @bp_product.product_id = @product.id
            unless @bp_product.save
              raise ProductCreateException
            end  
            redirect_url = bp_production_url(@bp_product)
          end
          if @product.sector == 'renewable'
            @ph_product = PhProduct.new
            @ph_product.product_id = @product.id
            unless @ph_product.save
              raise ProductCreateException
            end  
            redirect_url = ph_basic_information_path(@ph_product)
          end

          if @product.sector == 'sensors'
            @se_product = SeProduct.new
            @se_product.product_id = @product.id
            unless @se_product.save
              raise ProductCreateException
            end  
            redirect_url = se_manufacturing_path(@se_product)
          end

          if @product.sector == 'textiles'
            @st_product = StProduct.new
            @st_product.product_id = @product.id
            unless @st_product.save
              raise ProductCreateException
            end
            redirect_url = st_material_detail_path(@st_product)          
          end

          if @product.sector == 'machine'
            @mt_product = MtProduct.new
            @mt_product.product_id = @product.id
            unless @mt_product.save
              raise ProductCreateException
            end
            redirect_url = mt_assessment_url(@mt_product)
          end

          if @product.sector == 'printed'
            @pc_product = PcProduct.new
            @pc_product.product_id = @product.id
            unless @pc_product.save
              raise ProductCreateException
            end
            redirect_url = pc_basic_url(@pc_product)
          end
          if @product.sector == 'electronics'
            redirect_url = scenario_url(@product)
          end          
          
          
          respond_to do |format|
            format.html { redirect_to(redirect_url )}
            format.xml  { render :xml => @product, :status => :created, :location => @product }
          end  
        else
          raise ProductCreateException
        end  
      rescue ProductCreateException
    #    flash.now[:notice] = "Product was unsuccessfully created"
        respond_to do |format|
          format.html { render :action => "new" }
          format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
        end 
      end
    end    
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])
    redirect_url = products_url    

    if @product.sector == 'electronics'
      redirect_url = scenario_url(@product)
    end
    if @product.sector == 'bio_based'
      redirect_url = bp_production_url(@product.bp_product)
    end
    if @product.sector == 'renewable'
      redirect_url = ph_basic_information_path(@product.ph_product)
    end

    if @product.sector == 'sensors'
      redirect_url = se_manufacturing_path(@product.se_product)
    end

    if @product.sector == 'textiles'
      redirect_url = st_material_detail_path(@product.st_product)          
    end

    if @product.sector == 'machine'
      redirect_url = mt_raw_material_path(@product.mt_product)
    end

    if @product.sector == 'printed'
      redirect_url = pc_basic_url(@product.pc_product)
    end    
    
    if params[:from_indicators]
       params[:product][:indicator_ids] ||= []       
    end

    respond_to do |format|
      if @product.update_attributes(params[:product])
        if params[:from_indicators]
           redirect_url = '/product_results/' + @product.id.to_s + "?result_type=" + params[:result_type]
           format.html { redirect_to redirect_url }
        else
          if params[:from_bp_indicators] 
             format.html { redirect_to(bp_result_url(@product.bp_product)) }
          else      
             if params[:from_pc_indicators] 
                return_url = ''
                if params[:arrow]
                   if params[:arrow] == 'next'
                      return_url = pc_result_path(@product.pc_product)     
                   end
                   if params[:arrow] == 'previous'
                      return_url = pc_basic_path(@product.pc_product)
                   end      
                end
                format.html { redirect_to(return_url) }           
             else
               format.html { redirect_to(redirect_url) }
             end  
          end   
        end  
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
  
  def update_comments
      value = params[:update_value]      
      type_update = params[:type]      
      product_id = params[:product_id]      
      product = Product.find(product_id)
      if type_update == 'kepi_explanation'
         product.kepi_explanation = value
         product.save
      end
      if type_update == 'comparison_comments'
         product.comparison_comments = value
         product.save      
      end
      if type_update == 'production_comments'
         product.production_comments = value
         product.save      
      end
      if type_update == 'use_comments'
         product.use_comments = value
         product.save      
      end
      
      respond_to do |format|
        format.html {render :inline => value}
        format.xml  { head :ok }
      end
  end      
  
  
end
