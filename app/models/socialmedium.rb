# == Schema Information
#
# Table name: socialmedia
#
#  id                        :integer          not null, primary key
#  socialmedia_name          :string
#  students_to_socials_count :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
class Socialmedium < ApplicationRecord
  has_many  :students_to_socials, class_name: "StudentsToSocial", foreign_key: "socialmedia_id", dependent: :destroy

end
