require "./config/environment"
require "./app/models/user"


class ApplicationController < Sinatra::Base
	
	configure do
		set :views, "app/views"
		enable :sessions
		set :session_secret, "secret"
	end

	get "/" do
		erb :index
	end

end