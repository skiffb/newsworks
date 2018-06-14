require 'rails_helper'

feature "User views feed" do
  scenario "sees another post initially" do
    Rails.application.load_seed

    build_foreign_post


    sign_up("person@example.com")

    click_on "View Feed"
    expect(page).to have_css "h2", text: "Foreign Event"
  end

  scenario "filters by category" do
    Rails.application.load_seed

    build_foreign_post

    build_my_post

    click_on "View Feed"

    select "Technology", from: "Category"
    click_on "Search By Category"

    expect(page).to have_css "h2", text: "Foreign Event"
    expect(page).not_to have_css "h2", text: "My Event"
  end

  scenario "filters by event" do
    Rails.application.load_seed

    build_foreign_post

    build_my_post

    click_on "View Feed"

    fill_in "Event", with: "Foreign Event"
    click_on "Search By Event"

    expect(page).to have_css "h2", text: "Foreign Event"
    expect(page).not_to have_css "h2", text: "My Event"
  end

  scenario "filters by address" do
    Rails.application.load_seed

    build_foreign_post

    build_my_post



    click_on "View Feed"

    fill_in "Address", with: "Pittsburgh, PA"
    click_on "Search By Address"

    expect(page).to have_css "h2", text: "Foreign Event"
    expect(page).not_to have_css "h2", text: "My Event"
  end

  scenario "filters by highest votes" do
    Rails.application.load_seed

    build_foreign_post

    build_my_post



    click_on "View Feed"
    click_on "Upvote Foreign Title"

    select "Highest Votes", from: "Order By"
    click_on "Order"


    expect(page).to have_css "div:first-child/div/h2", text: "Foreign Event"
    expect(page).to have_css "div:last-child/div/h2", text: "My Event"
  end

  scenario "filters by newest posts" do
    Rails.application.load_seed

    build_foreign_post

    build_my_post





    click_on "View Feed"
    click_on "Upvote Foreign Title"

    select "Newest", from: "Order By"
    click_on "Order"


    expect(page).to have_css "div:first-child/div/h2", text: "My Event"
    expect(page).to have_css "div:last-child/div/h2", text: "Foreign Event"
  end

end


