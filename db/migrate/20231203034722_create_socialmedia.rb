class CreateSocialmedia < ActiveRecord::Migration[7.0]
  def change
    create_table :socialmedia do |t|
      t.string :socialmedia_name
      t.integer :students_to_socials_count

      t.timestamps
    end
  end
end
