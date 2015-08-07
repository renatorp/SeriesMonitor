require 'rubygems'

require_relative 'page_parser'
require_relative 'file_manager'


URL = 'http://animalog.tv/cat132'
POST_SELECTOR = '.post'

#TODO: generate filename according to serie
FILE_NAME = "last_episode.txt" 


def notify_user(title)
	puts "Episode available: #{title}"
end

#Creates parser
parser = PageParser.new(URL,'.post')

#Creates file manager
file_manager = FileManager.new FILE_NAME

#Obtains id of last published post
last_id = parser.get_last_post_id

#Obtains last retrieved id
last_stored_id = file_manager.get_last_id_from_file


#If there is a id store localy, check whether it's the same as the last post's
if last_stored_id.nil? or last_stored_id != last_id
	notify_user parser.get_description
	file_manager.set_last_id_in_file last_id
end




