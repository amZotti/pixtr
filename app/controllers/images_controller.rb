class ImagesController < ApplicationController
	def new
		@gallery = Gallery.find(params[:gallery_id])
		@image = Image.new
	end

	def create
		#When we create we redirect; do not render pages
		image = Image.create(image_params)
		gallery = Gallery.find(params[:gallery_id])

		redirect_to "/galleries/#{gallery.id}"
	end

	def edit
    @image = Image.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])


	end

	def update
		image = Image.find(params[:id])
		image.update(image_params)
		gallery = Gallery.find(params[:gallery_id])

		redirect_to "/galleries/#{gallery.id}"

	end

	private
	def image_params
		#image is outterkey
		#permit(url) is the inner key (aka nested key)
		 # params.require(:image).permit(:url)=== params[:image][:url]
		params.require(:image).permit(:url).merge(gallery_id: params[:gallery_id])
	end

end