class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.event = Event.find_by(title: params[:post][:event])
    post.user = current_user
    post.save
    redirect_to dashboard_path(current_user)
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end


end
