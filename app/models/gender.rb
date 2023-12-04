# == Schema Information
#
# Table name: genders
#
#  id             :integer          not null, primary key
#  gender_name    :integer
#  students_count :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Gender < ApplicationRecord
  has_many  :students, class_name: "Student", foreign_key: "gender_id", dependent: :destroy

end
