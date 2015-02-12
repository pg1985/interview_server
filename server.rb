require 'sinatra/base'

class InterviewServer < Sinatra::Base

  get '/:value' do 
    get_response "#{params[:value]}"
  end

  post '/test_error_code/:params' do
    unless "#{params[:params]}" == "success"
      status 400 
      return "Error"
    else
      status 200
      return "#{params[:params]}"
	end
  end

  def returnConnectedRepsonse = lambda do
    return "{'connected': true}"
  end

  get '/test', &returnConnectedResponse

  def get_response (value)
    return "You sent " << value
  end

end
