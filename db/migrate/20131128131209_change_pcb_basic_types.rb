class ChangePcbBasicTypes < ActiveRecord::Migration
  def self.up
    change_column :pc_basics, :pcb_number, :integer
    change_column :pc_basics, :layers, :integer    
  end

  def self.down
    change_column :pc_basics, :pcb_number, :float
    change_column :pc_basics, :layers, :float    
  end
end
