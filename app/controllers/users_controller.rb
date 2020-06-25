class UsersController < ApplicationController
	def show
		@categories = Category.all
		@user = User.find(params[:id])
	end

	private

  	def user_params
  		params.require(:user).permit(:name)
  	end


end
