module Features

  def build_post(event, title, text)
    visit new_post_path
    select event, from: "Event"
    fill_in "Title", with: title
    fill_in "Text", with: text
    click_on "Create Post"
  end

  def build_foreign_post
    sign_up("person2@example.com")

    create_new_event("Newer Event", "Sports", "Pittsburgh, PA")
    build_post("Newer Event", "New Title", "new text")
    expect(page).to have_css "h2", text: "Newer Event"
    log_out
  end


end
