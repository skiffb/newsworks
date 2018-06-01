require 'rails_helper'
feature "User views other users post" do
  scenario "successfully" do
    sign_up("person2@example.com")
    Rails.application.load_seed
    create_new_event("Newer Event", "Sports", "Pittsburgh, PA")
    build_post("Newer Event", "New Title", "new text")
    expect(page).to have_css "h2", text: "Newer Event"
    log_out


    sign_up("person@example.com")
    create_new_event("New Event", "Technology", "Pittsburgh, PA")
    build_post("New Event", "Title", "text")
    expect(page).to have_css "h2", text: "New Event"

    click_on "View Feed"
    expect(page).to have_css "h2", text: "Newer Event"
  end
end
