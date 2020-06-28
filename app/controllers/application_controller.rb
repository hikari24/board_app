class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_search
  before_action :set_category

	def set_search
    @q = Board.ransack(params[:q])
    @boards = @q.result
  end

  def set_category
    @categories = Category.all
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
