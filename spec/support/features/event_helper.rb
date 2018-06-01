module Features
  def create_new_event(title, category, address)
    click_on "New Post"
    click_on "New Event"
    fill_in "Title", with: title
    select category, from: "Category"
    fill_in "Address", with: address
    click_on "Create Event"

  end


end
