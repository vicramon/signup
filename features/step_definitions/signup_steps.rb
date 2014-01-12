Given(/^there is a published signup form with slots$/) do
  create_user_with_account
  @form = Fabricate(:form, account: @account, published: true)
end

Given /^that signup form has slots$/ do
  @slot1 = Fabricate(:slot, form: @form, name: 'Chicken', max: 5)
  @slot2 = Fabricate(:slot, form: @form, name: 'Steak', max: 5)
end

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

When(/^I fill out the signup form and custom fields$/) do
  fill_in "Name", with: 'Billy Ray'
  fill_in "Email", with: 'bill@example.com'
  fill_in "Birthday:", with: 'December 3, 1988'
  fill_in "Favorite animal:", with: 'Husky'
  click_button "Signup"
end

Then(/^I should be signed up for that event/) do
  rsvp = Rsvp.last
  user = Rsvp.last.user
  user.name.should == 'Billy Ray'
  user.email.should == 'bill@example.com'
  rsvp.form.should == @form
end

Then(/^I should be signed up for that slot$/) do
  Rsvp.last.slot.should == @slot1
end

Given /^I am already signed up for that event$/ do
  @user.update_attribute(:email, 'bill@example.com')
  @rsvp = Rsvp.create(form: @form, user: @user)
end

Then /^I should see a notice that I am already signed up$/ do
  page.should have_css '.error'
end

Given /^that signup form has custom fields$/ do
  @field1 = Fabricate(:field, form: @form, name: 'Birthday', required: true)
  @field2 = Fabricate(:field, form: @form, name: 'Favorite animal', required: false)
end

Then /^my custom field info should be saved$/ do
  FieldInfo.last.field.should == @field2
  FieldInfo.last.rsvp.should == @rsvp
  FieldInfo.last.info.should == 'Husky'
  FieldInfo.all[-1].field.should == @field1
  FieldInfo.all[-1].rsvp.should == @rsvp
  FieldInfo.all[-1].should == 'December 3, 1988'
end
