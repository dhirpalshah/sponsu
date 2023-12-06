class HomeController < ApplicationController
  skip_before_action :authenticate_student!, :only => [:welcome]
  # make sure to include skip_before_action :authenticate_company_employee!, :only => [:welcome]

  def welcome
    
  end

  

end
