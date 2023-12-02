class ApplicationController < ActionController::Base
  skip_forgery_protection
  before_action :authenticate_student!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:email, :date_of_birth])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:date_of_birth, :graduating_year, :profile_pic])
  end
end
