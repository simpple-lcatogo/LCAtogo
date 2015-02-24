class AddPhSpecifiedDefaults < ActiveRecord::Migration
  def self.up
    change_column_default(:ph_specifieds, :area, 0.0)
    change_column_default(:ph_specifieds, :power, 0.0)        
  end

  def self.down
  end
end
