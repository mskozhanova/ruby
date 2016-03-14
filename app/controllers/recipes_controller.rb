class RecipesController < ApplicationController
  def index
  	@search_term = params[:search]
  	@sort = params["sort"] || 'r'
  	@page = params["page"] || 1
  	if @page.to_i < 1
  		@page = 1
  	end
  	@recipes = Recipe.for(@search_term, @sort, @page)
  end
end
