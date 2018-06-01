require 'rails_helper'

feature "User views feed" do
  scenario "sees another post initially" do
    Rails.application.load_seed

    build_foreign_post


    sign_up("person@example.com")

    click_on "View Feed"
    expect(page).to have_css "h2", text: "Newer Event"
  end

  scenario "filters by category" do
    Rails.application.load_seed

    build_foreign_post

    sign_up("person@example.com")

    click_on "View Feed"

    select "Technology", from: "Category"
    expect(page).to have_css "h2", text: "Newer Event"
  end

end
