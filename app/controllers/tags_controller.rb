class TagsController < ApplicationController
  def new
    @tag = Tag.new()
  end
  def create
    @tag = Tag.create(tag_params) 
    redirect_to "/"
  end

  def show
  @tag = Tag.find(params[:id])
  end


  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
