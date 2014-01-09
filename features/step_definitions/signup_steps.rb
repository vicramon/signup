Given(/^there is a published signup form$/) do
  create_user_with_account
  @form = Fabricate(:form, account: @account, published: true)
end

When(/^I visit that signup form$/) do
  visit signup_path(@form)
end

When(/^I click on a slot$/) do
  all("table#slots a").first.click
end

When(/^I fill out the signup form$/) do
  fill_in "Name", with: 'Billy Ray'
  fill_in "Email", with: 'bill@example.com'
  click_button "Signup"
end

Then(/^I should be signed up for that slot$/) do
  new_signup = Signup.last.user
  new_signup.name.should == 'Billy Ray'
  new_signup.email.should == 'Billy Ray'
end
