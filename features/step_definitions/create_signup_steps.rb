Given(/^I visit the home page$/) do
  visit '/'
end

Given(/^I follow "(.*?)"$/) do |link|
  click_link link
end

When(/^I fill in the Basic Info$/) do
  fill_in :title, with: 'My Great Party'
  fill_in :description, with: "It's going to be a blast."
end

When(/^I click to continue$/) do
  all("input[type='submit']").last.click
end

When(/^I fill in the Slots$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I fill in the Form Fields$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I fill in the People$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I publish my signup$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see that my signup was published$/) do
  pending # express the regexp above with the code you wish you had
end
