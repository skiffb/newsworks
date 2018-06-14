module Features

  def build_foreign_post
    sign_up("person2@example.com")

    create_new_event("Foreign Event", "Technology", "Pittsburgh, PA")
    build_post("Foreign Event", "Foreign Title", "foreign text")
    expect(page).to have_css "h2", text: "Foreign Event"
    log_out
  end

  def build_my_post
    sign_up("person@example.com")
    create_new_event("My Event", "Sports", "Sacramento, CA")
    build_post("My Event", "My Title", "my text")
  end

  def build_post(event, title, text)
    visit new_post_path
    select event, from: "Event"
    fill_in "Title", with: title
    fill_in "Text", with: text
    click_on "Create Post"
  end

end
