class AddFieldToStResult < ActiveRecord::Migration
  def self.up
    add_column :st_results, :has_checkbox, :boolean, :default => false  
  end

  def self.down
    remove_column :st_results, :has_checkbox    
  end
end
