require 'rack-flash'

class UsersController < ApplicationController
	use Rack::Flash

    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'users/show'
    end

    get "/signup" do
        if !logged_in?
            erb :signup
        else
            redirect to '/account'
        end
	end

	post "/signup" do
		user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
		if user.username.blank? || user.email.blank? || user.password.blank? || User.find_by_email(params[:email]) || User.find_by_username(params[:username])
			flash[:message] = "That email is already in use. Please provide a different email."
			redirect to '/signup'
		elsif
			user.save
			redirect "/login"
		else

			redirect "/failure"
		end
    end	

	get "/login" do
        if !logged_in?
		    erb :login
        else 
            redirect to '/account'
        end
	end

  	post '/login' do
    	if params[:username] == "" || params[:email] == "" || params[:password] == ""
      		redirect to '/login'
    	else
      		user = User.find_by_username(params[:username])
			if user && user.authenticate(params[:password])
				user.save
		    	session[:user_id] = user.id
		    	redirect "/account"
			else
		    	flash[:message] = flash[:messsage] = "We're sorry but you may have entered invalid login credentials."
				redirect "/failure"
			end
    	end
	end 

	get "/account" do
		if logged_in?
			erb :account
		else
			redirect "/login"
		end
	end

	get "/failure" do
		erb :failure
	end

	get "/logout" do
        if logged_in?
            session.clear
            redirect to 'login'
        else
            redirect "/"
        end
	end

end