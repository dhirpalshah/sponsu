# == Schema Information
#
# Table name: universities
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
class University < ApplicationRecord
end
