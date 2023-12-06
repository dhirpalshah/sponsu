class ApplicationController < ActionController::Base
  skip_forgery_protection

  def configure_company_employee_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:email, :company_id])

  def configure_student_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:email, :gender_id, :university_id])
    devise_parameter_sanitizer.permit(:account_update)
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(CompanyEmployee)
      authenticated_company_employee_root_path
    else
      super
    end
  end

  def configure_permitted_parameters
    if resource_class == CompanyEmployee 
      configure_company_employee_permitted_parameters
    elsif resource_class == Student
      configure_student_permitted_parameters
    end

  end

end
