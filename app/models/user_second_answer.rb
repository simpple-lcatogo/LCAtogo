class UserSecondAnswer < ActiveRecord::Base
  has_and_belongs_to_many :users

  def name_en
    UserSecondAnswerTranslation.find_by_user_second_answer_id_and_locale(id,"en").name
  end
end
