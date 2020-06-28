class CategoriesController < ApplicationController
	def show
		@categories = Category.all
		@category = Category.find(params[:id])
		@boards = BoardCategory.where(category_id: params[:id]).page(params[:page]).per(20)
	end

end
