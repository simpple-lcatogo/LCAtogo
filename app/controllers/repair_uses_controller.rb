class RepairUsesController < ApplicationController
  # GET /repair_uses
  # GET /repair_uses.xml
  def index
    @repair_uses = RepairUse.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @repair_uses }
    end
  end

  # GET /repair_uses/1
  # GET /repair_uses/1.xml
  def show
    @repair_use = RepairUse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @repair_use }
    end
  end

  # GET /repair_uses/new
  # GET /repair_uses/new.xml
  def new
    @repair_use = RepairUse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @repair_use }
    end
  end

  # GET /repair_uses/1/edit
  def edit
    @repair_use = RepairUse.find(params[:id])
  end

  # POST /repair_uses
  # POST /repair_uses.xml
  def create
    @repair_use = RepairUse.new(params[:repair_use])
    @product = Product.find(params[:product_id])
    @repair_use.product = @product
    
    respond_to do |format|
      if @repair_use.save
        format.js  { render :action => "create_repair" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @repair_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /repair_uses/1
  # PUT /repair_uses/1.xml
  def update
    @repair_use = RepairUse.find(params[:id])

    respond_to do |format|
      if @repair_use.update_attributes(params[:repair_use])
        format.html { redirect_to(@repair_use, :notice => 'Repair use was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @repair_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /repair_uses/1
  # DELETE /repair_uses/1.xml
  def destroy
    @repair_use = RepairUse.find(params[:id])
    @repair_use.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_repair" }
    end
  end
  
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end 
  
  def update_values
      value = params[:update_value]
      if is_a_number?value
         repair_use_id = params[:repair_use_id]
         @repair_use = RepairUse.find(repair_use_id)
         @repair_use.quantity = value
         @repair_use.save
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
