class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :surname, :organization, :activity, :sector, :postal, :country, :language, :email,
                  :password, :password_confirmation, :remember_me, :phone, :country_id, :other_main_activity,
                  :user_first_answer_ids, :user_second_answer_ids, :user_third_answer_ids, :other_first_answer,
                  :other_second_answer, :other_third_answer, :free_training, :contact_info
  
  has_and_belongs_to_many :sectors
  has_and_belongs_to_many :user_first_answers
  has_and_belongs_to_many :user_second_answers
  has_and_belongs_to_many :user_third_answers

  belongs_to :country
  has_many :products
  
  def has_sector sector_name
    sectors.each do |sector|
      if sector.name == sector_name
         return true
      end
    end
    return false
  end
  
  def has_any_electronic_product
    products = Product.find_all_by_user_id(id)
    has_any = false
    products.each do |product|
      if product.sector == 'electronics'
        has_any = true
      end
    end
    return has_any
  end
  
end
