class AddEnergyModeToFamily < ActiveRecord::Migration
  def self.up
    add_column :families, :energy_mode_id, :integer    
  end

  def self.down
    remove_column :families, :energy_mode_id
  end
end
