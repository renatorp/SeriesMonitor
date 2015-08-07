require 'fileutils'

class FileManager

	attr_accessor :file_path

	def initialize(file_name)
		
		#File is created in the home directory
		dir = File.join(ENV['HOME'],'.seriesmonitor/')
		FileUtils::mkdir_p dir

		@file_path =  "#{dir}/#{file_name}.txt"
	end

	#Creates a new file if it doesnt alread exist
	def get_last_id_from_file
		file = File.open(@file_path, 'a+')
		id = file.gets
		file.close
		puts "get_last_id_from_file => #{id}"
		id.strip unless id.nil?
	end

	def set_last_id_in_file(id)
		File.open(@file_path, 'w') do |file|
			file.puts id
		end
		puts "set_last_id_in_file => #{id}"
	end	


end 