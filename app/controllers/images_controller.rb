class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
    @comment = Comment.new
    @comments = @image.comments.recent
    @groups = Group.all
    @tags = Tag.all
  end

  def new
    @gallery = current_user.galleries.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    @gallery = current_user.galleries.find(params[:gallery_id])
    @image = @gallery.images.new(image_params)

    if @image.save
      redirect_to @gallery
    else
      render :new
    end
  end

  def edit
    @image = current_user.images.find(params[:id])
    @tag = Tag.new
  end

  def update
    @image = current_user.images.find(params[:id])

    if @image.update(image_params)
      redirect_to @image
    else
      render :edit
    end
  end

  private

  def image_params
    params.require(:image).permit(
     :url,
     tag_ids: [],
     group_ids: [],
  
    )
  end
end
