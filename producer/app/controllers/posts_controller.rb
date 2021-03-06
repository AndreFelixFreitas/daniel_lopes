 class PostsController < ApplicationController
  before_filter :load_resources, only: %w(new create edit update)
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    respond_with @posts
  end
  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    respond_with @post
  end
  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    respond_with @post
  end
  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end
  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    flash[:notice] = 'Post was successfully created. ' if @post.save
    respond_with @post
  end
  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    flash[:notice] = 'Post was successfully updated. ' if
      @post.update_attributes(params[:post])
    respond_with @post
  end
  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    respond_with @posts
  end

  private

  def load_resources
    @authors = User.all
    @categories = Category.all
  end
end
