require 'sinatra/base'
require 'erb'

class InterviewServer < Sinatra::Base

	set :port, 9000

  testError = lambda do
    unless "#{params[:params]}" == "success"
      status 400 
      return "Error"
    else
      status 200
      return "#{params[:params]}"
	end
  end

  returnConnectedResponse = lambda do
    return "true"
  end

get '/' do
	@test = "hai"
	erb :index
end

  get '/test', &returnConnectedResponse
  post '/test_error_code/:params', &testError

end