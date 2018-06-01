require 'rails_helper'
feature "User creates post" do
  scenario "successfully" do
    sign_up("person@example.com")
    Rails.application.load_seed
    create_new_event("New Event", "Technology", "Pittsburgh, PA")
    build_post("New Event", "Title", "text")
    expect(page).to have_css "h2", text: "New Event"
  end
end
