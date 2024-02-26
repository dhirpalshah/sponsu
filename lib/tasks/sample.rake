require "csv"

namespace :sample do

  task :clean_students => :environment do
    if Rails.env.development?
      Student.destroy_all
    end
    Student.delete_all
    puts "Sample data has been removed from the students table."
  end
  
  desc "TODO"
  task universities: :environment do
    if Rails.env.development?
      University.destroy_all
    end
    csv_text = File.read(Rails.root.join("lib", "csvs", "National Universities Rankings.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = University.new
      t.name = row["Name"]
      t.location = row["Location"]
      t.population = row["Undergrad Enrollment"].delete(',').to_i
      t.save
      # puts "#{t.population} saved"
    end
  end

  task majors: :environment do
    if Rails.env.development?
      Major.destroy_all
    end
    csv_text = File.read(Rails.root.join("lib", "csvs", "majors-list.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = Major.new
      t.major_name = row["Major"]
      t.major_field = row["Major_Category"]
      t.save
    end
  end

  task genders: :environment do
    if Rails.env.development?
      Gender.destroy_all
    end
    male = Gender.new
    male.gender_name = "Male"
    male.save
    female = Gender.new
    female.gender_name = "Female"
    female.save
    nonbinary = Gender.new
    nonbinary.gender_name = "Nonbinary"
    nonbinary.save
    other = Gender.new
    other.gender_name = "Other"
    other.save
    end

  end
