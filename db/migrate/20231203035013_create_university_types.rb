class CreateUniversityTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :university_types do |t|
      t.string :type_name
      t.integer :university_ids_count

      t.timestamps
    end
  end
end
