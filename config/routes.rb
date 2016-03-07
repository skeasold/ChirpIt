Rails.application.routes.draw do

  root 'posts#index'

  get '/posts' => 'posts#index', as: :posts
  get '/posts/new'=> 'posts#new', as: :new_post
  get '/posts/:id' => 'posts#show', as: :post
  post '/posts' => 'posts#create'
  get '/posts/:id/edit' => 'posts#edit', as: :edit_post
  patch '/posts/:id/update' => 'posts#update'
  delete '/posts/:id' => 'posts#delete'

end
