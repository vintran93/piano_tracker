require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    if logged_in?
      @songs = Song.where(user_id: current_user.id)
      erb :'/songs/index'
    else  
      redirect to '/login'
    end
  end

  get '/songs/new' do
    if logged_in?
      erb :'/songs/new'
    else
      redirect to '/login'
    end
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

    
  post '/songs' do
    @song = Song.new(params[:song])
    @song.user_id = session[:user_id]
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    genre1 = Genre.find_or_create_by(name: params[:genre][:name])
    @song.genres << genre1
    genre1.save
    @song.save
    
    flash[:message] = "Successfully created song."
    redirect("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      @song.update(params[:song])
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
      genre1 = Genre.find_or_create_by(name: params[:genre][:name])
      @song.genre_ids = params[:genres]
      @song.genres << genre1
      genre1.save
      @song.save
      flash[:message] = "Successfully updated the song."
      redirect("/songs/#{@song.slug}")
  end
  
  delete "/songs/:slug" do
    Song.destroy(params[:slug])
    redirect to "/songs"
  end

end