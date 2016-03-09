class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts_count = Post.count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.content = params[:post][:content]
    @post.save ? (redirect_to posts_path) : (render :new)
  end

  def show
    @post = Post.find_by id: params[:id]
  end

  def edit
    @post = Post.find_by id: params[:id]
  end

  def update
    @post = Post.find_by id: params[:id]
    @post.title = params[:post][:title]
    @post.content = params[:post][:content]
    @post.save ? (redirect_to posts_path) : (render :edit)
  end

  def delete
    @post = Post.find_by id: params[:id]
    @post.destroy ? (redirect_to posts_path) : (render :edit)
  end
end
