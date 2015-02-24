class AddFieldToMtResult < ActiveRecord::Migration
  def self.up
    add_column :mt_results, :has_checkbox, :boolean, :default => false  
  end

  def self.down
    remove_column :mt_results, :has_checkbox    
  end
end