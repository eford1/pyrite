require 'csv'

CSV_DATA_FILE = "db/data/gb1_2.csv"
NAME_ATTR = "Name"
AGE_ATTR = "Age"

namespace :fix_data do
  desc "generate seed data from existing local db" 
  task :fix_age => :environment do

    contestant_data = CSV.parse(File.read(Rails.root.join(CSV_DATA_FILE)), headers: true)

    # currently assumes each name is unique
    contestant_data.each do |row|
      p = Person.find_by(name: row[NAME_ATTR])
      c = Contestant.find_by(person_id: p.id)
      c.age = row[AGE_ATTR]
      c.save!
    end
  end
end