class StudentToEthnicitiesController < ApplicationController
  def index
    matching_student_to_ethnicities = StudentToEthnicity.all

    @list_of_student_to_ethnicities = matching_student_to_ethnicities.order({ :created_at => :desc })

    render({ :template => "student_to_ethnicities/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_student_to_ethnicities = StudentToEthnicity.where({ :id => the_id })

    @the_student_to_ethnicity = matching_student_to_ethnicities.at(0)

    render({ :template => "student_to_ethnicities/show" })
  end

  def create
    the_student_to_ethnicity = StudentToEthnicity.new
    the_student_to_ethnicity.student_id = params.fetch("query_student_id")
    the_student_to_ethnicity.ethnicity_id = params.fetch("query_ethnicity_id")

    if the_student_to_ethnicity.valid?
      the_student_to_ethnicity.save
      redirect_to("/student_to_ethnicities", { :notice => "Student to ethnicity created successfully." })
    else
      redirect_to("/student_to_ethnicities", { :alert => the_student_to_ethnicity.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_student_to_ethnicity = StudentToEthnicity.where({ :id => the_id }).at(0)

    the_student_to_ethnicity.student_id = params.fetch("query_student_id")
    the_student_to_ethnicity.ethnicity_id = params.fetch("query_ethnicity_id")

    if the_student_to_ethnicity.valid?
      the_student_to_ethnicity.save
      redirect_to("/student_to_ethnicities/#{the_student_to_ethnicity.id}", { :notice => "Student to ethnicity updated successfully."} )
    else
      redirect_to("/student_to_ethnicities/#{the_student_to_ethnicity.id}", { :alert => the_student_to_ethnicity.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_student_to_ethnicity = StudentToEthnicity.where({ :id => the_id }).at(0)

    the_student_to_ethnicity.destroy

    redirect_to("/student_to_ethnicities", { :notice => "Student to ethnicity deleted successfully."} )
  end
end
