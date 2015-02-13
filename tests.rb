ENV['RACK_ENV'] = 'test'

require 'server'
require 'bacon'
require 'rack/test'

describe 'InterviewServerTests' do 
	extend Rack::Test::Methods

	def app
		Sinatra::Applicaton
	end

	it "can run a test route" do
		get '/test'
		last_respone.should.be.ok
		last_response.body.should.equal "true"
	end

	def contains(string)
		lambda { |obj| include?string}
	end

	
end