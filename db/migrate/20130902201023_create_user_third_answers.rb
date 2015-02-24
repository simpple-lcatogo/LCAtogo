class CreateUserThirdAnswers < ActiveRecord::Migration
  def self.up
    create_table :user_third_answers do |t|
      t.string :name

      t.timestamps
    end
    UserThirdAnswer.create_translation_table! :name => :string
  end

  def self.down
    drop_table :user_third_answers
    UserThirdAnswer.drop_translation_table!
  end
end
