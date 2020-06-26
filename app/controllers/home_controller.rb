class HomeController < ApplicationController
  def top
  	@categories = Category.all
  	@boards = Board.order(created_at: :desc).first(10)
  end
end
