class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :set_gettext_locale

  def get_product(product_id)
    begin 
       product = Product.find(product_id)
    rescue
      begin 
         product = Product.find(product_id.to_i)
      rescue
        
      end     
    end  

    if product.user.id != current_user.id
      nil
    else
      product
    end

  end

  def get_bp_product(bp_product_id)
    begin
       bp_product = BpProduct.find(bp_product_id)
    rescue
      begin
         bp_product = BpProduct.find(bp_product_id.to_i)
      rescue
      end
    end

    if bp_product.product.user.id != current_user.id
      nil           
    else
      bp_product      
    end  
  end

  def get_st_product(st_product_id)
    begin
      st_product = StProduct.find(st_product_id)
    rescue
      begin
        st_product = StProduct.find(st_product_id.to_i)
      rescue
      end
    end
    if st_product.product.user.id != current_user.id
      nil
    else
      st_product
    end
  end

  def get_mt_product(mt_product_id)
    begin
      mt_product = MtProduct.find(mt_product_id)
    rescue
      begin
        mt_product = MtProduct.find(mt_product_id.to_i)
      rescue
      end
    end
    if mt_product.product.user.id != current_user.id
      nil
    else
      mt_product
    end
  end

  def get_pc_product(pc_product_id)
    begin
      pc_product = PcProduct.find(pc_product_id)
    rescue
      begin
        pc_product = PcProduct.find(pc_product_id.to_i)
      rescue
      end
    end
    if pc_product.product.user.id != current_user.id
      nil
    else
      pc_product
    end
  end
  
  
  def require_user
    unless current_user
      store_location
      flash[:notice] = _("You must be logged in to access this page")
      redirect_to login_url
      return false
    end
  end     
  
  def store_location
    session[:return_to] = request.request_uri
  end 

  def is_numeric?(o)
    true if Float(o) rescue false
  end

  def set_gettext_locale
    if session[:locale_set].blank? && current_user
      I18n.locale = params[:locale]
      session[:locale_pc] = params[:locale]
      session[:locale] = I18n.locale = FastGettext.set_locale(current_user.language)
    end
    super
  end


end
