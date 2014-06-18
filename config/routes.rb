Rails.application.routes.draw do

root to:"galleries#index"

resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
	resources :images, only: [:new, :create, :edit, :update]
	#get "/images/new" => "images#new"
	#post "/images" => "images#create"
end

#  get "/" => "galleries#index"
#  get "/galleries/new" => "galleries#new"
#  get "/galleries/:id/edit" => "galleries#edit"
#  get({"/galleries/:id" => "galleries#show"})
#  post "/galleries" => "galleries#create"
#  patch "/galleries/:id" => "galleries#update"
#  delete "/galleries/:id" => "galleries#destroy"

#Resource routes OVERVIEW: http://localhost:3000/rails/info/routes
end

