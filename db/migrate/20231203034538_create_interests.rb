class CreateInterests < ActiveRecord::Migration[7.0]
  def change
    create_table :interests do |t|
      t.string :interest_name
      t.integer :student_to_interests_count

      t.timestamps
    end
  end
end
