class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.password == @user.password_confirmation
			@user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			redirect_to new_user_path
		end
	end



private

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end


end