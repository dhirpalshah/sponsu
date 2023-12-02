# frozen_string_literal: true

class DeviseCreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.integer :university_id
      t.string :name
      t.string :ethnicity
      t.date :date_of_birth
      t.string :graduating_year
      t.string :profile_pic
      t.integer :gender_id
      t.string :home_location
      t.string :bio
      t.integer :major_id
      t.integer :student_to_interests_count
      t.integer :students_to_socials_count
      t.integer :student_to_ethnicities_count
      t.integer :students_to_majors_count

      t.timestamps null: false
    end

    add_index :students, :email,                unique: true
    add_index :students, :reset_password_token, unique: true
    # add_index :students, :confirmation_token,   unique: true
    # add_index :students, :unlock_token,         unique: true
  end
end
