module Features
  def create_post_new_event
    click_on "New Post"
    click_on "New Event"
    create_new_event
    select "New Event", from: "Event"
    fill_in "Title", with: "Title"
    fill_in "Text", with: "This is my post"
    click_on "Create Post"

  end

end
