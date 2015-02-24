class AddFieldsToPhBasicInformation < ActiveRecord::Migration
  def self.up
    add_column :ph_basic_informations, :working, :string
    add_column :ph_basic_informations, :know_power, :string
    add_column :ph_basic_informations, :user_power, :float    
  end

  def self.down
    remove_column :ph_basic_informations, :working
    remove_column :ph_basic_informations, :know_power
    remove_column :ph_basic_informations, :user_power
  end
end
