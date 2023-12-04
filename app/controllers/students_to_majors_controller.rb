class StudentsToMajorsController < ApplicationController
  def index
    matching_students_to_majors = StudentsToMajor.all

    @list_of_students_to_majors = matching_students_to_majors.order({ :created_at => :desc })

    render({ :template => "students_to_majors/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_students_to_majors = StudentsToMajor.where({ :id => the_id })

    @the_students_to_major = matching_students_to_majors.at(0)

    render({ :template => "students_to_majors/show" })
  end

  def create
    the_students_to_major = StudentsToMajor.new
    the_students_to_major.student_id = params.fetch("query_student_id")
    the_students_to_major.major_id = params.fetch("query_major_id")

    if the_students_to_major.valid?
      the_students_to_major.save
      redirect_to("/students_to_majors", { :notice => "Students to major created successfully." })
    else
      redirect_to("/students_to_majors", { :alert => the_students_to_major.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_students_to_major = StudentsToMajor.where({ :id => the_id }).at(0)

    the_students_to_major.student_id = params.fetch("query_student_id")
    the_students_to_major.major_id = params.fetch("query_major_id")

    if the_students_to_major.valid?
      the_students_to_major.save
      redirect_to("/students_to_majors/#{the_students_to_major.id}", { :notice => "Students to major updated successfully."} )
    else
      redirect_to("/students_to_majors/#{the_students_to_major.id}", { :alert => the_students_to_major.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_students_to_major = StudentsToMajor.where({ :id => the_id }).at(0)

    the_students_to_major.destroy

    redirect_to("/students_to_majors", { :notice => "Students to major deleted successfully."} )
  end
end
