# == Schema Information
#
# Table name: student_to_ethnicities
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  ethnicity_id :integer
#  student_id   :integer
#
class StudentToEthnicity < ApplicationRecord
  belongs_to :student, required: true, class_name: "Student", foreign_key: "student_id", counter_cache: true
  belongs_to :ethnicity, required: true, class_name: "Ethnicity", foreign_key: "ethnicity_id", counter_cache: true

end
