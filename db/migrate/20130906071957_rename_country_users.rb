class RenameCountryUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :country, :old_country
  end

  def self.down
    rename_column :users, :old_country, :country
  end
end
