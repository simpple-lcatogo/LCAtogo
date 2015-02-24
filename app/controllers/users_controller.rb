class UsersController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:confirmation]
  # GET /users
  # GET /users.xml
  def index
    if current_user.admin? || current_user.email == "dom@edcw.org" || current_user.email == "jude@edcw.org" || current_user.email == "richard@edcw.org"
      @users = User.find(:all, :conditions => ["sign_in_count > 0"])
      #@countries = Country.all
      respond_to do |format|
        format.html
        format.xml  { render :xml => @users }
      end
    else
       respond_to do |format|
          format.html { redirect_to(products_url) }
          format.xml { head :ok }
       end        
    end
  end

  def confirmation_alert
    logger.info 'sending confirmation_alert'
    respond_to do |format|
       format.html 
    end        
    
  end

  def generate_excel 
    coder = HTMLEntities.new    
    workbook = WriteExcel.new('Webtool_users.xls')
    worksheet  = workbook.add_worksheet
    worksheet.set_column('A:AR', 40)
    format_bold = workbook.add_format
    format_bold.set_bold
    format_bold.set_color('black')
    format_bold.set_align('center')
    format_bold.set_bg_color('gray')
    format_bold.set_border(1)
    format_bold.set_border_color('black')     
    format = workbook.add_format
    format.set_color('black')
    format.set_align('left')
    format.set_border(1)
    format.set_border_color('black')
   
    worksheet.write(0, 0, coder.decode(_('Name')), format_bold) 
    worksheet.write(0, 1, coder.decode(_('Surname')), format_bold)
    worksheet.write(0, 2, coder.decode(_('E-mail')), format_bold)
    worksheet.write(0, 3, coder.decode(_('Organization')), format_bold)    
    worksheet.write(0, 4, coder.decode(_('Main activity')), format_bold)
    worksheet.write(0, 5, coder.decode(_('Other main activity answer')), format_bold)
    worksheet.write(0, 6, coder.decode(_('Default industrial sector')), format_bold)
    worksheet.write(0, 7, coder.decode(_('Postal address')), format_bold)
    worksheet.write(0, 8, coder.decode(_('Country')), format_bold)
    worksheet.write(0, 9, coder.decode(_('Default language')), format_bold)


    worksheet.write(0, 10, coder.decode(_('Last login')), format_bold)
    worksheet.write(0, 11, coder.decode(_('Number of logins')), format_bold)
    worksheet.write(0, 12, coder.decode(_('Number of products')), format_bold)    



    worksheet.write(0, 13, coder.decode(_('Access bio-plastics')), format_bold)
    worksheet.write(0, 14, coder.decode(_('Access industrial')), format_bold)
    worksheet.write(0, 15, coder.decode(_('Access electronics')), format_bold)
    worksheet.write(0, 16, coder.decode(_('Access printed')), format_bold)
    worksheet.write(0, 17, coder.decode(_('Access photovoltaics')), format_bold)
    worksheet.write(0, 18, coder.decode(_('Access semiconductors')), format_bold)
    worksheet.write(0, 19, coder.decode(_('Access sensors')), format_bold)
    worksheet.write(0, 20, coder.decode(_('Access smart')), format_bold)

    worksheet.write(0, 21, coder.decode(_('Q1_lca')), format_bold)
    worksheet.write(0, 22, coder.decode(_('Q1_carbon_footprint')), format_bold)
    worksheet.write(0, 23, coder.decode(_('Q1_ecodesing')), format_bold)
    worksheet.write(0, 24, coder.decode(_('Q1_neither')), format_bold)
    worksheet.write(0, 25, coder.decode(_('Q1_other')), format_bold)
    worksheet.write(0, 26, coder.decode(_('Q1_other_user_answer')), format_bold)

    worksheet.write(0, 27, coder.decode(_('Q2_media')), format_bold)
    worksheet.write(0, 28, coder.decode(_('Q2_LCAwebsite')), format_bold)
    worksheet.write(0, 29, coder.decode(_('Q2_invitation')), format_bold)
    worksheet.write(0, 30, coder.decode(_('Q2_partner')), format_bold)
    worksheet.write(0, 31, coder.decode(_('Q2_referred')), format_bold)
    worksheet.write(0, 32, coder.decode(_('Q2_other')), format_bold)
    worksheet.write(0, 33, coder.decode(_('Q2_other_user_answer')), format_bold)

    worksheet.write(0, 34, coder.decode(_('Q3_reporting')), format_bold)
    worksheet.write(0, 35, coder.decode(_('Q3_increase_sales')), format_bold)
    worksheet.write(0, 36, coder.decode(_('Q3_reduce_cost')), format_bold)
    worksheet.write(0, 37, coder.decode(_('Q3_environmental_regulation')), format_bold)
    worksheet.write(0, 38, coder.decode(_('Q3_environmental_performance')), format_bold)
    worksheet.write(0, 39, coder.decode(_('Q3_personal_knowledge')), format_bold)
    worksheet.write(0, 40, coder.decode(_('Q3_organisation_knowledge')), format_bold)
    worksheet.write(0, 41, coder.decode(_('Q3_other')), format_bold)
    worksheet.write(0, 42, coder.decode(_('Q3_other_user_answer')), format_bold)

    worksheet.write(0, 43, coder.decode(_('Free training')), format_bold)

    
    @users = User.find(:all, :conditions => ["sign_in_count > 0"])
      @users.each_with_index do |user, index|
        index += 1

        worksheet.write(index, 0, user.name, format)
        worksheet.write(index, 1, user.surname, format)
        worksheet.write(index, 2, user.email, format)
        worksheet.write(index, 3, user.organization, format)
          if user.activity
            if user.activity == "manufacturing_production"
              worksheet.write(index, 4, coder.decode(_('Manufacturing / Production')) , format)
            elsif user.activity == "services_private_sector"
              worksheet.write(index, 4, coder.decode(_('Services - private sector')) , format)
            elsif user.activity == "services_public_sector"
              worksheet.write(index, 4, coder.decode(_('Services - public sector')) , format)
            elsif user.activity == "academic_research"
              worksheet.write(index, 4, coder.decode(_('Academic / Research')) , format)
            elsif user.activity == "other"
              worksheet.write(index, 4, coder.decode(_('Other (please specify)')) , format)
              worksheet.write(index, 5, user.other_main_activity , format)
            else
              worksheet.write(index, 4, coder.decode(_('unknown')) , format)
            end
          end


          if user.sector
            if user.sector == "bio_based"
              worksheet.write(index, 6, coder.decode(_('Bio-based plastics')) , format)
            elsif user.sector == "industrial"
              worksheet.write(index, 6, coder.decode(_('Industrial machines')) , format)
            elsif user.sector == "electronics"
              worksheet.write(index, 6, coder.decode(_('Electronics')) , format)
            elsif user.sector == "printed"
              worksheet.write(index, 6, coder.decode(_('Printed Circuit Boards')) , format)
            elsif user.sector == "renewable"
              worksheet.write(index, 6, coder.decode(_('Renewable Energy - Photovoltaics')) , format)
            elsif user.sector == "semiconductors"
              worksheet.write(index, 6, coder.decode(_('Semiconductors')) , format)
            elsif user.sector == "sensors"
              worksheet.write(index, 6, coder.decode(_('Sensors')) , format)
            elsif user.sector == "textiles"
              worksheet.write(index, 6, coder.decode(_('Smart Textiles')) , format)
            else
              worksheet.write(index, 6, coder.decode(_('unknown')) , format)
            end
          end

        worksheet.write(index, 7, user.postal, format)

        if user.country
          worksheet.write(index, 8, user.country.name, format)
        else
          worksheet.write(index, 8, coder.decode(_('unknown')) , format)
        end

        worksheet.write(index, 9, user.language, format)

        if user.last_sign_in_at
          worksheet.write(index, 10, user.last_sign_in_at.strftime("%d/%m/%Y"), format)
        else
          worksheet.write(index, 10, "", format)
        end

        if user.sign_in_count
          worksheet.write(index, 11, user.sign_in_count, format)
        else
          worksheet.write(index, 11, "", format)
        end
        worksheet.write(index, 12, user.products.size, format)



        worksheet.write(index, 13, coder.decode(_('no')) , format)
        worksheet.write(index, 14, coder.decode(_('no')) , format)
        worksheet.write(index, 15, coder.decode(_('no')) , format)
        worksheet.write(index, 16, coder.decode(_('no')) , format)
        worksheet.write(index, 17, coder.decode(_('no')) , format)
        worksheet.write(index, 18, coder.decode(_('no')) , format)
        worksheet.write(index, 19, coder.decode(_('no')) , format)
        worksheet.write(index, 20, coder.decode(_('no')) , format)

        if user.sectors
          user.sectors.each do |s|
            if s.name == "bio_based"
              worksheet.write(index, 13, coder.decode(_('yes')) , format)
            elsif s.name =="industrial"
              worksheet.write(index, 14, coder.decode(_('yes')) , format)
            elsif s.name =="electronics"
              worksheet.write(index, 15, coder.decode(_('yes')) , format)
            elsif s.name =="printed"
              worksheet.write(index, 16, coder.decode(_('yes')) , format)
            elsif s.name =="renewable"
              worksheet.write(index, 17, coder.decode(_('yes')) , format)
            elsif s.name =="semiconductors"
              worksheet.write(index, 18, coder.decode(_('yes')) , format)
            elsif s.name =="sensors"
              worksheet.write(index, 19, coder.decode(_('yes')) , format)
            elsif s.name =="textiles"
              worksheet.write(index, 20, coder.decode(_('yes')) , format)
            end
          end
        end

        worksheet.write(index, 21, coder.decode(_('no')) , format)
        worksheet.write(index, 22, coder.decode(_('no')) , format)
        worksheet.write(index, 23, coder.decode(_('no')) , format)
        worksheet.write(index, 24, coder.decode(_('no')) , format)
        worksheet.write(index, 25, coder.decode(_('no')) , format)

        if user.user_first_answers
          user.user_first_answers.each do |fa|
            if fa.name == "LCA"
              worksheet.write(index, 21, coder.decode(_('yes')) , format)
            elsif fa.name == "Carbon Footprint"
              worksheet.write(index, 22, coder.decode(_('yes')) , format)
            elsif fa.name == "Ecodesign"
              worksheet.write(index, 23, coder.decode(_('yes')) , format)
            elsif fa.name == "Neither"
              worksheet.write(index, 24, coder.decode(_('yes')) , format)
            elsif fa.name == "Other (please specify)"
              worksheet.write(index, 25, coder.decode(_('yes')) , format)
              worksheet.write(index, 26, user.other_first_answer , format)
            end
          end
        end

        worksheet.write(index, 27, coder.decode(_('no')) , format)
        worksheet.write(index, 28, coder.decode(_('no')) , format)
        worksheet.write(index, 29, coder.decode(_('no')) , format)
        worksheet.write(index, 30, coder.decode(_('no')) , format)
        worksheet.write(index, 31, coder.decode(_('no')) , format)
        worksheet.write(index, 32, coder.decode(_('no')) , format)

        if user.user_second_answers
          user.user_second_answers.each do |sa|
            if sa.name == "In the media (trade press, journals, newspapers, blogs etc. online or in print)"
              worksheet.write(index, 27, coder.decode(_('yes')) , format)
            elsif sa.name == "Via the LCA to go website"
              worksheet.write(index, 28, coder.decode(_('yes')) , format)
            elsif sa.name == "I received an invitation to LCA to go"
              worksheet.write(index, 29, coder.decode(_('yes')) , format)
            elsif sa.name == "Personal contact with an LCA to go partner"
              worksheet.write(index, 30, coder.decode(_('yes')) , format)
            elsif sa.name == "Referred to LCA to go by another organisation"
              worksheet.write(index, 31, coder.decode(_('yes')) , format)
            elsif sa.name == "Other (please specify)"
              worksheet.write(index, 32, coder.decode(_('yes')) , format)
              worksheet.write(index, 33, user.other_second_answer , format)
            end
          end
        end

        worksheet.write(index, 34, coder.decode(_('no')) , format)
        worksheet.write(index, 35, coder.decode(_('no')) , format)
        worksheet.write(index, 36, coder.decode(_('no')) , format)
        worksheet.write(index, 37, coder.decode(_('no')) , format)
        worksheet.write(index, 38, coder.decode(_('no')) , format)
        worksheet.write(index, 39, coder.decode(_('no')) , format)
        worksheet.write(index, 40, coder.decode(_('no')) , format)
        worksheet.write(index, 41, coder.decode(_('no')) , format)

        if user.user_third_answers
          user.user_third_answers.each do |ta|
            if ta.name == "To feed into your organisation’s sustainable reporting"
              worksheet.write(index, 34, coder.decode(_('yes')) , format)
            elsif ta.name == "To increase sales/branding/marketing"
              worksheet.write(index, 35, coder.decode(_('yes')) , format)
            elsif ta.name == "To reduce costs"
              worksheet.write(index, 36, coder.decode(_('yes')) , format)
            elsif ta.name == "To adhere to environmental regulations"
              worksheet.write(index, 37, coder.decode(_('yes')) , format)
            elsif ta.name == "To make environmental performance improvements"
              worksheet.write(index, 38, coder.decode(_('yes')) , format)
            elsif ta.name == "To update your personal professional knowledge of LCA)"
              worksheet.write(index, 39, coder.decode(_('yes')) , format)
            elsif ta.name == "To update your organisation’s professional knowledge of LCA"
              worksheet.write(index, 40, coder.decode(_('yes')) , format)
            elsif ta.name == "Other (please specify)"
              worksheet.write(index, 41, coder.decode(_('yes')) , format)
              worksheet.write(index, 42, user.other_third_answer , format)
            end
          end
        end

        worksheet.write(index, 43, user.free_training, format)

    end
        # write to file
    workbook.close   
   
    send_file 'Webtool_users.xls'  
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      flash[:notice] = nil
      format.html
    end    
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(products_url, :notice => 'Registration successfull.') }
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end


  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
     #   format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        flash[:notice] = _('User was successfully updated.').html_safe
        format.html { render :action => "edit"}
        format.xml  { head :ok }
      else
        flash[:notice] = _('An error has ocurred.')
        format.html { render :action => "edit"}
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  def init
    if current_user.admin?
      respond_to do |format|
        format.html { redirect_to(users_url) }
        format.xml  { head :ok }
      end    
    else  
    respond_to do |format|
      format.html { redirect_to(intros_url) }
      format.xml  { head :ok }
    end
      
    end
  end
end
