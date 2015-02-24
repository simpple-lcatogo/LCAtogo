class AddBreakdownToMtUse < ActiveRecord::Migration
  def self.up
    add_column :mt_uses, :breakdown, :string      
  end

  def self.down
    remove_column :mt_uses, :breakdown
  end
end
