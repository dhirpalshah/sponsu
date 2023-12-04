class UniversityIdsController < ApplicationController
  def index
    matching_university_ids = UniversityId.all

    @list_of_university_ids = matching_university_ids.order({ :created_at => :desc })

    render({ :template => "university_ids/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_university_ids = UniversityId.where({ :id => the_id })

    @the_university_id = matching_university_ids.at(0)

    render({ :template => "university_ids/show" })
  end

  def create
    the_university_id = UniversityId.new
    the_university_id.name = params.fetch("query_name")
    the_university_id.location = params.fetch("query_location")
    the_university_id.type_id = params.fetch("query_type_id")
    the_university_id.population = params.fetch("query_population")
    the_university_id.region = params.fetch("query_region")
    the_university_id.students_count = params.fetch("query_students_count")

    if the_university_id.valid?
      the_university_id.save
      redirect_to("/university_ids", { :notice => "University created successfully." })
    else
      redirect_to("/university_ids", { :alert => the_university_id.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_university_id = UniversityId.where({ :id => the_id }).at(0)

    the_university_id.name = params.fetch("query_name")
    the_university_id.location = params.fetch("query_location")
    the_university_id.type_id = params.fetch("query_type_id")
    the_university_id.population = params.fetch("query_population")
    the_university_id.region = params.fetch("query_region")
    the_university_id.students_count = params.fetch("query_students_count")

    if the_university_id.valid?
      the_university_id.save
      redirect_to("/university_ids/#{the_university_id.id}", { :notice => "University updated successfully."} )
    else
      redirect_to("/university_ids/#{the_university_id.id}", { :alert => the_university_id.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_university_id = UniversityId.where({ :id => the_id }).at(0)

    the_university_id.destroy

    redirect_to("/university_ids", { :notice => "University deleted successfully."} )
  end
end
