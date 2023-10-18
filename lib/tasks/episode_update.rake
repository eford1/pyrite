require 'csv'

DATA_FILE_PREFIX = "db/data/eliminations_ep"
NAME_ATTR = "Name"
REASON_ATTR = "Eliminated reason"

namespace :episode_update do
  desc "generate seed data from existing local db" 
  task :eliminations, [:ep_num] => :environment do |t, args|
    if args[:ep_num].nil? || !((args[:ep_num].to_i).is_a? Integer)
      raise "Please enter a valid integer episode number as an argument"
    end

    ep_num = args[:ep_num].to_i

    file_name = "#{DATA_FILE_PREFIX}#{ep_num}.csv"
    contestant_data = CSV.parse(File.read(Rails.root.join(file_name)), headers: true)

    puts "updating contestants for episode #{ep_num}"
    # currently assumes each name is unique
    contestant_data.each do |row|
      puts row[NAME_ATTR]
      p = Person.find_by(name: row[NAME_ATTR])
      c = Contestant.find_by(person_id: p.id)
      c.eliminated_ep = ep_num
      c.elimination_reason = row[REASON_ATTR]
      c.save!
      puts row[REASON_ATTR]
    end




  end
end