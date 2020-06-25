class CategoriesController < ApplicationController
	def show
		@categories = Category.all
		@category = Category.find(params[:id])
		@boards = BoardCategory.where(category_id: params[:id])
	end

end
