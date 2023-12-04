require "csv"

namespace :sample do
  desc "TODO"
  task universities: :environment 
  # todo: figure out how to sample data and put it in Universities!
    csv_text = File.read(Rails.root.join("lib", "csvs", "National Universities Rankings.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = university_id.new
      t.id = row["Rank"].to_i
      t.name = row["Name"]
      t.location = row["Location"]
      t.population = row["Undergrad Enrollment"].to_i
      t.save
      puts "#{t.name} saved"
    end

  end
