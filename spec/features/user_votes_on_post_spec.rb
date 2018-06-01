require 'rails_helper'

feature "User upvotes post" do
  scenario "succesfully" do
    Rails.application.load_seed
    build_foreign_post

    sign_up("person@example.com")

    click_on "View Feed"
    click_on "Upvote New Title"
    expect(page).to have_css "p", text: "Votes: 1"
  end
end
