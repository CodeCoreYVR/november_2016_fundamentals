# this way we specify the version of the gem we're going to use. Otherwise
# Ruby is going to pick the latest version of the gem you have installed
gem 'sinatra', '1.4.7'

# loading the Sinatra gem in memory
require 'sinatra'
require 'sinatra/reloader' # this helps automatically restarting the server
                           # every time we make a change to a file

require 'data_mapper'

enable :sessions

# this line sets up DataMapper to look for a file named `blog.db` within the
# same folder as this file (app.rb). The `blog.db` file will contain all the
# data for our database.
DataMapper.setup(:default, "sqlite://#{Dir.pwd}/blog.db")

helpers do
  def protected!
    return if authorized?
    headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
    halt 401, "Not authorized\n"
  end

  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? and @auth.basic? and @auth.credentials and @auth.credentials == ['admin', 'admin']
  end
end


# we create a class here that maps to a table in the database. By convention,
# Data Mapper will use a plural name of the class name for the table name so
# in this case the table name will be `posts`
class Post
  include DataMapper::Resource

  # Serial will be: INTEGER PRIMARY KEY AUTOINCREMENT
  property :id, Serial
  # String will be: VARCHAR(50)
  property :title, String
  # Text will be: TEXT
  property :body, Text

end

# This line will create tables if the tables don't exist. If the tables exist
# the command will add new columns that weren't there before.
DataMapper.auto_upgrade!

# set :port, 1234

get '/' do
  @posts = Post.all

  # by convention this will look for a template called index.erb within the
  # `views` folder, the template is used to generate a string which in this case
  # will be an HTML document that we send back to the client as a response
  erb(:index, { layout: :app_layout })
end

get '/contact' do
  erb(:contact, { layout: :app_layout })
end

get '/posts/new' do
  protected!
  erb(:new, { layout: :app_layout })
end

get '/pick_language/:language' do |language|
  # we can think of the session like a Hash persists across different HTTP
  # requests. Sinatra uses Rack Sessions which uses cookies to implmenet the
  # sessions feature under the hood.
  session[:language] = language
  # redirect back will redirect the user the page they came from
  redirect back
end

post '/posts' do
  protected!
  # params => {"title"=>"my blog post title", "body"=>"the blog post body"}
  @the_title = params[:title]
  @the_body  = params[:body]
  Post.create(params)
  # "Form submitted successfully: #{params}"
  erb(:thank_you, { layout: :app_layout })
end

get '/posts/:id' do |id|
  @post = Post.get(id)
  erb(:show, { layout: :app_layout })
end
