class CreateUserFirstAnswers < ActiveRecord::Migration
  def self.up
    create_table :user_first_answers do |t|
      t.string :name

      t.timestamps
    end
    UserFirstAnswer.create_translation_table! :name => :string
  end

  def self.down
    drop_table :user_first_answers
    UserFirstAnswer.drop_translation_table!
  end
end
