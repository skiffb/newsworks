module Features
  def sign_up(name)
    visit root_path
    click_on "Login"
    click_on "Sign up"
    fill_in "Email", with: name
    fill_in "Password", with: "password", match: :prefer_exact
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"
  end

  def log_out
    click_on "Log out"
  end
end
