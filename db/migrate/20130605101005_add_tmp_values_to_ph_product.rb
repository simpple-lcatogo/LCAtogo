class AddTmpValuesToPhProduct < ActiveRecord::Migration
  def self.up
    add_column :ph_products, :tmp_peak, :float
    add_column :ph_products, :tmp_yearly, :float    
  end

  def self.down
  end
end
