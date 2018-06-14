require 'rails_helper'

feature "User votes on post" do
  scenario "upvote" do
    Rails.application.load_seed
    build_foreign_post

    sign_up("person@example.com")

    click_on "View Feed"
    click_on "Upvote Foreign Title"
    expect(page).to have_css "p", text: "Votes: 1"
  end
  scenario "downvote" do
    Rails.application.load_seed
    build_foreign_post

    sign_up("person@example.com")

    click_on "View Feed"
    click_on "Downvote Foreign Title"
    expect(page).to have_css "p", text: "Votes: -1"
  end
end
