class HomeController < ApplicationController
  def top
  	@boards = Board.order(created_at: :desc).first(10)
  end
end
