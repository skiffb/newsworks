require 'rails_helper'



feature "User creates post" do
  scenario "with a new event" do
    Rails.application.load_seed

    sign_up("person@example.com")

    create_new_event("New Event", "Technology", "Pittsburgh, PA")
    build_post("New Event", "Title", "text")
    expect(page).to have_css "h2", text: "New Event"
  end

  scenario "with an existing event" do
    Rails.application.load_seed

    sign_up("person@example.com")

    create_new_event("New Event", "Technology", "Pittsburgh, PA")
    build_post("New Event", "Title", "text")
    expect(page).to have_css "h2", text: "New Event"

    log_out

    sign_up("person2@example.com")

    build_post("New Event", "New Title", "new text")
    expect(page).to have_css "h2", text: "New Event"

  end
end
