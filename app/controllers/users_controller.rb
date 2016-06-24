class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
	
	def new
	end

	def show
		@user = User.find(params[:id])
		@song = Song.find(param[:id])
		@songs = Song.all
	end

	def create
	  @user = User.new user_params
	  if @user.save
		# redirect_to "/users/#{@user.id}"
		flash[:success] = "User was successfully created! Please log in"
		redirect_to new_session_path
	  else
		flash[:errors] = @user.errors.full_messages
		redirect_to new_session_path
	  end
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end

end
