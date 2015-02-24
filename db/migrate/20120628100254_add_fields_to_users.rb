class AddFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :surname, :string    
    add_column :users, :activity, :string    
    add_column :users, :organization, :string
    add_column :users, :postal, :string
    add_column :users, :country, :string    
    add_column :users, :sector, :string
    add_column :users, :language, :string    
  end

  def self.down
    remove_column :users, :name
    remove_column :users, :surname
    remove_column :users, :activity
    remove_column :users, :organization
    remove_column :users, :postal
    remove_column :users, :country    
    remove_column :users, :sector
    remove_column :users, :language    
  end
end
