class ImagesController < ApplicationController
  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    #When we create we redirect; do not render pages
    @image = Image.create(image_params)
    @gallery = Gallery.find(params[:gallery_id])
    if @image.save 
      redirect_to @gallery
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])
  end

  def update
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.find(params[:id])

    if  @image.update(image_params)
    redirect_to @gallery
    else
      render :edit
    end
  

  end

  private
  def image_params
    #image is outterkey
    #permit(url) is the inner key (aka nested key)
    # params.require(:image).permit(:url)=== params[:image][:url]
    params.require(:image).permit(:url).merge(gallery_id: params[:gallery_id])
  end

end
