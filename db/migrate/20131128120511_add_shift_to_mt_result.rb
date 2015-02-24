class AddShiftToMtResult < ActiveRecord::Migration
  def self.up
    add_column :mt_results, :shift, :int, :default => -1      
  end

  def self.down
    remove_column :mt_results, :shift 
  end
end
