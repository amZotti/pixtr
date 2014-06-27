class TagsController < ApplicationController
  def create
    image_id = Image.find(params[:image_id]).id
    tag_names =  (tag_params['name']).split(",")
    tag_names.each do |text|
      new_tag = Tag.create(name:text)
      ImageTagRelationship.create(image_id:image_id, tag_id:new_tag.id)
    end
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
