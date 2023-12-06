# == Schema Information
#
# Table name: companies
#
#  id                      :integer          not null, primary key
#  company_employees_count :integer
#  company_name            :string
#  location                :string
#  num_employees           :integer
#  sector                  :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
class Company < ApplicationRecord
  has_many :company_employees, :class_name => "CompanyEmployee", :foreign_key => "company_id", :dependent => :destroy

end
