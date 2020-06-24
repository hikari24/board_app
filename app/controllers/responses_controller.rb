class ResponsesController < ApplicationController
	def create
		@board = Board.find(params[:board_id])
		@response = @board.responses.new(response_params)
		@response.user_id = current_user.id
		@response.save
		redirect_to request.referrer || root_url
		#redirect_to boards_path
	end

	private
	def response_params
		params.require(:response).permit(:user_id, :board_id, :content)
	end
end
