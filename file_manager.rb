class FileManager

	attr_accessor :file_name

	def initialize(file_name)
		@file_name = file_name
	end

	#Creates a new file if it doesnt alread exist
	def get_last_id_from_file
		file = File.open(@file_name, 'a+')
		id = file.gets
		file.close
		puts "get_last_id_from_file => #{id}"
		id.strip unless id.nil?
	end

	def set_last_id_in_file(id)
		File.open(@file_name, 'w') do |file|
			file.puts id
		end
		puts "set_last_id_in_file => #{id}"
	end	


end 