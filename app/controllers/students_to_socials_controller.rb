class StudentsToSocialsController < ApplicationController
  def index
    matching_students_to_socials = StudentsToSocial.all

    @list_of_students_to_socials = matching_students_to_socials.order({ :created_at => :desc })

    render({ :template => "students_to_socials/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_students_to_socials = StudentsToSocial.where({ :id => the_id })

    @the_students_to_social = matching_students_to_socials.at(0)

    render({ :template => "students_to_socials/show" })
  end

  def create
    the_students_to_social = StudentsToSocial.new
    the_students_to_social.student_id = params.fetch("query_student_id")
    the_students_to_social.socialmedia_id = params.fetch("query_socialmedia_id")
    the_students_to_social.socialmedia_url = params.fetch("query_socialmedia_url")

    if the_students_to_social.valid?
      the_students_to_social.save
      redirect_to("/students_to_socials", { :notice => "Students to social created successfully." })
    else
      redirect_to("/students_to_socials", { :alert => the_students_to_social.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_students_to_social = StudentsToSocial.where({ :id => the_id }).at(0)

    the_students_to_social.student_id = params.fetch("query_student_id")
    the_students_to_social.socialmedia_id = params.fetch("query_socialmedia_id")
    the_students_to_social.socialmedia_url = params.fetch("query_socialmedia_url")

    if the_students_to_social.valid?
      the_students_to_social.save
      redirect_to("/students_to_socials/#{the_students_to_social.id}", { :notice => "Students to social updated successfully."} )
    else
      redirect_to("/students_to_socials/#{the_students_to_social.id}", { :alert => the_students_to_social.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_students_to_social = StudentsToSocial.where({ :id => the_id }).at(0)

    the_students_to_social.destroy

    redirect_to("/students_to_socials", { :notice => "Students to social deleted successfully."} )
  end
end
