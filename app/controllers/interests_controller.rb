class InterestsController < ApplicationController
  def index
    matching_interests = Interest.all

    @list_of_interests = matching_interests.order({ :created_at => :desc })

    render({ :template => "interests/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_interests = Interest.where({ :id => the_id })

    @the_interest = matching_interests.at(0)

    render({ :template => "interests/show" })
  end

  def create
    the_interest = Interest.new
    the_interest.interest_name = params.fetch("query_interest_name")
    the_interest.student_to_interests_count = params.fetch("query_student_to_interests_count")

    if the_interest.valid?
      the_interest.save
      redirect_to("/interests", { :notice => "Interest created successfully." })
    else
      redirect_to("/interests", { :alert => the_interest.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_interest = Interest.where({ :id => the_id }).at(0)

    the_interest.interest_name = params.fetch("query_interest_name")
    the_interest.student_to_interests_count = params.fetch("query_student_to_interests_count")

    if the_interest.valid?
      the_interest.save
      redirect_to("/interests/#{the_interest.id}", { :notice => "Interest updated successfully."} )
    else
      redirect_to("/interests/#{the_interest.id}", { :alert => the_interest.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_interest = Interest.where({ :id => the_id }).at(0)

    the_interest.destroy

    redirect_to("/interests", { :notice => "Interest deleted successfully."} )
  end
end
