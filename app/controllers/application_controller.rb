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

	helpers do

		def link_to(url,text=url,opts={})
			attributes = ""
			opts.each { |key,value| attributes << key.to_s << "=\"" << value << "\" "}
			"<a href=\"#{url}\" #{attributes}>#{text}</a>"
  		end

		def logged_in?
			!!current_user
		end
	
		def current_user
		  @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
		end
	end

end