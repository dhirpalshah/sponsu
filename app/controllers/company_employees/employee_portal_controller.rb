class CompanyEmployees::EmployeePortalController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_company_employee! 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:email, :company_id])
    devise_parameter_sanitizer.permit(:account_update)
  end

  def dashboard 
    @students = Student.all
    @filtered_students = filter_students(params[:student]) if params[:student].present?

  end

  def filter_students(filters)
    # @students.where(filters)
  end
end
