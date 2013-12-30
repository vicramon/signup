Given(/^I visit the home page$/) do
  visit '/'
end

Given(/^I follow "(.*?)"$/) do |text|
  click_link text
end

Given(/^I press "(.*?)"$/) do |text|
  click_button text
end

Given /^I go to create a new signup$/ do
  visit new_form_path
end

When(/^I fill in the Basic Info$/) do
  fill_in :form_name, with: 'My party'
  fill_in :form_description, with: "It's going to be a blast."
end

When(/^I click to continue$/) do
  all("input[type='submit']").last.click
end

Then /^I should see that my signup is saved as a draft$/ do
  visit dashboard_path
  within "#drafted" do
    page.should have_content "My party"
  end
end
