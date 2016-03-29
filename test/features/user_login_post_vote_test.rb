require "test_helper"

class UserLoginPostVoteTest < Capybara::Rails::TestCase

  setup do
    User.create! username: "tester123@domain.com", email: "tester123@domain.com", password: "12345678", id: "99"
    User.create! username: "tester1234@domain.com", email: "tester1234@domain.com", password: "12345678", id: "98"
    Post.create! title: "Test Post", content: "Test Content", user_id: "98"
  end

  test "can create a new user" do
    visit root_path
    click_link "Sign Up"

    within("#new_user") do
      fill_in "Email", with: "tester@domain.com"
      fill_in "Password", with: "12345678"
      fill_in "Password confirmation", with: "12345678"
      click_button "Sign up"
    end
    assert_content page, "Welcome! You have signed up successfully."
  end

  test "can login" do
    visit root_path
    click_link "Sign In"

    within("#new_user") do
      fill_in "Email", with: "tester123@domain.com"
      fill_in "Password", with: "12345678"
      click_button "Log in"
    end
    assert_content page, "Signed in successfully."
  end

  test "can vote" do
    visit root_path
    click_link "Sign In"

    within("#new_user") do
      fill_in "Email", with: "tester123@domain.com"
      fill_in "Password", with: "12345678"
      click_button "Log in"
    end
    click_link "thumb_up"
    assert_content page, "1 vote"
  end

  test "can add comment" do
    visit root_path
    click_link "Sign In"

    within("#new_user") do
      fill_in "Email", with: "tester123@domain.com"
      fill_in "Password", with: "12345678"
      click_button "Log in"
    end

    click_link "Test Post"

    within("#new_comment") do
      fill_in "What do you think?", with: "Test comment"
      click_button "Create Comment"
    end
    assert_content page, "Test comment - less than a minute ago by tester123@domain.com"
  end
end
