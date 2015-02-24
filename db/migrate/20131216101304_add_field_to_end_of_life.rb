class AddFieldToEndOfLife < ActiveRecord::Migration
  def self.up
    add_column :end_of_lives, :collection_rate, :float, :default => 50        
  end

  def self.down
    remove_column :end_of_lives, :collection_rate
  end
end
