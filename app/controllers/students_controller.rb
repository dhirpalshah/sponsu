class StudentsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_student!, :only => [:dashboard]
  before_action :set_student, only: [:edit, :update]

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:email, :gender_id, :university_id])
    devise_parameter_sanitizer.permit(:account_update)
  end

  def dashboard
    @student = current_student
    @student_email = @student.email
    @matching_university = University.where({ :id => @student.university_id }).at(0)
    render({ :template => "students/dashboard" })
  end

  def myprofile
    @student = current_student
    render({ :template => "students/myprofile" })
  end

  def update
    if @student.update(student_params)
      redirect_to student_dashboard_path, notice: "Information updated successfully."
    else
      render :edit
    end
  end

  def student_params
    params.require("student").permit("name", "ethnicity", "major_id")
  end

  private

  def set_student
    @student = Student.where({ :id => params["id"] }).at(0)
  end
     
end
