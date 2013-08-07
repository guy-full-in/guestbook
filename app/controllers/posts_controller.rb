class PostsController < ApplicationController
  def new
  	if user_signed_in?
  	  @post=Post.new
  	else
  	  redirect_to user_session_path
  	end
  end

  def create
  	@post=Post.new
    @post.author=current_user.email
    @post.content=params[:post][:content]
    if @post.save
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end

  def index
  	@posts = Post.page(params[:page]).per(3)
  end
end
