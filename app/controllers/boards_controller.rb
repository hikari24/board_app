class BoardsController < ApplicationController
	def new
		@board = Board.new
		@board.board_categories.new
	end

	def create
		@board = Board.new(board_params)
		@board.user_id = current_user.id
		@board.save
		redirect_to board_path(@board)
	end

	def index
		#if params[category_id]
		#	@boards = Board.where(category_id: params[category_id])
		#else
			@boards = Board.all
		#end
	end

	def show
		@board = Board.find(params[:id])
		@response = Response.new
		@responses = @board.responses
	end

	private
	def board_params
		params.require(:board).permit(:user_id, :title, category_ids: [] )

	end
end
