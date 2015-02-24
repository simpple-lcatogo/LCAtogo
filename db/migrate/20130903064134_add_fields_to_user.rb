class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :other_first_answer, :text
    add_column :users, :other_second_answer, :text
    add_column :users, :other_third_answer, :text
    add_column :users, :free_training, :string
  end

  def self.down
    remove_column :users, :other_first_answer
    remove_column :users, :other_second_answer
    remove_column :users, :other_third_answer
    remove_column :users, :free_training
  end
end
