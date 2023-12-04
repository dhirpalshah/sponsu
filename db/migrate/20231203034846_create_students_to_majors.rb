class CreateStudentsToMajors < ActiveRecord::Migration[7.0]
  def change
    create_table :students_to_majors do |t|
      t.integer :student_id
      t.integer :major_id

      t.timestamps
    end
  end
end
