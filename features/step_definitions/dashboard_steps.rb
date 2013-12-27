Given(/^I am signed in$/) do
  user = Fabricate(:user)
  @account = Fabricate(:account)
  @account.add_member(user)
  visit sign_in_path
  fill_in :email, with: user.email
  fill_in :password, with: 'password'
  click_button "Sign In"
end

Given(/^I have created signups$/) do
  Fabricate(:form, account: @account, published: true, name: 'Published')
  Fabricate(:form, account: @account, name: 'Draft')
end

When(/^I visit the dashboard$/) do
  visit dashboard_path
end

Then(/^I should see those signups$/) do
  page.should have_content 'Published'
  page.should have_content 'Draft'
end
