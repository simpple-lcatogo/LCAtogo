class AddFieldsToPcBasic < ActiveRecord::Migration
  def self.up
    add_column :pc_basics, :water, :float
    add_column :pc_basics, :electric, :float
    add_column :pc_basics, :heat, :float
    add_column :pc_basics, :waste, :float
    add_column :pc_basics, :ghg, :float    
    add_column :pc_basics, :pcbs, :float    
  end

  def self.down
    remove_column :pc_basics, :water    
    remove_column :pc_basics, :electric
    remove_column :pc_basics, :heat
    remove_column :pc_basics, :waste
    remove_column :pc_basics, :ghg
    remove_column :pc_basics, :pcbs    
  end
end
