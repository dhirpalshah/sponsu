class CreateStudentsToSocials < ActiveRecord::Migration[7.0]
  def change
    create_table :students_to_socials do |t|
      t.integer :student_id
      t.integer :socialmedia_id
      t.string :socialmedia_url

      t.timestamps
    end
  end
end
