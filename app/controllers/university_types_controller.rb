class UniversityTypesController < ApplicationController
  def index
    matching_university_types = UniversityType.all

    @list_of_university_types = matching_university_types.order({ :created_at => :desc })

    render({ :template => "university_types/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_university_types = UniversityType.where({ :id => the_id })

    @the_university_type = matching_university_types.at(0)

    render({ :template => "university_types/show" })
  end

  def create
    the_university_type = UniversityType.new
    the_university_type.type_name = params.fetch("query_type_name")
    the_university_type.university_ids_count = params.fetch("query_university_ids_count")

    if the_university_type.valid?
      the_university_type.save
      redirect_to("/university_types", { :notice => "University type created successfully." })
    else
      redirect_to("/university_types", { :alert => the_university_type.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_university_type = UniversityType.where({ :id => the_id }).at(0)

    the_university_type.type_name = params.fetch("query_type_name")
    the_university_type.university_ids_count = params.fetch("query_university_ids_count")

    if the_university_type.valid?
      the_university_type.save
      redirect_to("/university_types/#{the_university_type.id}", { :notice => "University type updated successfully."} )
    else
      redirect_to("/university_types/#{the_university_type.id}", { :alert => the_university_type.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_university_type = UniversityType.where({ :id => the_id }).at(0)

    the_university_type.destroy

    redirect_to("/university_types", { :notice => "University type deleted successfully."} )
  end
end
