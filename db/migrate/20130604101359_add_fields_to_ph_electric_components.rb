class AddFieldsToPhElectricComponents < ActiveRecord::Migration
  def self.up
    add_column :ph_electric_components, :weight_battery, :float  
  end

  def self.down
    remove_column :ph_electric_components, :weight_battery
  end
end
