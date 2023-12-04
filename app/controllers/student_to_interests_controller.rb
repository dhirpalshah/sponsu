class StudentToInterestsController < ApplicationController
  def index
    matching_student_to_interests = StudentToInterest.all

    @list_of_student_to_interests = matching_student_to_interests.order({ :created_at => :desc })

    render({ :template => "student_to_interests/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_student_to_interests = StudentToInterest.where({ :id => the_id })

    @the_student_to_interest = matching_student_to_interests.at(0)

    render({ :template => "student_to_interests/show" })
  end

  def create
    the_student_to_interest = StudentToInterest.new
    the_student_to_interest.student_id = params.fetch("query_student_id")
    the_student_to_interest.interest_id = params.fetch("query_interest_id")

    if the_student_to_interest.valid?
      the_student_to_interest.save
      redirect_to("/student_to_interests", { :notice => "Student to interest created successfully." })
    else
      redirect_to("/student_to_interests", { :alert => the_student_to_interest.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_student_to_interest = StudentToInterest.where({ :id => the_id }).at(0)

    the_student_to_interest.student_id = params.fetch("query_student_id")
    the_student_to_interest.interest_id = params.fetch("query_interest_id")

    if the_student_to_interest.valid?
      the_student_to_interest.save
      redirect_to("/student_to_interests/#{the_student_to_interest.id}", { :notice => "Student to interest updated successfully."} )
    else
      redirect_to("/student_to_interests/#{the_student_to_interest.id}", { :alert => the_student_to_interest.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_student_to_interest = StudentToInterest.where({ :id => the_id }).at(0)

    the_student_to_interest.destroy

    redirect_to("/student_to_interests", { :notice => "Student to interest deleted successfully."} )
  end
end
