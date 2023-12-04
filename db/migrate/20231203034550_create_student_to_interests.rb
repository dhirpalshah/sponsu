class CreateStudentToInterests < ActiveRecord::Migration[7.0]
  def change
    create_table :student_to_interests do |t|
      t.integer :student_id
      t.integer :interest_id

      t.timestamps
    end
  end
end
