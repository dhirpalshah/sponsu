# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_12_04_213923) do
  create_table "ethnicities", force: :cascade do |t|
    t.string "ethnicity_name"
    t.integer "student_to_ethnicities_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genders", force: :cascade do |t|
    t.text "gender_name"
    t.integer "students_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string "interest_name"
    t.integer "student_to_interests_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "majors", force: :cascade do |t|
    t.integer "major_name"
    t.string "major_field"
    t.integer "students_to_majors_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socialmedia", force: :cascade do |t|
    t.string "socialmedia_name"
    t.integer "students_to_socials_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_to_ethnicities", force: :cascade do |t|
    t.integer "student_id"
    t.integer "ethnicity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_to_interests", force: :cascade do |t|
    t.integer "student_id"
    t.integer "interest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "university_id"
    t.string "name"
    t.string "ethnicity"
    t.date "date_of_birth"
    t.string "graduating_year"
    t.string "profile_pic"
    t.integer "gender_id"
    t.string "home_location"
    t.string "bio"
    t.integer "major_id"
    t.integer "student_to_interests_count"
    t.integer "students_to_socials_count"
    t.integer "student_to_ethnicities_count"
    t.integer "students_to_majors_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "students_to_majors", force: :cascade do |t|
    t.integer "student_id"
    t.integer "major_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students_to_socials", force: :cascade do |t|
    t.integer "student_id"
    t.integer "socialmedia_id"
    t.string "socialmedia_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "university_ids", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "type_id"
    t.integer "population"
    t.string "region"
    t.integer "students_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "university_types", force: :cascade do |t|
    t.string "type_name"
    t.integer "university_ids_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
