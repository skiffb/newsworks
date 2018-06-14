require 'rails_helper'



feature "User creates post" do
  scenario "with a new event" do
    Rails.application.load_seed

    build_my_post
    expect(page).to have_css "h2", text: "My Event"
  end

  scenario "with an existing event" do
    Rails.application.load_seed

    build_my_post

    log_out

    sign_up("person2@example.com")

    build_post("My Event", "New Title", "new text")
    expect(page).to have_css "h2", text: "My Event"

  end
end
