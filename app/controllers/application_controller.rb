class ApplicationController < ActionController::Base
  skip_forgery_protection
  GENDER_MAP = {
    'male' => 0,
    'female' => 1,
    'other' => 2
  }.freeze

  UNIVERSITY_MAP= {
    'SponsU': 0, 
    'Princeton University': 1,
    'Harvard University': 2,
    'University of Chicago': 3,
    'Yale University': 4,
    'Columbia University': 5,
    'Stanford University': 6,
    'Massachusetts Institute of Technology': 7,
    'Duke University': 8,
    'University of Pennsylvania': 9,
    'Johns Hopkins University': 10,
    'Dartmouth College': 11,
    'California Institute of Technology': 12,
    'Northwestern University': 13,
    'Brown University': 14,
    'Cornell University': 15,
    'Rice University': 16,
    'University of Notre Dame': 17,
    'Vanderbilt University': 18,
    'Washington University in St. Louis': 19
  }.freeze

  before_action :authenticate_student!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:email, :gender, :university])
    if params[:student].present?
      params[:student][:gender] = map_gender_to_integer(params[:student][:gender]) if params[:student][:gender].present?
      params[:student][:university] = map_gender_to_integer(params[:student][:university]) if params[:student][:university].present?
    end

    devise_parameter_sanitizer.permit(:account_update)

  end

  def map_gender_to_integer(gender)
    GENDER_MAP[gender.downcase]
  end

  def map_university_to_id(university)
    UNIVERSITY_MAP[university.downcase]
  end
end
