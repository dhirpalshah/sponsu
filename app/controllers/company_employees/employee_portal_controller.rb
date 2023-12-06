class CompanyEmployees::EmployeePortalController < ApplicationController
  before_action :authenticate_company_employee! 

  def dashboard 
    @students = Student.all
    @filtered_students = filter_students(params[:student]) if params[:student].present?

  end

  def filter_students(filters)
    # @students.where(filters)
  end
end
