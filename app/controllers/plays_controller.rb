class PlaysController < ApplicationController
	def index
	end
	def create
		song = Song.find(params[:song_id])
		play = Play.create(user: current_user, song: song)
		redirect_to "/songs"
	end

end
