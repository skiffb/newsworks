require 'rails_helper'
feature "User signs up" do
  scenario "successfully" do
    visit root_path
    sign_up
    expect(page).to have_css 'h1', text: 'NewsWorks'
    expect(page).to have_css 'h2', text: 'Welcome person@example.com'
  end
end
