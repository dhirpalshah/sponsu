class StudentsController < ApplicationController
  before_action :authenticate_student!, :only => [:dashboard]
  before_action :set_student, :only => [:dashboard]

  def dashboard
    # todo: include logic to ensure the student can only access their own dashboard
    if current_student.id != params[:id].to_i
      redirect_to('/', :notice => "You can only access your own dashboard.")
    else
      # Render the student's dashboard view
      render({ :template => "students/dashboard" })
    end
  end

  private
     
  def set_student
    @student = Student.where({ :id => params[:id] }).at(0)
    @student_email = @student.email
  end
end
