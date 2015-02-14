require 'sinatra/base'
require 'mongo'
require 'json/ext'

class InterviewServer < Sinatra::Base

  include Mongo

	set :sessions, true

  configure do
    db = Mongo::Connection.new("localhost", 27017).db("todo")
    coll = db["post"]
  end

  createPost = lambda do

  end

  deletePost = lambda do

  end

  updatePost = lambda do
    content_type :json
    id = object_id(params[:id])
    settings.mongo_db['test'].update({:_id => id}, params)
    document_by_id(id)
  end

  getPost = lambda do
    content_type :json
    document_by_id(params[:id])
  end

  findOne = lambda do
    doc = coll.find_one()
    return doc
  end

    #routes
    post '/create/', &createPost
    post '/delete/', &deletePost
    post '/update/', &updatePost
    get '/get/', &getPost
    get '/findone/' & findOne

  helpers do
    def object_id val
      BSON::ObjectId.from_string(val)
    end

    def document_by_id id
      id = object_id(id) if String === id
      settings.mongo_db['test'].
        find_one(:_id => id).to_json
    end
  end

end