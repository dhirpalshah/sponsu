# == Schema Information
#
# Table name: majors
#
#  id                       :integer          not null, primary key
#  major_field              :string
#  major_name               :integer
#  students_to_majors_count :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
class Major < ApplicationRecord
  has_many  :students_to_majors, class_name: "StudentsToMajor", foreign_key: "major_id", dependent: :destroy

end
