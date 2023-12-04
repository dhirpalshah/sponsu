class MajorsController < ApplicationController
  def index
    matching_majors = Major.all

    @list_of_majors = matching_majors.order({ :created_at => :desc })

    render({ :template => "majors/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_majors = Major.where({ :id => the_id })

    @the_major = matching_majors.at(0)

    render({ :template => "majors/show" })
  end

  def create
    the_major = Major.new
    the_major.major_name = params.fetch("query_major_name")
    the_major.major_field = params.fetch("query_major_field")
    the_major.students_to_majors_count = params.fetch("query_students_to_majors_count")

    if the_major.valid?
      the_major.save
      redirect_to("/majors", { :notice => "Major created successfully." })
    else
      redirect_to("/majors", { :alert => the_major.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_major = Major.where({ :id => the_id }).at(0)

    the_major.major_name = params.fetch("query_major_name")
    the_major.major_field = params.fetch("query_major_field")
    the_major.students_to_majors_count = params.fetch("query_students_to_majors_count")

    if the_major.valid?
      the_major.save
      redirect_to("/majors/#{the_major.id}", { :notice => "Major updated successfully."} )
    else
      redirect_to("/majors/#{the_major.id}", { :alert => the_major.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_major = Major.where({ :id => the_id }).at(0)

    the_major.destroy

    redirect_to("/majors", { :notice => "Major deleted successfully."} )
  end
end
