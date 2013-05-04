require 'net/http'
require 'json'

module BooksHelper

	def get_books
		url = "http://api.pearson.com/penguin/classics/v1/books?limit=100&apikey=9079bc8cde2b7eff2394162fd00391a6"
		resp = Net::HTTP.get_response(URI.parse(url))
		data = JSON.parse(resp.body)
		puts(data)
		return data
	end
end
