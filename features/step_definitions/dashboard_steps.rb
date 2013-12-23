Given(/^I am signed in$/) do
  Fabricate(:user, email: 'user@example.com', password: 'password', password_confirmation: 'password')
  visit sign_in_path
  fill_in :email, with: 'user@example.com'
  fill_in :password, with: 'password'
  click_button "Sign In"
end

Given(/^I have created signups$/) do
  Form.create(name: 'nice published signup', published: true)
  Form.create(name: 'nice drafted signup', published: false)
end

When(/^I visit the dashboard$/) do
  visit dashboard_path
end

Then(/^I should see those signups$/) do
  page.should have_content 'nice published signup'
  page.should have_content 'nice drafted signup'
end
