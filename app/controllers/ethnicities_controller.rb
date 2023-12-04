class EthnicitiesController < ApplicationController
  def index
    matching_ethnicities = Ethnicity.all

    @list_of_ethnicities = matching_ethnicities.order({ :created_at => :desc })

    render({ :template => "ethnicities/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_ethnicities = Ethnicity.where({ :id => the_id })

    @the_ethnicity = matching_ethnicities.at(0)

    render({ :template => "ethnicities/show" })
  end

  def create
    the_ethnicity = Ethnicity.new
    the_ethnicity.ethnicity_name = params.fetch("query_ethnicity_name")
    the_ethnicity.student_to_ethnicities_count = params.fetch("query_student_to_ethnicities_count")

    if the_ethnicity.valid?
      the_ethnicity.save
      redirect_to("/ethnicities", { :notice => "Ethnicity created successfully." })
    else
      redirect_to("/ethnicities", { :alert => the_ethnicity.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_ethnicity = Ethnicity.where({ :id => the_id }).at(0)

    the_ethnicity.ethnicity_name = params.fetch("query_ethnicity_name")
    the_ethnicity.student_to_ethnicities_count = params.fetch("query_student_to_ethnicities_count")

    if the_ethnicity.valid?
      the_ethnicity.save
      redirect_to("/ethnicities/#{the_ethnicity.id}", { :notice => "Ethnicity updated successfully."} )
    else
      redirect_to("/ethnicities/#{the_ethnicity.id}", { :alert => the_ethnicity.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_ethnicity = Ethnicity.where({ :id => the_id }).at(0)

    the_ethnicity.destroy

    redirect_to("/ethnicities", { :notice => "Ethnicity deleted successfully."} )
  end
end
