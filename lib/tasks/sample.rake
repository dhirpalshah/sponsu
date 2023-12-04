require "csv"

namespace :sample do
  
  desc "TODO"
  task universities: :environment do
    # if Rails.env.development?
    #   UniversityId.destroy_all
    # end
    csv_text = File.read(Rails.root.join("lib", "csvs", "National Universities Rankings.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = University.new
      t.name = row["Name"]
      t.location = row["Location"]
      t.population = row["Undergrad Enrollment"].to_i
      t.save
      puts "#{t.name} saved"
    end
  end

  end
