module Features
  def sign_up
    visit root_path
    click_on "Login"
    click_on "Sign up"
    fill_in "Email", with: "person@example.com"
    fill_in "Password", with: "password", match: :prefer_exact
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"
  end
end
