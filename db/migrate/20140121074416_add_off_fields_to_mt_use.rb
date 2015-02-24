class AddOffFieldsToMtUse < ActiveRecord::Migration
  def self.up
    add_column :mt_uses, :hours_shift_off, :float
    add_column :mt_uses, :hours_shift_off_2, :float
    add_column :mt_uses, :hours_shift_off_3, :float     
  end

  def self.down
    remove_column :mt_uses, :hours_shift_off
    remove_column :mt_uses, :hours_shift_off_2
    remove_column :mt_uses, :hours_shift_off_3    
  end
end
