class ChangeMajorNameTypeInMajors < ActiveRecord::Migration[7.0]
  def change
    change_column :majors, :major_name, :string
  end
end
