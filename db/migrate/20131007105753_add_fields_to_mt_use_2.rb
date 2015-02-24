class AddFieldsToMtUse2 < ActiveRecord::Migration
  def self.up
    add_column :mt_uses, :hours_shift_processing_2, :float    
    add_column :mt_uses, :hours_shift_processing_3, :float
    add_column :mt_uses, :hours_shift_ready_2, :float    
    add_column :mt_uses, :hours_shift_ready_3, :float    
    add_column :mt_uses, :hours_shift_standby_2, :float    
    add_column :mt_uses, :hours_shift_standby_3, :float    
    
  end

  def self.down
    remove_column :mt_uses, :hours_shift_processing_2    
    remove_column :mt_uses, :hours_shift_processing_3
    remove_column :mt_uses, :hours_shift_ready_2
    remove_column :mt_uses, :hours_shift_ready_3
    remove_column :mt_uses, :hours_shift_standby_2
    remove_column :mt_uses, :hours_shift_standby_3    
  end
end
