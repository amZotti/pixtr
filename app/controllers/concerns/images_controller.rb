class ImagesController < ApplicationController
	def new
		@gallery = Gallery.find(params[:gallery_id])
		@images = Image.new
	end


end