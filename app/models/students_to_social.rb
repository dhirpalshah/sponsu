# == Schema Information
#
# Table name: students_to_socials
#
#  id              :integer          not null, primary key
#  socialmedia_url :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  socialmedia_id  :integer
#  student_id      :integer
#
class StudentsToSocial < ApplicationRecord
  belongs_to :student, required: true, class_name: "Student", foreign_key: "student_id", counter_cache: true
  belongs_to :socialmedia, required: true, class_name: "Socialmedia", foreign_key: "socialmedia_id", counter_cache: true

end
