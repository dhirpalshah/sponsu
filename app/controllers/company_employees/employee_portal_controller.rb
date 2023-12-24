class CompanyEmployees::EmployeePortalController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_company_employee! 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:email, :company_id])
    devise_parameter_sanitizer.permit(:account_update)
  end

  def dashboard 
    @students = filter_students(params[:filters]) 
    @students = search_students(params[:search], @students) 
  end

  def search_students(search, students) 
    @students = students
    if @students && search 
      @students = @students.where("name LIKE ?", "%#{search}%")
    end 

    @students
  end 

  def filter_students(filters)
    @students = Student.all
  
    if @students && filters
      @students = @students.where(university_id: filters[:university_id]) if filters[:university_id].present?
      @students = @students.where(gender_id: filters[:gender_id]) if filters[:gender_id].present?
      @students = @students.where(ethnicity: filters[:ethnicity]) if filters[:ethnicity].present?
    end

    @students
  end
end
