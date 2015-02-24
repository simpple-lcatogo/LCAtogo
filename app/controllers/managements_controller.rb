class ManagementsController < ApplicationController
  skip_before_filter :authenticate_user!  
  
  def index
    @excel_values = ExcelValue.all
  end
  
  def show    
  end
  
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end  
  
  def update_values
      value = params[:update_value]
      if is_a_number?value
         excel_value_id = params[:excel_value_id]
         excel_value = ExcelValue.find(excel_value_id)
         excel_value_users = excel_value.excel_value_users.find(:all, :conditions => ["user_id = ?", current_user.id])
         if excel_value_users.first
            excel_value_users.first.value = value
            excel_value_users.first.save
         else
            ExcelValueUser.create(:user_id => current_user.id, :excel_value_id => excel_value_id, :value => value)
         end
         
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