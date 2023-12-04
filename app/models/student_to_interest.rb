# == Schema Information
#
# Table name: student_to_interests
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  interest_id :integer
#  student_id  :integer
#
class StudentToInterest < ApplicationRecord
  belongs_to :student, required: true, class_name: "Student", foreign_key: "student_id", counter_cache: true
  belongs_to :interest, required: true, class_name: "Interest", foreign_key: "interest_id", counter_cache: true

end
