class CreateMajors < ActiveRecord::Migration[7.0]
  def change
    create_table :majors do |t|
      t.integer :major_name
      t.string :major_field
      t.integer :students_to_majors_count

      t.timestamps
    end
  end
end
