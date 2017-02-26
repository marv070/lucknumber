require 'minitest/autorun'
require 'rack/test'
require_relative '../app.rb'

class TestApp < Minitest::Test
	include Rack::Test::Methods

	def app
		LuckyNumberApp
	end

	def test_ask_to_play_on_entry_page
		get '/'
		assert(last_response.ok?)
		assert(last_response.body.include?('Hello, would you like to play the Lucky Number Game?'))
		assert(last_response.body.include?('<form class="center" action="/intro" method="post"'))
	end

end


	# lucky_number_app> it would be ruby tests/test_app.rb