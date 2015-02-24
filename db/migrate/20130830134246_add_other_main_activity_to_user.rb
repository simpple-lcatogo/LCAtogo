class AddOtherMainActivityToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :other_main_activity, :string
  end

  def self.down
    remove_column :users, :other_main_activity
  end
end
