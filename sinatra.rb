require 'sinatra'

get '/' do
	"O Hai"	
end

get '/:value' do 
	get_response "#{params[:value]}"
end

post '/addUser/:params' do

end

def get_response (value)
	return "You sent " << value
end

def post_response(data)
end