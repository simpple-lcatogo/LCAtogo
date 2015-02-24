class UserThirdAnswer < ActiveRecord::Base
  has_and_belongs_to_many :users

  def name_en
    UserThirdAnswerTranslation.find_by_user_third_answer_id_and_locale(id,"en").name
  end
end
