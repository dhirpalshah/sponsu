class ApplicationController < ActionController::Base
  skip_forgery_protection
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_company_employee_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:email, :password, :company_id])
    devise_parameter_sanitizer.permit(:account_update)
  end

  def configure_student_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:email, :password, :gender_id, :university_id])
    devise_parameter_sanitizer.permit(:account_update)
  end

  def configure_permitted_parameters
    if resource_class == CompanyEmployee 
      configure_company_employee_permitted_parameters
    elsif resource_class == Student
      configure_student_permitted_parameters
    end
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(CompanyEmployee)
      authenticated_company_employee_root_path
    elsif resource.is_a?(Student)
      authenticated_student_root_path(resource)
    else
      super
    end
  end


end
