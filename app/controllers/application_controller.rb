class ApplicationController < ActionController::Base
  skip_forgery_protection

  before_action :authenticate_student!
  before_action :authenticate_company_employee!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_company_employee_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:email, :company_id])

    devise_parameter_sanitizer.permit(:account_update)
  end

  def configure_permitted_parameters
    if resource_class == CompanyEmployee 
      configure_company_employee_permitted_parameters
    elsif resource_class == Student
      devise_parameter_sanitizer.permit(:sign_up, :keys => [:email, :gender_id, :university_id])
      devise_parameter_sanitizer.permit(:account_update)
    end

  end
end
