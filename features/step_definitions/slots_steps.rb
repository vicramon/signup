Given(/^I have a signup$/) do
  @form = Fabricate(:form, account: @user.accounts.first)
end

When(/^I go to the slots page$/) do
  visit form_slots_path(@form)
end

When(/^I add slots$/) do
  all("input[type='text']").first.set "great slot"
  find("#new_slot input[type='submit']").click
end

Then(/^I should see those slots$/) do
  visit form_slots_path(@form)
  all("input[type='text']").first.value.should == "great slot"
  Slot.last.name.should == "great slot"
end

Given(/^I have a signup with slots$/) do
  step 'I have a signup'
  @form.slots.create(name: 'my slot', max: 2)
end

When(/^I delete a slot$/) do
  click_link "remove"
end

Then(/^I should not see that slot$/) do
  visit form_slots_path(@form)
  all("input[type='text']").first.value.should_not == "my slot"
end
