class BoardsController < ApplicationController
	def new
		@board = Board.new
		@board.board_categories.new
		@categories = Category.all
		@boards = Board.order(created_at: :desc).first(10)
	end

	def create
		@board = Board.new(board_params)
		@board.user_id = current_user.id
		@board.save
		redirect_to board_path(@board)
	end

	def index
		@categories = Category.all
		#if params[category_id]
		#	@boards = Board.where(category_id: params[category_id])
		#else
		if params[:search]
			@boards = Board.search(params[:search])
		else
			@boards = Board.all.order(created_at: :desc)
		end
		#@boards = Board.includes(:rresponse).where
	end

	def show
		@categories = Category.all
		@board = Board.find(params[:id])
		@response = Response.new
		@responses = @board.responses
	end

	private
	def board_params
		params.require(:board).permit(:user_id, :title, category_ids: [] )

	end
end
