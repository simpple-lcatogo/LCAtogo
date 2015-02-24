class RecyclingEndOfLivesController < ApplicationController
  # GET /recycling_end_of_lives
  # GET /recycling_end_of_lives.xml
  def index
    @recycling_end_of_lives = RecyclingEndOfLife.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recycling_end_of_lives }
    end
  end

  # GET /recycling_end_of_lives/1
  # GET /recycling_end_of_lives/1.xml
  def show
    @recycling_end_of_life = RecyclingEndOfLife.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recycling_end_of_life }
    end
  end

  # GET /recycling_end_of_lives/new
  # GET /recycling_end_of_lives/new.xml
  def new
    @recycling_end_of_life = RecyclingEndOfLife.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recycling_end_of_life }
    end
  end

  # GET /recycling_end_of_lives/1/edit
  def edit
    @recycling_end_of_life = RecyclingEndOfLife.find(params[:id])
  end

  # POST /recycling_end_of_lives
  # POST /recycling_end_of_lives.xml
  def create
    @recycling_end_of_life = RecyclingEndOfLife.new(params[:recycling_end_of_life])
    @product = Product.find(params[:product_id])
    @recycling_end_of_life.product = @product
    
    respond_to do |format|
      if @recycling_end_of_life.save
        format.js  { render :action => "create_recycling" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recycling_end_of_life.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recycling_end_of_lives/1
  # PUT /recycling_end_of_lives/1.xml
  def update
    @recycling_end_of_life = RecyclingEndOfLife.find(params[:id])

    respond_to do |format|
      if @recycling_end_of_life.update_attributes(params[:recycling_end_of_life])
        format.html { redirect_to(@recycling_end_of_life, :notice => 'Recycling end of life was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recycling_end_of_life.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recycling_end_of_lives/1
  # DELETE /recycling_end_of_lives/1.xml
  def destroy
    @recycling_end_of_life = RecyclingEndOfLife.find(params[:id])
    @recycling_end_of_life.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_recycling" }      
    end
  end
  
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end    
  
  def update_values
      value = params[:update_value]
      if is_a_number?value
         recycling_end_of_life_id = params[:recycling_end_of_life_id]
         @recycling_end_of_life = RecyclingEndOfLife.find(recycling_end_of_life_id)
         @recycling_end_of_life.quantity = value
         @recycling_end_of_life.save
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
