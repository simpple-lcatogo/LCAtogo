class BpEndOfLifeController < ApplicationController
  def show
   	@bp_product = get_bp_product(params[:id])#

    if @bp_product      
      @step = 5
      add_breadcrumb _("My products").html_safe, :products_url
      add_breadcrumb @bp_product.product.name, edit_product_url(@bp_product.product)
      add_breadcrumb _("Environmental Assessment").html_safe, bp_production_init_path(@bp_product)
      add_breadcrumb _("Data entry").html_safe, bp_production_url(@bp_product)

      if !@bp_product.bp_end_of_life_data
      	@bp_end_of_life_data = 	BpEndOfLifeData.new
        @bp_end_of_life_data.default_transport_distance = 25
      else	
      	@bp_end_of_life_data = @bp_product.bp_end_of_life_data
  	  end

      @bp_end_of_life_default_scenarios_section_1 = BpEndOfLifeDefaultScenario.where("section = ?",1)
      @bp_end_of_life_default_scenarios_section_2 = BpEndOfLifeDefaultScenario.where("section = ?",2)
      @bp_end_of_life_default_scenario_customized = BpEndOfLifeDefaultScenario.where("section = ?",9999)

      respond_to do |format|
        format.html # index.html.erb
      end
    else
     respond_to do |format|
        format.html { redirect_to(products_url) }
        format.xml { head :ok }
     end      
    end
  end

  def next_step
     @bp_product = BpProduct.find(params[:bp_product_id].to_i)

     if @bp_product.product.step < 6     
       @bp_product.product.step = 5
       @bp_product.product.save
     end      
    
     respond_to do |format|
        format.html { redirect_to bp_indicator_url(@bp_product)}
     end   
  end	

 def previous_step
     @bp_product = BpProduct.find(params[:bp_product_id].to_i)
     respond_to do |format|
        format.html { redirect_to bp_transport_to_customer_url(@bp_product)}
     end   
  end 

end
