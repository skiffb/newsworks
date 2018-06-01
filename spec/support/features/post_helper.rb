module Features

  def build_post(event, title, text)
    select event, from: "Event"
    fill_in "Title", with: title
    fill_in "Text", with: text
    click_on "Create Post"
  end


end
