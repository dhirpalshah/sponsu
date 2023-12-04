class CreateStudentToEthnicities < ActiveRecord::Migration[7.0]
  def change
    create_table :student_to_ethnicities do |t|
      t.integer :student_id
      t.integer :ethnicity_id

      t.timestamps
    end
  end
end
