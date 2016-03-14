require 'httparty'

class Recipe
	include HTTParty

	key_value = ENV['FOOD2FORK_KEY']
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
	base_uri "http://#{hostport}/api"
	default_params  q: "", sort: "", page: "", key: key_value
	format :json

	def self.for (term, sort, page)
		get("/search", query: {q: term, sort: sort, page: page})["recipes"]
	end	

end