class ConsumptionUsesController < ApplicationController
  # GET /consumption_uses
  # GET /consumption_uses.xml
  def index
    @consumption_uses = ConsumptionUse.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consumption_uses }
    end
  end

  # GET /consumption_uses/1
  # GET /consumption_uses/1.xml
  def show
    @consumption_use = ConsumptionUse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consumption_use }
    end
  end

  # GET /consumption_uses/new
  # GET /consumption_uses/new.xml
  def new
    @consumption_use = ConsumptionUse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consumption_use }
    end
  end

  # GET /consumption_uses/1/edit
  def edit
    @consumption_use = ConsumptionUse.find(params[:id])
  end

  # POST /consumption_uses
  # POST /consumption_uses.xml
  def create
    @consumption_use = ConsumptionUse.new(params[:consumption_use])
    @product = Product.find(params[:product_id])
    @consumption_use.product = @product

    total = 0
    consumption_uses = ConsumptionUse.find_all_by_product_id(@product.id)
    consumption_uses.each do |consumption_use|
      total += consumption_use.time_mode
    end

    if total < 100
        respond_to do |format|
          if @consumption_use.save
            format.js  { render :action => "create_consumption" }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => @consumption_use.errors, :status => :unprocessable_entity }
          end
        end
    else
      @over_total = true
      respond_to do |format|          
          format.js  { render :action => "create_consumption" }
      end   
    end  
  end

  # PUT /consumption_uses/1
  # PUT /consumption_uses/1.xml
  def update
    @consumption_use = ConsumptionUse.find(params[:id])

    respond_to do |format|
      if @consumption_use.update_attributes(params[:consumption_use])
        format.html { redirect_to(@consumption_use, :notice => 'Consumption use was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consumption_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consumption_uses/1
  # DELETE /consumption_uses/1.xml
  def destroy
    @consumption_use = ConsumptionUse.find(params[:id])
    @consumption_use.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_consumption" }
    end
  end
  
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end   
  
  def update_consumption
      value = params[:update_value]
      if is_a_number?value
         consumption_use_id = params[:consumption_use_id]
         @consumption_use = ConsumptionUse.find(consumption_use_id)
         @consumption_use.consumption = value
         @consumption_use.save
         respond_to do |format|
           format.html {render :inline => value}
           format.xml  { head :ok }
         end
      else
         respond_to do |format|
           format.html {render :inline => params[:original_value]}
           format.xml  { head :ok }
         end      
      end
  end        

  def update_timemode
      value = params[:update_value]
      if is_a_number?value
         consumption_use_id = params[:consumption_use_id]
         @consumption_use = ConsumptionUse.find(consumption_use_id)
         @consumption_use.time_mode = value
         @consumption_use.save
         respond_to do |format|                  
           format.html {render :inline => value}
           format.xml  { head :ok }
         end
      else
         respond_to do |format|
           format.html {render :inline => params[:original_value]}          
           format.xml  { head :ok }
         end      
      end
  end        
  
  
end
