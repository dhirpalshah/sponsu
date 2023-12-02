# == Schema Information
#
# Table name: students
#
#  id                           :integer          not null, primary key
#  bio                          :string
#  date_of_birth                :date
#  email                        :string           default(""), not null
#  encrypted_password           :string           default(""), not null
#  ethnicity                    :string
#  graduating_year              :string
#  home_location                :string
#  name                         :string
#  profile_pic                  :string
#  remember_created_at          :datetime
#  reset_password_sent_at       :datetime
#  reset_password_token         :string
#  student_to_ethnicities_count :integer
#  student_to_interests_count   :integer
#  students_to_majors_count     :integer
#  students_to_socials_count    :integer
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  gender_id                    :integer
#  major_id                     :integer
#  university_id                :integer
#
# Indexes
#
#  index_students_on_email                 (email) UNIQUE
#  index_students_on_reset_password_token  (reset_password_token) UNIQUE
#
class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
