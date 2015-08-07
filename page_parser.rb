
#file: page_parser.rb

require 'nokogiri'
require 'open-uri'

class PageParser

	attr_accessor :post

	def initialize
		#TODO Treat exception
		@page = Nokogiri::HTML(open(get_url))
		@post = get_last_post
	end

	def get_last_post
		posts = @page.css(get_post_selector)
		posts[0] unless posts.empty?
	end

	def get_last_post_id
		id = get_post_id
		puts "get_last_post_id => #{id}"
		id
	end

	def get_description
		throw_not_implemented_error
	end



	private

	def get_url
		throw_not_implemented_error
	end

	def get_post_selector
		throw_not_implemented_error		
	end

	def get_post_id
		throw_not_implemented_error		
	end

	def throw_not_implemented_error
		raise NotImplementedError, 'Ask the subclass'
	end

end