class ChangeStringToText < ActiveRecord::Migration[7.0]
  def change
    change_column :genders, :gender_name, :text
  end
end
