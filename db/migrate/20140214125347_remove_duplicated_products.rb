class RemoveDuplicatedProducts < ActiveRecord::Migration
  def self.up
    Product.find_all_by_name_and_is_default_product("Laptop, consumer", false).each do |product|
      if product.created_at > Date.yesterday
         product.delete
       end  
   end
    Product.find_all_by_name_and_is_default_product("Laptop, busines, 14\"", false).each do |product|
      if product.created_at > Date.yesterday
         product.delete
       end  
    end
    Product.find_all_by_name_and_is_default_product("Laptop, business, 14\"", false).each do |product|
      if product.created_at > Date.yesterday
         product.delete
       end  
    end    
    Product.find_all_by_name_and_is_default_product("Netbook, 11.6\", 16G", false).each do |product|
      if product.created_at > Date.yesterday
         product.delete
       end  
    end
   
  end

  def self.down
  end
end