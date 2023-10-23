require 'csv'

namespace :episode_update do
  ELIM_FILE_PREFIX = "db/data/eliminations_ep"
  NOTE_FILE_PREFIX = "db/data/notes_ep"

  NAME_ATTR = "Name"
  REASON_ATTR = "Eliminated reason"
  NOTE_ATTR = "Note"

  desc "mark eliminated contestants for episode by data file" 
  task :eliminations, [:ep_num] => :environment do |t, args|
    ep_num = DataHelper.convert_ep_num_input!(args[:ep_num])

    contestant_data = DataHelper.get_data_from_file(ELIM_FILE_PREFIX, ep_num)

    puts "updating contestants for episode #{ep_num}"
    # currently assumes each name is unique
    contestant_data.each do |row|
      p = Person.find_by(name: row[NAME_ATTR])
      c = Contestant.find_by(person_id: p.id)
      c.eliminated_ep = ep_num
      c.elimination_reason = row[REASON_ATTR]
      c.save!
      puts "#{row[NAME_ATTR]} - #{row[REASON_ATTR]}"
    end
  end

  desc "add notes by data file"
  task :notes, [:ep_num] => :environment do |t, args|
    ep_num = DataHelper.convert_ep_num_input!(args[:ep_num])

    contestant_data = DataHelper.get_data_from_file(NOTE_FILE_PREFIX, ep_num)

    contestant_data.each do |row|
      if row[NAME_ATTR] && row[NOTE_ATTR] 
        p = Person.find_by(name: row[NAME_ATTR])
        c = Contestant.find_by(person_id: p.id)

        # currently we are not recording the episode num with the note but we may in the future
        
        n = Note.new({contestant_id: c.id})
        n.body = row[NOTE_ATTR]
        n.save!
        puts "#{row[NAME_ATTR]} - #{row[NOTE_ATTR]}"
      else
        raise "Invalid note file -- need name and note for each row"
      end
    end
  end
end