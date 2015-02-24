class AddAbbrToIndicator < ActiveRecord::Migration
  def self.up
    add_column :indicators, :abbr, :string  
  end

  def self.down
    remove_column :indicators, :abbr  
  end
end
