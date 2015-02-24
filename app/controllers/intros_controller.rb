class IntrosController < ApplicationController
  skip_before_filter :authenticate_user!  
  
  def index
  end
  
  def show    
  end
  
  def confirmation_alert    
    @email = params[:email]
  end

  def error_duplicated_email
    @email = params[:email]
  end
end  