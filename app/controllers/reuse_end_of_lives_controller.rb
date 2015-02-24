class ReuseEndOfLivesController < ApplicationController
  # GET /reuse_end_of_lives
  # GET /reuse_end_of_lives.xml
  def index
    @reuse_end_of_lives = ReuseEndOfLife.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reuse_end_of_lives }
    end
  end

  # GET /reuse_end_of_lives/1
  # GET /reuse_end_of_lives/1.xml
  def show
    @reuse_end_of_life = ReuseEndOfLife.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reuse_end_of_life }
    end
  end

  # GET /reuse_end_of_lives/new
  # GET /reuse_end_of_lives/new.xml
  def new
    @reuse_end_of_life = ReuseEndOfLife.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reuse_end_of_life }
    end
  end

  # GET /reuse_end_of_lives/1/edit
  def edit
    @reuse_end_of_life = ReuseEndOfLife.find(params[:id])
  end

  # POST /reuse_end_of_lives
  # POST /reuse_end_of_lives.xml
  def create
    @reuse_end_of_life = ReuseEndOfLife.new(params[:reuse_end_of_life])
    @product = Product.find(params[:product_id])
    @reuse_end_of_life.product = @product
    
    respond_to do |format|
      if @reuse_end_of_life.save
        format.js  { render :action => "create_reuse" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reuse_end_of_life.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reuse_end_of_lives/1
  # PUT /reuse_end_of_lives/1.xml
  def update
    @reuse_end_of_life = ReuseEndOfLife.find(params[:id])

    respond_to do |format|
      if @reuse_end_of_life.update_attributes(params[:reuse_end_of_life])
        format.html { redirect_to(@reuse_end_of_life, :notice => 'Reuse end of life was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reuse_end_of_life.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reuse_end_of_lives/1
  # DELETE /reuse_end_of_lives/1.xml
  def destroy
    @reuse_end_of_life = ReuseEndOfLife.find(params[:id])
    @reuse_end_of_life.destroy

    respond_to do |format|
      format.js  { render :action => "destroy_reuse" } 
    end
  end
  
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end    
  
  def update_values
      value = params[:update_value]
      if is_a_number?value
         reuse_end_of_life_id = params[:reuse_end_of_life_id]
         @reuse_end_of_life = ReuseEndOfLife.find(reuse_end_of_life_id)
         @reuse_end_of_life.quantity = value
         @reuse_end_of_life.save
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
