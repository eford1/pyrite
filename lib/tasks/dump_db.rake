namespace :export do
  desc "generate seed data from existing local db" 
  task :export_to_seeds => :environment do

    classes = [Person, Season, Contestant, Note]

    classes.each do |class_name|
      class_name.all.each do |row| 
        excluded_keys = ['created_at', 'updated_at', 'id'] 
        serialized = row
          .serializable_hash
          .delete_if{|key,value| excluded_keys.include?(key)} 
        puts "#{class_name}.create(#{serialized})"
      end
    end
  end
end