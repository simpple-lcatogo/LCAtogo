class ConsumableUsesController < ApplicationController
  # GET /consumable_uses
  # GET /consumable_uses.xml
  def index
    @consumable_uses = ConsumableUse.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consumable_uses }
    end
  end

  # GET /consumable_uses/1
  # GET /consumable_uses/1.xml
  def show
    @consumable_use = ConsumableUse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consumable_use }
    end
  end

  # GET /consumable_uses/new
  # GET /consumable_uses/new.xml
  def new
    @consumable_use = ConsumableUse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consumable_use }
    end
  end

  # GET /consumable_uses/1/edit
  def edit
    @consumable_use = ConsumableUse.find(params[:id])
  end

  # POST /consumable_uses
  # POST /consumable_uses.xml
  def create
    @consumable_use = ConsumableUse.new(params[:consumable_use])

    respond_to do |format|
      if @consumable_use.save
        format.js  { render :action => "create_consumable" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @consumable_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consumable_uses/1
  # PUT /consumable_uses/1.xml
  def update
    @consumable_use = ConsumableUse.find(params[:id])

    respond_to do |format|
      if @consumable_use.update_attributes(params[:consumable_use])
        format.html { redirect_to(@consumable_use, :notice => 'Consumable use was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consumable_use.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consumable_uses/1
  # DELETE /consumable_uses/1.xml
  def destroy
    @consumable_use = ConsumableUse.find(params[:id])
    @consumable_use.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_consumable" }
    end
  end
end
