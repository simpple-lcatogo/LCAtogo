# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def new
    @countries = Country.all
    @first_answers = UserFirstAnswer.all
    @second_answers = UserSecondAnswer.all
    @third_answers = UserThirdAnswer.all
    super

  end

  def edit
    @countries = Country.all
    super
  end


  def create
    begin
      super
    rescue
      redirect_to '/intros/error_duplicated_email?email=' + params[:user][:email]
    end
  end

  def update
    @countries = Country.all
    super
  end

  protected

  def after_inactive_sign_up_path_for(resource)
     @email = resource.email
     return '/intros/confirmation_alert?email=' + @email
  end

end 