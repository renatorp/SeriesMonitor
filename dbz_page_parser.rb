#file: dbz_page_parser.rb

require_relative 'page_parser'

class DBZPageParser < PageParser

	URL = 'http://animalog.tv/cat132'
	POST_SELECTOR = '.post'
	NAME = "DBZS"

	def get_name
		NAME
	end

	def get_url
		URL
	end

	def get_post_selector
		POST_SELECTOR
	end

	def get_post_id
		@post['id']
	end

	def get_description
		@post.css('a')[0]['title']
	end
end