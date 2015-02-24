class UserSecondAnswersUsers < ActiveRecord::Migration
  def self.up
    create_table :user_second_answers_users, :id => false do |t|
      t.integer :user_second_answer_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :user_second_answers_users
  end
end
