class PhIntermediateResultsController < ApplicationController
  # GET /ph_intermediate_results
  # GET /ph_intermediate_results.xml
  def index
    @ph_intermediate_results = PhIntermediateResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ph_intermediate_results }
    end
  end

  # GET /ph_intermediate_results/1
  # GET /ph_intermediate_results/1.xml
  def show
    @ph_product = PhProduct.find(params[:id])

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @ph_product.product.name, edit_product_url(@ph_product.product)
    add_breadcrumb _("Environmental Assessment").html_safe, ph_production_init_path(@ph_product)
    add_breadcrumb _("Data Entry").html_safe, ph_intermediate_result_path(@ph_product)
    
    if !@ph_product.ph_intermediate_result
        ph_intermediate_result = PhIntermediateResult.new 
        ph_intermediate_result.ph_product_id = @ph_product.id
        ph_intermediate_result.save
        @ph_product.ph_intermediate_result = ph_intermediate_result
    end
    @ph_intermediate_result = @ph_product.ph_intermediate_result
    @step = 3
    @product = @ph_product.product
    @ph_country_infos = PhCountryInfo.all

    # IF(AND(NOT(G19=$Menues.A7);$Menues.D42=$Assumptions.I17);"There are no limitations given. For an estimated power output, please see the report.";
    if @ph_product.ph_specified.ph_module_type.name != 'Not specified' && @ph_product.ph_basic_information.known == 'total_surface'
       @ph_intermediate_result.evaluation = _('There are no limitations given. For an estimated power output, please see the report.')
    end
    #IF(AND(NOT(G19=$Menues.A7);$Menues.D41=$Assumptions.I17);"There are no limitations given. For an estimated area demand, please see the report.";    
    if @ph_product.ph_specified.ph_module_type.name != 'Not specified' && @ph_product.ph_basic_information.known == 'power_demand'
       @ph_intermediate_result.evaluation = _('There are no limitations given. For an estimated area demand, please see the report.')
    end
    
    n49 = 0
    if @ph_product.ph_specified.ph_module_type.name != 'Not specified' && @ph_product.ph_basic_information.known != 'power_demand'
      n49 = @ph_product.ph_specified.area * @ph_product.ph_specified.area_unit.conversion_factor      
    end
    h101 = 0
    #  f38 = 1 #ToDo =IF(G19=$Menues.A7;0;F37*(1+($'Results Calcul.'.C87/100)))
    f38 = 0
    #=IF(G19=Menues!A7,0,F37*(1+('Results Calcul.'!C87/100)))
    
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
    
    
    if @ph_product.ph_specified.ph_module_type.name != 'Not specified'
       c87 = temp * (@ph_product.ph_basic_information.temperature - 25)  
       f38 = @ph_product.ph_specified.efficiency * (1 + c87 / 100)
    end
 
    if @ph_product.ph_specified.ph_module_type.name != 'Not specified'
       if @ph_product.ph_basic_information.known != 'total_surface'
         # 1/($Assumptions.I9*(($Assumptions.F38)/100)*(IF($Assumptions.I15=$Menues.O85;0,75;$Assumptions.I15)
          h101 = (1 / (@ph_product.ph_basic_information.radiation * (f38.to_f / 100.to_f).to_f * @ph_product.ph_basic_information.performance_ratio)).to_f
       end
    end 
    logger.error "h101 --> " + h101.to_s
    logger.error "f38 --> " + f38.to_s
    n56 = 0
    #=IF(NOT($Assumptions.I17=$Menues.D42);IF($Assumptions.E35=$Menues.G41;$Assumptions.D35*$Menues.E60;IF($Assumptions.E35=$Menues.G42;$Assumptions.D35;IF($Assumptions.E35=G43;$Menues.E59*$Assumptions.D35;IF($Assumptions.E35=$Menues.G44;$Menues.E58*$Assumptions.D35;IF($Assumptions.E35=$Menues.G45;$Menues.E61*$Assumptions.D35;0)))));0))
    if @ph_product.ph_specified.ph_module_type.name != 'Not specified'
       if @ph_product.ph_basic_information.known != 'total_surface'
          if !@ph_product.ph_specified.power_unit || @ph_product.ph_specified.power_unit.conversion_factor == -1
              # Peak Power [kWp]
              conversion_factor = @ph_product.ph_basic_information.radiation * @ph_product.ph_basic_information.performance_ratio
              n56 = @ph_product.ph_specified.power * conversion_factor
          else          
              n56 = @ph_product.ph_specified.power * @ph_product.ph_specified.power_unit.conversion_factor
          end    
       end
    end
    #=IF(NOT(H101=0);$Menues.N56*$'Results Calcul.'.H101;$Menues.N49)
    k101 = 0
    if h101 != 0 && n56 != 0
       k101 = n56 * h101
    else
       k101 = n49
    end
    
#    =IF(I17="Both";$'Results Calcul.'.K101;IF(G19=$Menues.A7;"See the report";IF(OR (NOT(G19=$Menues.A7) ; AND(OR(I17=$Menues.D42;I17=$Menues.D43);$Menues.A7=$Assumptions.G19));   IF(OR(I17=$Menues.D42;I17=$Menues.D43);IF(E33=$Menues.D50;D33;IF(E33=$Menues.D51;$Menues.E51*D33;IF(E33=$Menues.D52;$Menues.E52*D33;IF(E33=$Menues.D53;$Menues.E53*D33;0))));$'Results Calcul.'.K101);0)))

    if @ph_product.ph_basic_information.known == 'both'
       @ph_intermediate_result.module_area = k101
    else
        if @ph_product.ph_specified.ph_module_type.name == 'Not specified'
                logger.info "a3"
            @ph_intermediate_result.module_area = 0 # See the report
        else
            if @ph_product.ph_basic_information.known != 'power_demand'
               @ph_intermediate_result.module_area = @ph_product.ph_specified.area * @ph_product.ph_specified.area_unit.conversion_factor
            else
               @ph_intermediate_result.module_area = k101
            end
            logger.info "module_area --> " + @ph_intermediate_result.module_area.to_s
        end
    end
    
    @ph_intermediate_result.save
    # Peak Power    
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
    
    temperature_induced = temp * (@ph_product.ph_basic_information.temperature - 25)     
    calcul_efficiency = @ph_product.ph_specified.efficiency * (1 + (temperature_induced / 100))
    @peak_power = @ph_product.ph_intermediate_result.module_area * calcul_efficiency / 100
    
    @ph_product.tmp_peak = @peak_power
    
    if @ph_product.ph_basic_information.known == 'power_demand'
       lifetime = n56 * @ph_product.ph_specified.lifetime
    else
       lifetime = n49 * (calcul_efficiency  / 100) * @ph_product.ph_basic_information.performance_ratio * @ph_product.ph_basic_information.radiation * @ph_product.ph_specified.lifetime
    end  
    @averaged_power = lifetime / @ph_product.ph_specified.lifetime
    
    @ph_product.tmp_yearly = @averaged_power
    @ph_product.save
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ph_intermediate_result }
    end
  end

  # GET /ph_intermediate_results/new
  # GET /ph_intermediate_results/new.xml
  def new
    @ph_intermediate_result = PhIntermediateResult.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ph_intermediate_result }
    end
  end

  # GET /ph_intermediate_results/1/edit
  def edit
    @ph_intermediate_result = PhIntermediateResult.find(params[:id])
  end

  # POST /ph_intermediate_results
  # POST /ph_intermediate_results.xml
  def create
    @ph_intermediate_result = PhIntermediateResult.new(params[:ph_intermediate_result])

    respond_to do |format|
      if @ph_intermediate_result.save
        format.html { redirect_to(@ph_intermediate_result) }
        format.xml  { render :xml => @ph_intermediate_result, :status => :created, :location => @ph_intermediate_result }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ph_intermediate_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ph_intermediate_results/1
  # PUT /ph_intermediate_results/1.xml
  def update
    @ph_intermediate_result = PhIntermediateResult.find(params[:id])

    respond_to do |format|
      if @ph_intermediate_result.update_attributes(params[:ph_intermediate_result])
        format.html { redirect_to(ph_electric_component_path(@ph_intermediate_result.ph_product)) }        
     #   format.html { redirect_to(@ph_intermediate_result, :notice => 'Ph intermediate result was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ph_intermediate_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ph_intermediate_results/1
  # DELETE /ph_intermediate_results/1.xml
  def destroy
    @ph_intermediate_result = PhIntermediateResult.find(params[:id])
    @ph_intermediate_result.destroy

    respond_to do |format|
      format.html { redirect_to(ph_intermediate_results_url) }
      format.xml  { head :ok }
    end
  end
end
