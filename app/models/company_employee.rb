# == Schema Information
#
# Table name: company_employees
#
#  id                     :integer          not null, primary key
#  address                :string
#  date_of_birth          :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company_id             :integer
#
# Indexes
#
#  index_company_employees_on_email                 (email) UNIQUE
#  index_company_employees_on_reset_password_token  (reset_password_token) UNIQUE
#
class CompanyEmployee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  belongs_to :company, :required => true, :class_name => "Company", :foreign_key => "company_id", :counter_cache => true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
