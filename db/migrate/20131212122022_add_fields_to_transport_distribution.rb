class AddFieldsToTransportDistribution < ActiveRecord::Migration
  def self.up
    add_column :transport_distributions, :comment, :text    
    add_column :transport_distributions, :distance, :float    
  end

  def self.down
    remove_column :transport_distributions, :comment
    remove_column :transport_distributions, :distance    
  end
end
