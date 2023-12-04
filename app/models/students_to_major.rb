# == Schema Information
#
# Table name: students_to_majors
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  major_id   :integer
#  student_id :integer
#
class StudentsToMajor < ApplicationRecord
  belongs_to :student, required: true, class_name: "Student", foreign_key: "student_id", counter_cache: true
  belongs_to :major, required: true, class_name: "Major", foreign_key: "major_id", counter_cache: true

end
