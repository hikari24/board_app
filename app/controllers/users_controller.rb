class UsersController < ApplicationController
	before_action :set_category, only: [:show, :edit]
	before_action :authenticate_user!, only: [:show, :edit, :update]
	before_action :correct_user, only: [:edit, :update]

	def set_category
		@categories = Category.all
	end

	def show
		@user = User.find(params[:id])
		@boards = @user.boards
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		redirect_to user_path(@user.id)
		else
		render 'edit'
		end
	end

	private

  	def user_params
  		params.require(:user).permit(:name, :introduction)
  	end

  	def correct_user
      @user = User.find(params[:id])
      redirect_to user_path(current_user) unless @user == current_user
  	end


end
