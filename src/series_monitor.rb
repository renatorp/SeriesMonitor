# encoding: utf-8

require 'rubygems'
require 'file_manager'

class SeriesMonitor

	DEFAULT_INTERVAL = 7200

	attr_accessor :interval
	attr_accessor :notification_callback

	def initialize(parser)
		@parser = parser
	end

	def call_notification_callback(message, link = nil)
		if notification_callback
			notification_callback.call(message, link)
		end
	end

	def notify(title, link)
		puts "Episode available: #{title}"
		call_notification_callback("Novo episódio disponível: #{title}", link)
	end

	def notifyError(message)
		msg = "An error ocurred: #{message}"
		puts msg
		call_notification_callback msg
	end

	def start

		#Creates file manager
		file_manager = FileManager.new @parser.get_name


		while true
			begin
				@parser.parse

				#Obtains id of last published post
				last_id = @parser.get_last_post_id

				#Obtains last retrieved id
				last_stored_id = file_manager.get_last_id_from_file


				#If there is a id store localy, check whether it's the same as the last post's
				if last_stored_id.nil? or last_stored_id != last_id
					notify(@parser.get_description,@parser.get_link)
					file_manager.set_last_id_in_file last_id
				end

			rescue Exception => e
				notifyError(e.message)
			end

			sleep @interval || DEFAULT_INTERVAL
		end
	end

end

