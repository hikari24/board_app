class SearchController < ApplicationController
	def search
		@model = params["search"]["model"]
    	@content = params["search"]["content"]
    	#@datas = search_for(@model, @content)
    	@categories = Category.all
	end

end
