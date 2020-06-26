class BoardsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]
	before_action :set_category, only: [:new, :index, :show]

	def set_category
		@categories = Category.all
	end

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
		if params[:search]
			@boards = Board.search(params[:search]).page(params[:page])
			@response = Response.search(params[:search])
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
