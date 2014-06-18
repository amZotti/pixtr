class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
  	@gallery = Gallery.find(params[:id])
  end

  def new
  	@gallery = Gallery.new
  end

  def create
  	gallery = Gallery.new(gallery_params)
    if gallery.save
  	redirect_to "/galleries/#{gallery.id}"
  else
    @gallery = gallery
    render :new 
  end

  end

  def edit
  @gallery = Gallery.find(params[:id])
  end

  def update
  gallery = Gallery.find(params[:id])
  gallery.update(gallery_params)

  	redirect_to "/galleries/#{gallery.id}"
  end

  def destroy
    gallery = Gallery.find(params[:id])
    gallery.destroy
    redirect_to "/"
  end

  private

  def gallery_params
  params.require(:gallery).permit(
  	#Must use params.require (STRONG PARAMS=>SANITIZATION) to prevent people h4xing our forms. IE adding an admin field 
      :name,
      :description,
      #Extra comma included for git commit messages clarity

  	)
  end

end
