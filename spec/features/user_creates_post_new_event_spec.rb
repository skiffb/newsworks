require 'rails_helper'
feature "User creates post" do
  scenario "successfully" do
    visit root_path
    sign_up
    Rails.application.load_seed
    create_post_new_event
    expect(page).to have_css "h2", text: "New Event"
  end
end
