class CompaniesController < ApplicationController
  def index
    matching_companies = Company.all

    @list_of_companies = matching_companies.order({ :created_at => :desc })

    render({ :template => "companies/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_companies = Company.where({ :id => the_id })

    @the_company = matching_companies.at(0)

    render({ :template => "companies/show" })
  end

  def create
    the_company = Company.new
    the_company.company_name = params.fetch("query_company_name")
    the_company.location = params.fetch("query_location")
    the_company.sector = params.fetch("query_sector")
    the_company.num_employees = params.fetch("query_num_employees")
    the_company.company_employees_count = params.fetch("query_company_employees_count")

    if the_company.valid?
      the_company.save
      redirect_to("/companies", { :notice => "Company created successfully." })
    else
      redirect_to("/companies", { :alert => the_company.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_company = Company.where({ :id => the_id }).at(0)

    the_company.company_name = params.fetch("query_company_name")
    the_company.location = params.fetch("query_location")
    the_company.sector = params.fetch("query_sector")
    the_company.num_employees = params.fetch("query_num_employees")
    the_company.company_employees_count = params.fetch("query_company_employees_count")

    if the_company.valid?
      the_company.save
      redirect_to("/companies/#{the_company.id}", { :notice => "Company updated successfully."} )
    else
      redirect_to("/companies/#{the_company.id}", { :alert => the_company.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_company = Company.where({ :id => the_id }).at(0)

    the_company.destroy

    redirect_to("/companies", { :notice => "Company deleted successfully."} )
  end
end
