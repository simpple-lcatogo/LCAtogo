class UserFirstAnswersUsers < ActiveRecord::Migration
  def self.up
    create_table :user_first_answers_users, :id => false do |t|
      t.integer :user_first_answer_id
      t.integer :user_id
    end

    #create_table :users_user_first_answers, :id => false do |t|
    #  t.integer :user_id
    #  t.integer :user_first_answer_id
    #end
  end

  def self.down
    drop_table :user_first_answers_users
    #drop_table :users_user_first_answers
  end
end
