class SongsController < ApplicationController
	before_action :require_login
	def index
	  @songs = Song.all
	  @user = User.all

	end
	def create
	  @song = Song.new(artist: params[:artist], title: params[:title], user: current_user)
	  if @song.save
		flash[:success] = "Song added!"
	  else
		flash[:errors] = @song.errors.full_messages
	  end
		redirect_to "/users/#{current_user.id}"
	end
	def show
	  @song = Song.find(params[:id])
	  @users = User.all

	end

end
