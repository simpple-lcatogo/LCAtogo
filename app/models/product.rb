class Product < ActiveRecord::Base
  belongs_to :user
  
  has_many :material_datas
  has_many :component_datas  
  has_many :manufacturing_datas  
  has_many :process_datas
  has_many :packaging_distributions
  has_many :transport_distributions  
  has_many :consumption_uses
  has_many :consumable_uses
  has_many :repair_uses
  has_many :reuse_end_of_lives  
  has_many :recycling_end_of_lives  
  has_many :transport_repair_datas 

  has_one :scenario
  has_one :use
  has_one :end_of_life
  has_one :product_result  
  has_one :data_quality  
    
  has_one :economic
  
  has_and_belongs_to_many :indicators, :uniq => true

  has_one :bp_product, :dependent => :destroy
  has_one :st_product, :dependent => :destroy
  has_one :ph_product, :dependent => :destroy  
  has_one :se_product, :dependent => :destroy  
  has_one :mt_product, :dependent => :destroy
  has_one :pc_product, :dependent => :destroy

  def name_utf8
    str = name.dup
    if !name.encoding || name.encoding.name != 'UTF-8'
      str = name.force_encoding("UTF-8")
    end
    return str
  end

  def description_utf8
    str = description.dup
    return str.force_encoding("UTF-8")
  end
end
