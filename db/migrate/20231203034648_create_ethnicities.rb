class CreateEthnicities < ActiveRecord::Migration[7.0]
  def change
    create_table :ethnicities do |t|
      t.string :ethnicity_name
      t.integer :student_to_ethnicities_count

      t.timestamps
    end
  end
end
