class AddFieldToPackagingDistribution < ActiveRecord::Migration
  def self.up
    add_column :packaging_distributions, :comment, :text  
    remove_column :packaging_distributions, :material_id
    add_column :packaging_distributions, :packaging_id, :integer 
  end

  def self.down
    remove_column :packaging_distributions, :comment
    add_column :packaging_distributions, :material_id, :integer    
    remove_column :packaging_distributions, :packaging_id    
  end
end
