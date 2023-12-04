# == Schema Information
#
# Table name: interests
#
#  id                         :integer          not null, primary key
#  interest_name              :string
#  student_to_interests_count :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
class Interest < ApplicationRecord
  has_many  :student_to_interests, class_name: "StudentToInterest", foreign_key: "interest_id", dependent: :destroy

end
