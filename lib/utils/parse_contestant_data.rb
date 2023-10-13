puts "hello"
# require 'csv'

# require_relative '../../config/environment'

# FILE_NAME = '../../db/data/gb1_2.csv'

# NAME_ATTR = "Name"
# AGE_ATTR = "Age"
# HOMETOWN_ATTR = "Hometown"
# OCCUPATION_ATTR = "Occupation"
# ELIMINATED_EP_ATTR = "Eliminated episode"

# GOLDEN_BACHELOR_SEASON_ID = 1


# contestant_data = CSV.parse(File.read(FILE_NAME), headers: true)

# # currently assumes each name is unique
# contestant_data.each do |row|
#     person = Person.find_or_create_by(name: row[NAME_ATTR])
#     contestant = Contestant.find_or_create_by(person_id: person.id)
#     contestant.season_id = GOLDEN_BACHELOR_SEASON_ID
#     contestant.hometown = row[HOMETOWN_ATTR]
#     contestant.occupation = row[OCCUPATION_ATTR]
#     contestant.eliminated_ep = row[ELIMINATED_EP_ATTR] || nil

#     person.save!
#     contestant.save!

#     puts "#{contestant.id} - #{person.name} - #{contestant.hometown} - #{contestant.occupation} - #{contestant.eliminated_ep || 'Still here'}"
# end

