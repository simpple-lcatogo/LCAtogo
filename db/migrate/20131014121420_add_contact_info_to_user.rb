class AddContactInfoToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :contact_info, :boolean
  end

  def self.down
    remove_column :users, :contact_info
  end
end
