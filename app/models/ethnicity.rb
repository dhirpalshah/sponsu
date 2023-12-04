# == Schema Information
#
# Table name: ethnicities
#
#  id                           :integer          not null, primary key
#  ethnicity_name               :string
#  student_to_ethnicities_count :integer
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
class Ethnicity < ApplicationRecord
  has_many  :student_to_ethnicities, class_name: "StudentToEthnicity", foreign_key: "ethnicity_id", dependent: :destroy

end
