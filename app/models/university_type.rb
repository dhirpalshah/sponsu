# == Schema Information
#
# Table name: university_types
#
#  id                   :integer          not null, primary key
#  type_name            :string
#  university_ids_count :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class UniversityType < ApplicationRecord
  has_many  :university_ids, class_name: "UniversityId", foreign_key: "type_id", dependent: :destroy

end
