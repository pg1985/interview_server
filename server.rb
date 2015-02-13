require 'sinatra/base'
require 'erb'

class InterviewServer < Sinatra::Base

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

get '/name/:name' do
	@test = "#{params[:name]}"
	erb :index
end

  get '/test', &returnConnectedResponse
  post '/test_error_code/:params', &testError

end