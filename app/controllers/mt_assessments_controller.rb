class MtAssessmentsController < ApplicationController
  # GET /mt_assessments
  # GET /mt_assessments.xml
  def index
    @mt_assessments = MtAssessment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mt_assessments }
    end
  end

  # GET /mt_assessments/1
  # GET /mt_assessments/1.xml
  def show
    @mt_product = MtProduct.find(params[:id])
    @product = @mt_product.product

    add_breadcrumb _("My products").html_safe, :products_url
    add_breadcrumb @mt_product.product.name, edit_product_url(@product)
    add_breadcrumb _("Environmental Assessment").html_safe, mt_production_init_path(@mt_product)
    add_breadcrumb _("Data entry").html_safe, mt_raw_material_url(@mt_product)

    if @mt_product
     # @step = 1
      if !@mt_product.mt_assessment
        mt_assessment = MtAssessment.new
        mt_assessment.mt_product_id = @mt_product.id
        mt_assessment.save
        @mt_product.mt_assessment = mt_assessment
      end

      #@se_use_consumption = @se_product.se_use_consumption
      @mt_assessment = @mt_product.mt_assessment
      @mt_product_types = MtProductType.all
     
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @mt_assessment }
      end
    end
  end

  # GET /mt_assessments/new
  # GET /mt_assessments/new.xml
  def new
    @mt_assessment = MtAssessment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mt_assessment }
    end
  end

  # GET /mt_assessments/1/edit
  def edit
    @mt_assessment = MtAssessment.find(params[:id])
  end

  # POST /mt_assessments
  # POST /mt_assessments.xml
  def create
    @mt_assessment = MtAssessment.new(params[:mt_assessment])

    respond_to do |format|
      if @mt_assessment.save
        format.html { redirect_to(@mt_assessment) }
        format.xml  { render :xml => @mt_assessment, :status => :created, :location => @mt_assessment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mt_assessment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mt_assessments/1
  # PUT /mt_assessments/1.xml
  def update
    @mt_assessment = MtAssessment.find(params[:id])

    respond_to do |format|
      if @mt_assessment.update_attributes(params[:mt_assessment])
        format.html { redirect_to( mt_raw_material_path(@mt_assessment.mt_product) ) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mt_assessment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mt_assessments/1
  # DELETE /mt_assessments/1.xml
  def destroy
    @mt_assessment = MtAssessment.find(params[:id])
    @mt_assessment.destroy

    respond_to do |format|
      format.html { redirect_to(mt_assessments_url) }
      format.xml  { head :ok }
    end
  end
end
