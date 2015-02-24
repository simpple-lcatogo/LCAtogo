class FixMtUseFields < ActiveRecord::Migration
  def self.up
    remove_column :mt_uses, :shifts_day_2
    remove_column :mt_uses, :shifts_day_3
    remove_column :mt_uses, :working_days_2
    remove_column :mt_uses, :working_days_3
    remove_column :mt_uses, :parts_produced_2
    remove_column :mt_uses, :parts_produced_3  
    add_column :mt_uses, :shifts_day_2, :float    
    add_column :mt_uses, :shifts_day_3, :float    
    add_column :mt_uses, :working_days_2, :float    
    add_column :mt_uses, :working_days_3, :float    
    add_column :mt_uses, :parts_produced_2, :float    
    add_column :mt_uses, :parts_produced_3, :float       
  end

  def self.down
  end
end
