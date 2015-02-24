class CreateUserSecondAnswers < ActiveRecord::Migration
  def self.up
    create_table :user_second_answers do |t|
      t.string :name

      t.timestamps
    end
    UserSecondAnswer.create_translation_table! :name => :string
  end

  def self.down
    drop_table :user_second_answers
    UserSecondAnswer.drop_translation_table!
  end
end
