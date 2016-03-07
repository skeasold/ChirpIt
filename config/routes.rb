Rails.application.routes.draw do

  root 'posts#index'

  get '/' => 'posts#index', as: :posts
  get '/new'=> 'posts#new', as: :new_post
  get '/:id' => 'posts#show', as: :post
  post '/' => 'posts#create'
  get '/:id/edit' => 'posts#edit', as: :edit_post
  patch '/:id/update' => 'posts#update'
  delete '/:id' => 'posts#delete'

end
