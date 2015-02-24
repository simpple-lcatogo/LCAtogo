class SetDefaultIndicatorsToDefaultProductsElectronics < ActiveRecord::Migration
  def self.up
    Product.find_all_by_name_and_is_default_product("Laptop, consumer", false).each do |product|
      product.indicators << Indicator.find_all_by_sector("electronics")
      if !product.product_result
         product.product_result = ProductResult.new
         product.product_result.save
      end            
      product.save      
    end
    Product.find_all_by_name_and_is_default_product("Laptop, busines, 14\"", false).each do |product|
      product.indicators << Indicator.find_all_by_sector("electronics")
      if !product.product_result
         product.product_result = ProductResult.new
         product.product_result.save
      end            
      product.save            
    end
    Product.find_all_by_name_and_is_default_product("Laptop, business, 14\"", false).each do |product|
      product.indicators << Indicator.find_all_by_sector("electronics")
      if !product.product_result
         product.product_result = ProductResult.new
         product.product_result.save
      end            
      product.save            
    end    
    Product.find_all_by_name_and_is_default_product("Netbook, 11.6\", 16G", false).each do |product|
      product.indicators << Indicator.find_all_by_sector("electronics")
      if !product.product_result
         product.product_result = ProductResult.new
         product.product_result.save
      end            
      product.save      
    end    
  end

  def self.down
  end
end
