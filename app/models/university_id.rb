# == Schema Information
#
# Table name: university_ids
#
#  id             :integer          not null, primary key
#  location       :string
#  name           :string
#  population     :integer
#  region         :string
#  students_count :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  type_id        :integer
#
class UniversityId < ApplicationRecord
  has_many  :students, class_name: "Student", foreign_key: "university_id", dependent: :destroy
  belongs_to :type, required: true, class_name: "UniversityType", foreign_key: "type_id", counter_cache: true

end
