require 'sinatra/base'

class InterviewServer < Sinatra::Base

  # get '/:value' do 
  #   get_response "#{params[:value]}"
  # end

  # post '/test_error_code/:params' 

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

  get '/test', &returnConnectedResponse
  post '/test_error_code/:params', &testError

  # def get_response (value)
  #   return "You sent " << value
  # end

end
