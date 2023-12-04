class CreateGenders < ActiveRecord::Migration[7.0]
  def change
    create_table :genders do |t|
      t.integer :gender_name
      t.integer :students_count

      t.timestamps
    end
  end
end
