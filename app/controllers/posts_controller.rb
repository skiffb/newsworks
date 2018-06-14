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

    @events = Event.all
    @categories = Category.all

    if params[:category].present?
      category = Category.find_by(title: params[:category])
      if category
        events = Event.where(category_id: category.id)
        event_ids = []
        events.each { |event| event_ids << event.id }
        @posts = Post.where(event_id: event_ids)
      else
        @posts = Post.all
      end
    elsif params[:event].present?
      event = Event.find_by(title: params[:event])
      if event
        @posts = Post.where(event_id: event.id)
      else
        @posts = Post.all
      end
    elsif params[:address].present?
        event = Event.find_by(address: params[:address])
        if event
          @posts = Post.where(event_id: event.id)
        else
          @posts = Post.all
        end
    else
      @posts = Post.all
    end


    if params[:order].present?
      if params[:order] == "Highest Votes"
        @posts = @posts.sort_by { |post| post.votes }
        @posts.reverse!
      elsif params[:order] == "Newest"
        @posts = @posts.sort_by { |post| post.created_at}
        @posts.reverse!
      end
    else
      @posts = @posts.sort_by { |post| post.votes }
      @posts.reverse!
    end


  end

  def show
  end

  def upvote
    @post = Post.find(params[:post_id])
    @post.update(votes: (@post.votes + 1))
    redirect_to posts_path
  end
  def downvote
    @post = Post.find(params[:post_id])
    @post.update(votes: (@post.votes - 1))
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:post])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(votes: (@post.votes + 1))
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end


end
