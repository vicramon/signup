Given(/^there is a published signup form with slots$/) do
  create_user_with_account
  @form = Fabricate(:form, account: @account, published: true)
  @slot1 = Fabricate(:slot, form: @form, name: 'Chicken', max: 5)
  @slot2 = Fabricate(:slot, form: @form, name: 'Steak', max: 5)
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
  rsvp = Rsvp.last
  user = Rsvp.last.user
  user.name.should == 'Billy Ray'
  user.email.should == 'bill@example.com'
  rsvp.form.should == @form
  rsvp.slot.should == @slot1
end
