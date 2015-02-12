require 'sinatra'

get '/' do
	"O Hai"	
end

get '/:value' do 
	get_response "#{params[:value]}"
end

post '/addUser/:params' do
	unless "#{params[:params]}" == "success"
		status 400 
		return "Error"
	else
		status 200
		return "#{params[:params]}"
	end
end

def get_response (value)
	return "You sent " << value
end
