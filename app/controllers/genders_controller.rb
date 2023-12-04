class GendersController < ApplicationController
  def index
    matching_genders = Gender.all

    @list_of_genders = matching_genders.order({ :created_at => :desc })

    render({ :template => "genders/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_genders = Gender.where({ :id => the_id })

    @the_gender = matching_genders.at(0)

    render({ :template => "genders/show" })
  end

  def create
    the_gender = Gender.new
    the_gender.gender_name = params.fetch("query_gender_name")
    the_gender.students_count = params.fetch("query_students_count")

    if the_gender.valid?
      the_gender.save
      redirect_to("/genders", { :notice => "Gender created successfully." })
    else
      redirect_to("/genders", { :alert => "the_gender.errors.full_messages.to_sentence" })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_gender = Gender.where({ :id => the_id }).at(0)

    the_gender.gender_name = params.fetch("query_gender_name")
    the_gender.students_count = params.fetch("query_students_count")

    if the_gender.valid?
      the_gender.save
      redirect_to("/genders/#{the_gender.id}", { :notice => "Gender updated successfully."} )
    else
      redirect_to("/genders/#{the_gender.id}", { :alert => the_gender.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_gender = Gender.where({ :id => the_id }).at(0)

    the_gender.destroy

    redirect_to("/genders", { :notice => "Gender deleted successfully."} )
  end
end
