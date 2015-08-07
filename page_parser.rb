
#file: page_parser.rb

require 'nokogiri'
require 'open-uri'

class PageParser

	attr_accessor :post
	attr_accessor :post_selector

	def initialize(url, post_selector)
		#TODO Treat exception
		@page = Nokogiri::HTML(open(url))
		@post_selector = post_selector
		@post = get_last_post
	end

	def get_last_post
		posts = @page.css(@post_selector)
		posts[0] unless posts.empty?
	end

	def get_last_post_id
		id = @post['id']
		puts "get_last_post_id => #{id}"
		id
	end

	def get_description
		@post.css('a')[0]['title']
	end
end