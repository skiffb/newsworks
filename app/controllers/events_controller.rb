class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)
    event.user = current_user
    event.category = Category.find_by(title: params[:event][:category])
    event.save

    if event.save
      respond_to do |format|
        format.html { redirect_to new_post_path }
        format.js            # render a view, but the view will be a javascript!
      end
    else
      respond_to do |format|
        format.html { render 'posts/new' }
        format.js
      end
    end

  end

  def show
  end

  private

  def event_params

    params.require(:event).permit(:title, :address)

  end
end
