class PostsController < ApplicationController
  def new
  	if user_signed_in?
  	  @post = Post.new
  	else
  	  redirect_to user_session_path
  	end
  end

  def create
  	@post = Post.new
    @post.author = current_user.email
    @post.content = params[:post][:content]
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
  	@posts = Post.page(params[:page]).per(10)
  end

  def edit
    @post = Post.find(params[:id])
    if current_user.email != @post.author
      redirect_to posts_path
    end

  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attribute(:content,params[:post][:content])
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
end
