class SocialmediaController < ApplicationController
  def index
    matching_socialmedia = Socialmedium.all

    @list_of_socialmedia = matching_socialmedia.order({ :created_at => :desc })

    render({ :template => "socialmedia/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_socialmedia = Socialmedium.where({ :id => the_id })

    @the_socialmedium = matching_socialmedia.at(0)

    render({ :template => "socialmedia/show" })
  end

  def create
    the_socialmedium = Socialmedium.new
    the_socialmedium.socialmedia_name = params.fetch("query_socialmedia_name")
    the_socialmedium.students_to_socials_count = params.fetch("query_students_to_socials_count")

    if the_socialmedium.valid?
      the_socialmedium.save
      redirect_to("/socialmedia", { :notice => "Socialmedium created successfully." })
    else
      redirect_to("/socialmedia", { :alert => the_socialmedium.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_socialmedium = Socialmedium.where({ :id => the_id }).at(0)

    the_socialmedium.socialmedia_name = params.fetch("query_socialmedia_name")
    the_socialmedium.students_to_socials_count = params.fetch("query_students_to_socials_count")

    if the_socialmedium.valid?
      the_socialmedium.save
      redirect_to("/socialmedia/#{the_socialmedium.id}", { :notice => "Socialmedium updated successfully."} )
    else
      redirect_to("/socialmedia/#{the_socialmedium.id}", { :alert => the_socialmedium.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_socialmedium = Socialmedium.where({ :id => the_id }).at(0)

    the_socialmedium.destroy

    redirect_to("/socialmedia", { :notice => "Socialmedium deleted successfully."} )
  end
end
