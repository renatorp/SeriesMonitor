require 'rubygems'

require_relative 'dbz_page_parser'
require_relative 'file_manager'

class SeriesMonitor

	def initialize(parser)
		@parser = parser
	end

	def notify_user(title)
		puts "Episode available: #{title}"
	end

	
	def start

		#Creates file manager
		file_manager = FileManager.new @parser.get_name

		#Obtains id of last published post
		last_id = @parser.get_last_post_id

		#Obtains last retrieved id
		last_stored_id = file_manager.get_last_id_from_file


		#If there is a id store localy, check whether it's the same as the last post's
		if last_stored_id.nil? or last_stored_id != last_id
			notify_user @parser.get_description
			file_manager.set_last_id_in_file last_id
		end
	end

end

#Creates parser
parser = DBZPageParser.new()

series_monitor = SeriesMonitor.new parser
series_monitor.start

