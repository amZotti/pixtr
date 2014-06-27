class SearchesController < ApplicationController
  def create
    @query_string = Search.new(search_params).query
    @tag = Tag.find_by name: @query_string
    

    if @tag
      redirect_to @tag
    else
      flash[:error] = "Tag " + @query_string + " does not exist"
      redirect_to root_path
    end
  end

  private
  def search_params
    params.require(:search).permit(:query)
  end

end
