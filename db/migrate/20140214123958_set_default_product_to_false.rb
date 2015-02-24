class SetDefaultProductToFalse < ActiveRecord::Migration
  def self.up
    Product.all.each do |product|
      product.is_default_product = false
      product.save
    end
  end

  def self.down
  end
end
