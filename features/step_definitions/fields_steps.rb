When(/^I add custom form fields$/) do
  visit form_fields_path(@form)
  within "#new_custom_field" do
    fill_in :field_name, with: 'Cake'
    select 'yes', from: :field_required
  end
  click_button 'Add Custom Field'
end

Then(/^I should see those form fields$/) do
  visit form_fields_path(@form)
  within "table#fields" do
    find("input[type='text']").value.should == 'Cake'
    find("select").find('option[selected]').text.should == 'yes'
  end
end
