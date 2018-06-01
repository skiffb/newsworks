module Features
  def create_new_event
    fill_in "Title", with: "New Event"
    select "Technology", from: "Category"
    fill_in "Address", with: "Pittsburgh, PA"


    # fill_field_by_css("#event_title", "New Event")
    # fill_field_by_css("Technology", "Category")
    # fill_field_by_css("Address", "Pittsburgh, PA")
    click_on "Create Event"

  end

  private

  def fill_field_by_css(css_path, value)
    page.find(css_path).set value
  end

end
