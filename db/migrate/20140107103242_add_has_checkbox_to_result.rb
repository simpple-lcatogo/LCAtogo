class AddHasCheckboxToResult < ActiveRecord::Migration
 def self.up
    add_column :results, :has_checkbox, :boolean, :default => false  
  end

  def self.down
    remove_column :results, :has_checkbox    
  end
end
