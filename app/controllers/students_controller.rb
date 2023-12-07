class StudentsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_student!, :only => [:dashboard]

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:email, :gender_id, :university_id])
    devise_parameter_sanitizer.permit(:account_update)
  end

  def dashboard
    @student = current_student
    @student_email = @student.email
    render({ :template => "students/dashboard" })
  end

  private
     
end
