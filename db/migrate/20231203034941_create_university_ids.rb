class CreateUniversityIds < ActiveRecord::Migration[7.0]
  def change
    create_table :university_ids do |t|
      t.string :name
      t.string :location
      t.integer :type_id
      t.integer :population
      t.string :region
      t.integer :students_count

      t.timestamps
    end
  end
end
