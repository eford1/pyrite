require 'csv'

class DataHelper
	def self.convert_ep_num_input!(input)
		if input.nil? || !((input.to_i).is_a? Integer)
      		raise "Please enter a valid integer episode number as an argument"
    	end
    	return input.to_i
	end

	def self.get_data_from_file(file_prefix, ep_num)
		file_name = "#{file_prefix}#{ep_num}.csv"
    	return CSV.parse(File.read(Rails.root.join(file_name)), headers: true)
	end
end