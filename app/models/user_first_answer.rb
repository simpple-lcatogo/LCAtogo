class UserFirstAnswer < ActiveRecord::Base
  has_and_belongs_to_many :users

  def name_en
    UserFirstAnswerTranslation.find_by_user_first_answer_id_and_locale(id,"en").name
  end
end
