Rails.application.routes.draw do

  get 'license/index'

  root 'posts#index'

  get '/posts' => 'posts#index', as: :posts
  get '/posts/new'=> 'posts#new', as: :new_post
  get '/posts/:id' => 'posts#show', as: :post
  post '/posts' => 'posts#create'
  get '/posts/:id/edit' => 'posts#edit', as: :edit_post
  patch '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#delete'

  get '/license' => 'license#index', as: :license
end
