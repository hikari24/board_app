class BoardsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def new
		@board = Board.new
		@board.board_categories.new
		@boards = Board.order(created_at: :desc).first(10)
	end

	def create
		@board = Board.new(board_params)
		@board.user_id = current_user.id
		if @board.save
		redirect_to board_path(@board)
		else
		redirect_to new_board_path
		end
	end

	def index
		if params[:q]
			@q = Board.ransack(params[:q])
			@boards = @q.result.page(params[:page]).per(20)
		else
			@boards = Board.all.order(created_at: :desc).page(params[:page]).per(20)
		end
	end

	def show
		@board = Board.find(params[:id])
		@response = Response.new
		@responses = @board.responses.page(params[:page]).per(100)
	end

	private
	def board_params
		params.require(:board).permit(:user_id, :title, { :category_ids=> [] })

	end
end
