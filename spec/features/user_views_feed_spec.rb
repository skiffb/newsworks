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

    build_my_post

    click_on "View Feed"

    select "Technology", from: "Category"
    click_on "Search By Category"

    expect(page).to have_css "h2", text: "Newer Event"
    expect(page).not_to have_css "h2", text: "New Event"
  end

  scenario "filters by event" do
    Rails.application.load_seed

    build_foreign_post

    build_my_post

    click_on "View Feed"

    fill_in "Event", with: "Newer Event"
    click_on "Search By Event"

    expect(page).to have_css "h2", text: "Newer Event"
    expect(page).not_to have_css "h2", text: "New Event"
  end

  scenario "filters by address" do
    Rails.application.load_seed

    build_foreign_post

    build_my_post



    click_on "View Feed"

    fill_in "Address", with: "Pittsburgh, PA"
    click_on "Search By Address"

    expect(page).to have_css "h2", text: "Newer Event"
    expect(page).not_to have_css "h2", text: "New Event"
  end

end


